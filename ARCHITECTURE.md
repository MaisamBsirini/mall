# Mall — System Architecture

**Official architecture reference**  
**Version:** 1.0 · **Last updated:** 2026-06-11

This document explains the complete system: philosophy, data flow, rendering engines, design system, and extension rules. A developer with no prior context should be able to rebuild the same architecture in React, Vue, SwiftUI, or Jetpack Compose by following this guide alone.

**Companion documents:**

- [README.md](README.md) — project overview and quick start
- [docs/storefront_sections_data_contract.md](docs/storefront_sections_data_contract.md) — API payload specification

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Core Philosophy](#2-core-philosophy)
3. [High-Level Architecture](#3-high-level-architecture)
4. [Store Page Architecture](#4-store-page-architecture)
5. [Product Detail Architecture](#5-product-detail-architecture)
6. [Section System](#6-section-system)
7. [Style System](#7-style-system)
8. [Palette System](#8-palette-system)
9. [Typography System](#9-typography-system)
10. [Customization Philosophy](#10-customization-philosophy)
11. [Data Contract Philosophy](#11-data-contract-philosophy)
12. [Store Sections Reference](#12-store-sections-reference)
13. [Product Detail Sections Reference](#13-product-detail-sections-reference)
14. [Variants Philosophy](#14-variants-philosophy)
15. [Template Philosophy](#15-template-philosophy)
16. [Renderer Flow](#16-renderer-flow)
17. [Folder Structure](#17-folder-structure)
18. [How to Port This Project](#18-how-to-port-this-project)
19. [Development Rules](#19-development-rules)
20. [Future Extension Guide](#20-future-extension-guide)

---

## 1. Project Overview

### The problem

Ecommerce and service platforms need mobile storefronts that look different per merchant — different section order, different visual styles, different branding — without shipping a new app build for every store.

### The solution

A **dynamic section-based UI engine**:

- The backend sends a JSON document describing **which sections exist**, **which style each uses**, **whether they are enabled**, and **in what order** they appear.
- Flutter parses that JSON and renders widgets. It does not decide layout, business rules, or content.

### Why dynamic?

| Static app | This project |
|------------|--------------|
| Hardcoded screen order | Order from `order` field |
| One layout per screen | Multiple styles per section |
| Per-merchant forks | One engine, many configurations |
| Colors in widget code | Colors from global palette id |
| Fonts in widget code | Fonts from global typography id |

### Why this architecture was chosen

1. **Separation of concerns** — Laravel owns data; Flutter owns pixels; Admin owns editing.
2. **Scalability** — New sections and styles are additive; engines stay unchanged.
3. **Merchant autonomy** — Reorder, disable, or restyle without app updates.
4. **Portability** — The architecture is framework-agnostic; only the widget layer changes when porting.

---

## 2. Core Philosophy

### Everything is section-based

A page is not a monolithic screen. It is a **list of sections**. Each section is an independent unit with its own:

- Identifier (`id` or `sectionId`)
- Style (`style` or `styleId`)
- Visibility (`enabled`)
- Position (`order`)
- Content (`data`)

Sections can be reordered, disabled, or swapped without touching other sections.

### Everything is style-based

Within each section, the backend selects a **style id** (e.g. `slider_banner`, `team_directory`, `adaptive_chips`). The renderer looks up that id in a **style registry** and instantiates the matching widget.

Styles are visual layouts — not separate pages. Five banner styles are five ways to render the same banner data.

### Everything is palette-based

The merchant selects **one palette id** (e.g. `luxury_dark`). Every section reads colors from `context.ds.palette`. No section defines its own primary color, background, or border.

### Everything is typography-based

The merchant selects **one typography id** (e.g. `elegant_serif`). All text styles resolve through `context.ds.typography`. No section imports fonts directly.

### Everything is driven by backend configuration

| Backend controls | Flutter controls |
|------------------|------------------|
| Section list | Widget tree |
| `enabled` / `order` | Sorting and filtering (mechanical) |
| `style` per section | Registry lookup |
| `data` payloads | Binding data to widgets |
| `palette` / `typography` | Theme resolution |
| Business rules | **Nothing** |

### Flutter only renders

The mobile app:

- ✅ Parses JSON
- ✅ Resolves layout (filter, dedupe, sort, pin banner)
- ✅ Looks up registries
- ✅ Renders widgets
- ✅ Applies global design tokens

The mobile app never:

- ❌ Decides which sections a merchant should have
- ❌ Computes prices, discounts, or availability
- ❌ Enforces attribute semantics (color, size, etc.)
- ❌ Hardcodes section order or styles

---

## 3. High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        LARAVEL API                              │
│  • Store config (design + sections[])                           │
│  • Product detail config (sections[] + data)                    │
│  • Business logic, auth, persistence                            │
└────────────────────────────┬────────────────────────────────────┘
                             │ HTTPS / JSON
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     FLUTTER — PARSE LAYER                       │
│  MerchantStorefrontConfig.fromJson()                            │
│  ProductDetailLayoutConfig.fromJson()                           │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     LAYOUT ENGINE                               │
│  StorefrontLayoutEngine.resolve()                               │
│  ProductDetailLayoutEngine.resolve()                            │
│  filter → dedupe → validate → sort → [pin banner]               │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     SECTION CATALOG                             │
│  StorefrontSectionCatalog.build(sectionId, styleId)             │
│  ProductDetailSectionCatalog.render(sectionId, styleId)         │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     SECTION REGISTRY                            │
│  SectionRegistry (per section)                                  │
│  styles: [...]  buildStyle(styleId) → Widget                    │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     STYLE REGISTRY / RENDERER                   │
│  BannerRenderer, MediaSectionRenderer, …                        │
│  Map<styleId, WidgetBuilder> or switch on styleId               │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                     DESIGN SYSTEM SCOPE                         │
│  palette · typography · tokens · placeholders                   │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                          UI WIDGETS                             │
└─────────────────────────────────────────────────────────────────┘
```

### Responsibility split

| Component | Role |
|-----------|------|
| **Backend** | Authoritative source of truth for config and data |
| **JSON** | Wire format between layers |
| **Layout Engine** | Mechanical resolution of section list |
| **Section Catalog** | Index of all known sections |
| **Section Registry** | Per-section style list + factory function |
| **Style Registry** | Per-section map from style id → widget |
| **Design System** | Global visual identity |
| **UI** | Stateless (or locally interactive) presentation |

---

## 4. Store Page Architecture

### There is no hardcoded store page

The store page is assembled at runtime from the `sections` array in the API response:

```json
{
  "design": {
    "palette": "luxury_dark",
    "typography": "elegant_serif"
  },
  "sections": [
    {
      "id": "banner",
      "name": "Banner",
      "enabled": true,
      "order": 1,
      "style": "slider_banner",
      "data": { }
    },
    {
      "id": "collections",
      "name": "Collections",
      "enabled": true,
      "order": 2,
      "style": "rectangle_cards",
      "data": { "items": [ ] }
    }
  ]
}
```

### Section envelope fields

| Field | Purpose |
|-------|---------|
| `id` | Section type identifier (`banner`, `staff`, …) |
| `name` | Display label (accessibility / admin) |
| `enabled` | `false` → section skipped entirely |
| `order` | Sort key (ascending) |
| `style` | Style registry id for this section |
| `data` | Section-specific content payload |

### Resolution pipeline

Implemented in `StorefrontLayoutEngine.resolve()`:

```
Input sections[]
    │
    ├─ Skip if enabled == false
    ├─ Skip if id is unknown
    ├─ Skip if duplicate id (first wins)
    ├─ Resolve invalid style → section default style
    ├─ Skip if hasRenderableContent == false
    ├─ Sort by order ascending
    └─ Pin banner to index 0
    │
    ▼
Output resolved sections[]
```

### Banner pinning rule

Regardless of `order`, if `banner` is present and enabled, it is **moved to position 0** after sorting. This is the only layout exception — everything else respects backend order exactly.

### Entry point

```dart
StorefrontRenderer(config: merchantConfig)
  → DesignSystemScope.fromConfig(config.design)
  → StorefrontLayoutView(sections: config.layoutSections)
  → StorefrontLayoutEngine.resolve() + StorefrontSectionCatalog.build()
```

**Key files:** `storefront_renderer.dart`, `storefront_layout_engine.dart`, `merchant_storefront_config.dart`

---

## 5. Product Detail Architecture

### Independent sub-sections

Product detail is **not** a single template. It is four reorderable sub-sections:

| `sectionId` | Purpose |
|-------------|-----------|
| `media` | Product images / video |
| `info` | Title, category, description, price |
| `variants` | Generic attribute selectors |
| `reviews` | Product-level ratings and comments |

### Configuration envelope

```json
{
  "design": {
    "palette": "luxury_dark",
    "typography": "elegant_serif"
  },
  "sections": [
    {
      "sectionId": "media",
      "styleId": "hero_full_width",
      "enabled": true,
      "order": 1,
      "data": { "items": [ ] }
    },
    {
      "sectionId": "variants",
      "styleId": "adaptive_chips",
      "enabled": true,
      "order": 2,
      "data": { "attribute_groups": [ ] }
    }
  ]
}
```

Note: Product detail uses `sectionId` / `styleId` (not `id` / `style`) to distinguish it from storefront envelopes.

### Resolution pipeline

`ProductDetailLayoutEngine.resolve()`:

```
filter disabled → skip unknown → dedupe → resolve style → sort by order
```

**No banner pinning.** Any order is valid:

- Media → Info → Variants → Reviews
- Variants → Info → Media → Reviews
- Reviews → Media → Variants → Info

### Entry point

```dart
ProductDetailScreen(sections: entries)
  → ProductDetailLayoutEngine
  → ProductDetailSectionCatalog.render(sectionId, styleId)
```

**Key files:** `product_detail_screen.dart`, `layout_engine.dart`, `section_catalog.dart`, `config.dart`

### Design inheritance

Product detail does **not** have its own theme. It inherits `palette` and `typography` from the store `design` object.

---

## 6. Section System

### What is a Section?

A **section** is a self-contained page region with:

1. **Config model** — parses the section envelope (`*_section_config.dart`)
2. **Data model** — parses the `data` payload (`*_section_data.dart`, `*_item.dart`)
3. **Style ids** — canonical list of valid styles (`styles.dart`)
4. **Registry** — connects section to the global catalog (`*_registry.dart`)
5. **Renderer** — dispatches `style` → widget (`renderer.dart`)
6. **Style widgets** — one file per visual layout (`styles/*.dart`)
7. **Tokens** (optional) — shared spacing/helpers for that section (`*_tokens.dart`)

### Section Registry

`SectionRegistry` (`section_registry.dart`) is the contract every storefront section implements:

```dart
SectionRegistry(
  id: 'banner',
  name: 'Banner',
  styles: BannerStyleId.all,      // authoritative style list
  buildStyle: (styleId) => Widget, // factory
)
```

All registries are collected in `RegisteredSections.all`.

### Section Catalog

`StorefrontSectionCatalog` is the runtime lookup layer:

- `isKnown(sectionId)` — is this id registered?
- `resolveStyleId(sectionId, styleId)` — fallback for invalid styles
- `build(sectionId, styleId)` — returns the widget

`SectionsCatalog` aggregates `RegisteredSections.all` for discovery.

### Section Renderer

Each section folder has a `*Renderer` widget that:

1. Receives `*SectionConfig` (envelope + parsed data)
2. Switches on `config.style` (or uses a builder map)
3. Returns the appropriate style widget

The renderer is **local to the section** — not a global god-switch.

### Section Model (data)

Section **data models** (`BannerSectionData`, `StaffSectionData`, …) parse only the `data` object. They contain no layout logic.

### Why this structure exists

| Concern | Where it lives |
|---------|----------------|
| "What sections exist?" | `RegisteredSections` |
| "What styles does banner support?" | `BannerStyleId.all` |
| "How do I render style X?" | `BannerRenderer` + `styles/` |
| "What fields does banner data have?" | `BannerSectionData` |
| "How is the page assembled?" | `StorefrontLayoutEngine` |

Adding a section never requires editing the layout engine. Adding a style never requires editing other sections.

---

## 7. Style System

### One section, many styles

Every section supports multiple visual layouts. Example — Banner:

| Style id | Visual concept |
|----------|----------------|
| `hero_banner` | Full-width hero image |
| `slider_banner` | Carousel with pagination |
| `minimal_banner` | Compact strip |
| `modern_banner` | Editorial overlay |
| `glass_banner` | Glassmorphism card |

The backend sets `"style": "slider_banner"`. Flutter looks it up and renders `SliderBanner`.

### Registry-driven dispatch

**Storefront pattern** (per-section renderer):

```dart
switch (config.style) {
  case BannerStyleId.hero: return const HeroBanner();
  case BannerStyleId.slider: return const SliderBanner();
  // ...
}
```

**Product detail pattern** (builder map):

```dart
static final _builders = {
  MediaStyleId.heroFullWidth: () => const HeroFullWidthMedia(),
  MediaStyleId.imageCarousel: () => const ImageCarouselMedia(),
};
```

Both patterns keep style dispatch **inside the section module**. There is no app-wide switch on every style id.

### Invalid style handling

If the backend sends an unknown `style`:

1. `StorefrontSectionCatalog.resolveStyleId()` falls back to `registry.defaultStyleId` (first registered style).
2. If still unknown, the renderer shows a safe placeholder (`_UnknownBannerStyle`) or `SizedBox.shrink()`.

### Style ids are strings

Style ids are snake_case strings agreed between Laravel, Flutter, and React Admin. They are listed in each section's `*StyleId.all` constant — the single source of truth.

---

## 8. Palette System

### One palette per store

The merchant selects exactly **one palette id** in the `design` object:

```json
{ "design": { "palette": "luxury_dark", "typography": "elegant_serif" } }
```

### Resolution

```
palette id → PaletteRegistry.get(id) → AppPalette
```

`AppPalette` defines: `primary`, `secondary`, `background`, `surface`, `textPrimary`, `textSecondary`, `accent`, `border`, `success`, `warning`, `isDark`.

### Usage in widgets

```dart
final palette = context.ds.palette;
Container(color: palette.surface, child: Text(..., style: TextStyle(color: palette.textPrimary)))
```

### Rules

- ❌ No `Color(0xFF...)` in section widgets (except inside `PaletteRegistry` definitions)
- ❌ No per-section color themes
- ✅ All sections inherit the same palette through `DesignSystemScope`

**Key files:** `palette_registry.dart`, `palette_ids.dart`, `models/app_palette.dart`, `scope/design_system_scope.dart`

---

## 9. Typography System

### One typography profile per store

```json
{ "design": { "typography": "elegant_serif" } }
```

### Resolution

```
typography id → TypographyRegistry.get(id) → TypographyProfile
  → ResolvedTypography (with palette-aware colors)
```

Profiles define font families and scale roles: `heading`, `title`, `body`, `caption`, etc.

### Usage

```dart
Text('Title', style: context.ds.typography.heading(context))
```

### Rules

- ❌ No direct `GoogleFonts.xxx()` calls in section widgets
- ❌ No per-section font overrides
- ✅ All text uses `context.ds.typography.*`

**Key files:** `typography_registry.dart`, `typography_ids.dart`, `resolved/resolved_typography.dart`

---

## 10. Customization Philosophy

### What merchants customize (via backend / admin)

| Dimension | Field | Effect |
|-----------|-------|--------|
| **Presence** | `enabled` | Show or hide a section |
| **Position** | `order` | Vertical arrangement |
| **Layout** | `style` / `styleId` | Visual style within section |
| **Branding** | `design.palette` | Global colors |
| **Branding** | `design.typography` | Global fonts |
| **Content** | `data` | Text, images, items |

### What Flutter does

Mechanically applies the configuration. No merchant-specific branching in widget code.

### Example: two merchants, one app

**Merchant A** — luxury spa:
```
banner → booking → staff → reviews → social_media
palette: luxury_dark · typography: elegant_serif
```

**Merchant B** — fashion store:
```
banner → collections → categories → offers → certifications
palette: rose_boutique · typography: modern_sans
```

Same `StorefrontRenderer`. Same engines. Different JSON.

---

## 11. Data Contract Philosophy

### Single responsibility per layer

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   LARAVEL    │     │   FLUTTER    │     │ REACT ADMIN  │
│              │     │              │     │              │
│  Data        │────▶│  Rendering   │     │  Editing     │
│  Validation  │ JSON│  Layout      │     │  Preview     │
│  Business    │     │  Registries  │     │  Config UI   │
└──────────────┘     └──────────────┘     └──────────────┘
```

| Layer | Owns |
|-------|------|
| **Laravel** | Database, API, business rules, computed fields |
| **Flutter** | Widget tree, registries, design tokens, layout resolution |
| **React Admin** | Merchant-facing configuration UI |

### Contract location

All field names, types, required/optional rules, and examples live in:

- `docs/storefront_sections_data_contract.md`
- `docs/schemas/*.json`

Flutter data models (`*_section_data.dart`) implement the contract. When the contract changes, update Laravel, Flutter models, and docs together.

### UI fallback rules

When optional fields are missing, Flutter:

- Hides the widget
- Collapses spacing (no empty placeholders)
- Never reserves height for absent content

See the data contract document for per-field fallback tables.

---

## 12. Store Sections Reference

### banner

| | |
|-|-|
| **Purpose** | Promotional hero slides |
| **Styles** | `hero_banner`, `slider_banner`, `minimal_banner`, `modern_banner`, `glass_banner` |
| **Key data** | `items[].image_url`, optional `title`, `subtitle`, `cta_text` |
| **Customization** | Slide content, autoplay; style selects layout |
| **Rendering** | `BannerSectionRegistry` → `BannerRenderer` → `styles/*` |
| **Special rule** | Always pinned to top |

### booking

| | |
|-|-|
| **Purpose** | Appointment booking entry (5-step flow UI) |
| **Styles** | `stacked_step_cards`, `compact_chip_flow`, `timeline_rail_flow`, `split_schedule_flow`, `scroll_wizard_flow` |
| **Key data** | `booking_enabled`, `booking_target`, optional `service_ids`, `staff_ids`, `availability_preview` |
| **Customization** | Enable/disable, CTA label, pre-filters |
| **Rendering** | `BookingSectionRegistry` → `BookingRenderer` |

### staff

| | |
|-|-|
| **Purpose** | Team member introduction (presentation only) |
| **Styles** | `alternating_staff`, `team_directory`, `premium_specialists_grid` |
| **Key data** | `items[].full_name`, `role`, `profile_image_url`, optional `short_bio` |
| **Customization** | Team list, optional section title |
| **Rendering** | `StaffSectionRegistry` → `StaffRenderer` |

### collections

| | |
|-|-|
| **Purpose** | Product/service collection cards |
| **Styles** | `horizontal_circles`, `rectangle_cards`, `split_cards`, `stacked_cards`, `minimal_tiles` |
| **Key data** | `items[].name`, `cover_image`, optional `description` |
| **Customization** | Collection list and images |
| **Rendering** | `CollectionsSectionRegistry` → `CollectionsRenderer` |

### categories

| | |
|-|-|
| **Purpose** | Icon-first navigation categories |
| **Styles** | `icon_hub`, `honeycomb_categories`, `category_ribbons`, `floating_category_cloud`, `category_command_center` |
| **Key data** | `items[].icon`, optional `name` |
| **Customization** | Icons and labels |
| **Rendering** | `CategoriesSectionRegistry` → `CategoriesRenderer` |

### offers

| | |
|-|-|
| **Purpose** | Promotional product offers |
| **Styles** | `compact_horizontal_offer`, `dense_offer_list`, `badge_based_offers`, `image_left_strip`, `minimal_offer_grid` |
| **Key data** | `items[].product_name`, `image`, `discount_percentage` |
| **Customization** | Offer list |
| **Rendering** | `OffersSectionRegistry` → `OffersRenderer` |

### reviews

| | |
|-|-|
| **Purpose** | Store-level rating summary and review list |
| **Styles** | `review_dashboard`, `floating_rating_header`, `featured_rating_hero`, `rating_sidebar`, `editorial_timeline_reviews` |
| **Key data** | `average_rating`, `review_count`, `distribution`, `items[]` |
| **Customization** | Summary stats and review entries |
| **Rendering** | `ReviewsSectionRegistry` → `ReviewsRenderer` |

### location

| | |
|-|-|
| **Purpose** | Text-only location display |
| **Styles** | `corner_location_badge`, `floating_location_pill`, `location_bubble`, `location_ribbon`, `header_location_chip` |
| **Key data** | `text`, optional `detail` |
| **Customization** | Location strings only (no map URLs) |
| **Rendering** | `LocationSectionRegistry` → `LocationRenderer` |

### social_media

| | |
|-|-|
| **Purpose** | External social profile links |
| **Styles** | `minimal_social_chips`, `floating_icon_grid`, `compact_profile_strip`, `elegant_card_stack`, `bottom_social_dock` |
| **Key data** | `items[].platform`, `profile_url` |
| **Customization** | Platform links |
| **Rendering** | `SocialSectionRegistry` → `SocialRenderer` |

### certifications

| | |
|-|-|
| **Purpose** | Trust credentials as image galleries |
| **Styles** | `certificate_wall`, `achievement_gallery`, `awards_showcase`, `masonry_achievements`, `premium_carousel` |
| **Key data** | `items[].title`, `images[]` |
| **Customization** | Credential images |
| **Rendering** | `CertificationsSectionRegistry` → `CertificationsRenderer` |

---

## 13. Product Detail Sections Reference

### media

| | |
|-|-|
| **Purpose** | Product image and video gallery |
| **Styles** | `hero_full_width`, `image_carousel`, `swipe_gallery`, `stacked_gallery`, `card_gallery` |
| **Key data** | `items[].type` (`image` \| `video`), `url`, `sort_order` |
| **Renderer** | `MediaSectionRenderer` (builder map) |

### info

| | |
|-|-|
| **Purpose** | Product title, category, description, price |
| **Styles** | `large_title_stack`, `compact_header`, `overlay_info`, `editorial_card`, `minimal_centered` |
| **Key data** | Optional `title`, `category`, `description`, `price` object |
| **Renderer** | `InfoSectionRenderer` |

### variants

| | |
|-|-|
| **Purpose** | Generic attribute selection UI |
| **Styles** | `adaptive_chips`, `horizontal_scroll`, `card_selector`, `segmented_pills`, `expandable_list` |
| **Key data** | `attribute_groups[]` with dynamic `label` and `options[]` |
| **Renderer** | `VariantsSectionRenderer` |

### reviews

| | |
|-|-|
| **Purpose** | Product-level ratings and review list |
| **Styles** | `rating_summary`, `compact_reviews_list`, `featured_review_card`, `review_timeline`, `minimal_rating_strip` |
| **Key data** | Same simplified model as storefront reviews |
| **Renderer** | `ReviewsSectionRenderer` |

---

## 14. Variants Philosophy

### Completely generic

The variants system **never assumes** attribute semantics:

| ❌ Never assumed | ✅ Instead |
|-----------------|-----------|
| Color | Backend sends `label: "Color"` or any string |
| Size | Backend sends `label: "Size"` or `"Volume"` |
| Material | Backend sends `label: "Material"` |
| Weight, capacity, storage | All are just `attribute_groups[].label` |

### Data shape

```json
{
  "attribute_groups": [
    {
      "id": "group_volume",
      "label": "Volume",
      "options": [
        { "id": "opt_50ml", "label": "50ml", "available": true }
      ]
    }
  ],
  "default_selections": {
    "group_volume": "opt_50ml"
  }
}
```

### Flutter behavior

- Renders one selector UI per `attribute_group`
- Displays `label` as the group heading (whatever the backend sends)
- Renders `options[].label` as chip/card text
- Disables options where `available == false`
- Adapts to 0, 1, or N groups automatically
- Style (`adaptive_chips`, `segmented_pills`, …) only changes **how** selectors look, not **what** they mean

### UI adaptation

| Scenario | Behavior |
|----------|----------|
| 0 attribute groups | Section collapses |
| 1 group, 2 options | Compact chip row |
| 3 groups, 5 options each | Scrollable / expandable layout |
| Missing `default_selections` | First available option highlighted |

---

## 15. Template Philosophy

### No fixed page

There is no `StorePageTemplateA` or `ProductDetailTemplateB`. There are:

- **Engines** that resolve section lists
- **Registries** that map ids to widgets
- **Configurations** that differ per merchant

### Same engine, different merchants

```
Merchant A config ──┐
Merchant B config ──┼──▶ StorefrontLayoutEngine ──▶ Widget tree
Merchant C config ──┘
```

### Visual merging

Some styles visually combine sections (e.g. overlay info on media). Internally, sections remain **independent** in the configuration — only the visual composition changes. The backend can place `info` immediately after `media` with `overlay_info` style to achieve a merged look without a combined data model.

---

## 16. Renderer Flow

### Complete end-to-end flow

```
┌─────────┐
│   API   │  GET /stores/{id}/storefront
└────┬────┘
     │ JSON body
     ▼
┌─────────────┐
│   Parse     │  MerchantStorefrontConfig.fromJson()
└────┬────────┘
     │ config object
     ▼
┌─────────────┐
│  Template   │  StorefrontRenderer
│  (scope)    │  wraps DesignSystemScope.fromConfig(design)
└────┬────────┘
     │
     ▼
┌─────────────┐
│  Renderer   │  StorefrontLayoutView
└────┬────────┘
     │
     ▼
┌─────────────┐
│   Engine    │  StorefrontLayoutEngine.resolve(sections)
│             │  → filtered, sorted, banner-pinned list
└────┬────────┘
     │ for each entry
     ▼
┌─────────────┐
│   Section   │  StorefrontSectionCatalog.build(id, style)
│   Registry  │  → registry.buildStyle(styleId)
└────┬────────┘
     │
     ▼
┌─────────────┐
│    Style    │  BannerRenderer / StaffRenderer / …
│   Registry  │  switch or map on styleId
└────┬────────┘
     │
     ▼
┌─────────────┐
│   Widget    │  HeroBanner, TeamDirectory, …
│             │  reads context.ds.palette / typography
│             │  reads section data from config
└─────────────┘
```

### Product detail flow (parallel)

```
API JSON → ProductDetailLayoutConfig.fromJson()
         → ProductDetailScreen
         → ProductDetailLayoutEngine.resolve()
         → ProductDetailSectionCatalog.render(sectionId, styleId)
         → MediaSectionRenderer.build(styleId) / etc.
         → Style widget
```

---

## 17. Folder Structure

```
mall/
├── README.md                          # Project overview
├── ARCHITECTURE.md                    # This document
├── docs/
│   ├── storefront_sections_data_contract.md
│   ├── storefront_sections_examples.json
│   └── schemas/                       # Per-section data payloads
│
└── lib/
    ├── main.dart                      # App entry, routing
    │
    ├── design_system/                 # GLOBAL VISUAL IDENTITY
    │   ├── app_design_system.dart     # Resolves palette + typography
    │   ├── merchant_design_config.dart
    │   ├── models/                    # AppPalette, TypographyProfile
    │   ├── registries/                # PaletteRegistry, TypographyRegistry, ids
    │   ├── resolved/                  # ResolvedTypography
    │   ├── tokens/                    # DesignTokens (spacing, radii, shadows)
    │   ├── scope/                     # DesignSystemScope (InheritedWidget)
    │   └── widgets/                   # Shared placeholder widgets
    │
    ├── sections/                      # TEMPLATE ENGINES + SECTION MODULES
    │   ├── section_registry.dart      # SectionRegistry contract
    │   ├── registered_sections.dart   # Master list of storefront sections
    │   ├── sections_catalog.dart      # Discovery / lookup
    │   ├── storefront_section_catalog.dart
    │   ├── storefront_layout_engine.dart
    │   ├── storefront_layout_config.dart
    │   ├── storefront_renderer.dart   # Store page entry point
    │   ├── merchant_storefront_config.dart
    │   ├── storefront_section_entry.dart
    │   ├── storefront_layout_presets.dart  # Default config bootstrap
    │   │
    │   ├── banner/                    # SECTION MODULE (repeat per section)
    │   │   ├── styles.dart            # BannerStyleId.all
    │   │   ├── banner_registry.dart   # SectionRegistry instance
    │   │   ├── banner_section_config.dart
    │   │   ├── banner_section_data.dart
    │   │   ├── banner_item.dart
    │   │   ├── renderer.dart          # Style dispatch
    │   │   ├── banner_tokens.dart
    │   │   └── styles/                # One widget per style
    │   │
    │   ├── booking/ … staff/ … collections/ … (same pattern)
    │   │
    │   └── product_detail/            # PRODUCT DETAIL ENGINE
    │       ├── config.dart            # Section entry model
    │       ├── layout_engine.dart
    │       ├── product_detail_screen.dart
    │       ├── section_catalog.dart
    │       ├── product_detail_section_ids.dart
    │       ├── media/                 # Sub-section module
    │       │   ├── styles.dart
    │       │   └── renderer.dart
    │       ├── info/ … variants/ … reviews/
    │       └── styles/                # Style widgets per sub-section
    │
    ├── product_list/                  # FIXED NAVIGATION DESTINATIONS
    │   ├── product_list_navigator.dart
    │   ├── screens/                   # 4 list layout types
    │   └── widgets/                   # Modal sheet wrapper
    │
    ├── modules/home/                  # LEGACY MALL EXPLORER (pre-template)
    │   ├── views/                     # 3D area view, store carousel
    │   ├── controllers/
    │   └── widgets/
    │
    ├── data/                          # Mall explorer models/repos
    └── core/                          # Constants, network, shared widgets
```

### What belongs where

| Folder | Belongs | Does not belong |
|--------|---------|-----------------|
| `design_system/` | Palettes, typography, tokens, scope | Section-specific layouts |
| `sections/{name}/` | One section's full module | Cross-section logic |
| `sections/product_detail/` | PD layout engine + 4 sub-sections | Storefront sections |
| `product_list/` | Fixed list navigation UI | Dynamic section config |
| `modules/home/` | Legacy mall shell | Template engine code |
| `docs/` | API contracts | Flutter implementation |

---

## 18. How to Port This Project

The architecture is **framework-independent**. Only the widget layer changes.

### Step 1 — Reproduce the contract

Copy `docs/storefront_sections_data_contract.md` and `docs/schemas/`. These define every field Laravel sends. This is identical in every port.

### Step 2 — Build the design system

| Flutter | React | Vue | SwiftUI | Compose |
|---------|-------|-----|---------|---------|
| `DesignSystemScope` | React Context | provide/inject | Environment | CompositionLocal |
| `AppPalette` | CSS variables / theme object | SCSS variables | Color set struct | MaterialTheme colors |
| `ResolvedTypography` | Typography scale object | Font classes | Font modifiers | TextStyle hierarchy |

One palette id + one typography id resolve to a theme object consumed by all components.

### Step 3 — Build registries

```typescript
// React example
const bannerRegistry: SectionRegistry = {
  id: 'banner',
  styles: ['hero_banner', 'slider_banner', ...],
  buildStyle: (styleId, data) => {
    const components = { hero_banner: HeroBanner, slider_banner: SliderBanner };
    const Component = components[styleId] ?? HeroBanner;
    return <Component data={data} />;
  },
};
```

Same pattern in Vue (dynamic `<component :is="...">`), SwiftUI (`@ViewBuilder` + switch), Compose (`when(styleId)` in registry lambda).

### Step 4 — Build layout engines

Port the resolution pipeline exactly:

```
filter(enabled) → skip unknown → dedupe by id → resolve style → sort → pin banner
```

This is pure logic — copy as a function with no UI dependency.

### Step 5 — Build section modules

One folder per section. Each exports:

- Style id list
- Data type / interface
- Registry entry
- Style components

### Step 6 — Wire the page

```tsx
function StorePage({ config }) {
  const theme = resolveDesignSystem(config.design);
  const sections = StorefrontLayoutEngine.resolve(config.sections);
  return (
    <DesignSystemProvider value={theme}>
      {sections.map(s => (
        <SectionRenderer key={s.id} sectionId={s.id} styleId={s.style} data={s.data} />
      ))}
    </DesignSystemProvider>
  );
}
```

### What changes vs what stays

| Changes per framework | Stays identical |
|----------------------|-----------------|
| Widget / component syntax | JSON contract |
| Context / theming mechanism | Section ids and style ids |
| List rendering | Resolution pipeline |
| Font loading | Registry pattern |
| | Folder/module boundaries |
| | Data models |
| | Merchant customization model |

---

## 19. Development Rules

### Strict rules (non-negotiable)

1. **No hardcoded layouts** — never fix section order in widget code.
2. **No hardcoded colors** — always `context.ds.palette.*`.
3. **No hardcoded fonts** — always `context.ds.typography.*`.
4. **No hardcoded section order** — always from `order` field.
5. **No hardcoded styles** — always from `style` / `styleId` field via registry.
6. **Registry-driven** — new styles go in `*StyleId.all` + renderer map + widget file.
7. **Everything configurable** — if a merchant should control it, it belongs in JSON.
8. **Everything reusable** — sections do not import other sections.
9. **No business logic in UI** — validation, pricing, availability live in Laravel.
10. **Optional fields collapse** — missing data hides widgets; no empty spacing.

### Code review checklist

- [ ] New widget uses `context.ds` for colors and typography?
- [ ] New style added to `*StyleId.all` and renderer?
- [ ] New section registered in `RegisteredSections.all`?
- [ ] Data model matches `docs/schemas/{section}.json`?
- [ ] Layout engine untouched?
- [ ] No assumptions about variant attribute names?

---

## 20. Future Extension Guide

### Add a new storefront section

1. Create `lib/sections/{name}/` with the standard module structure:
   - `{name}_section_config.dart`
   - `{name}_section_data.dart` + item models
   - `styles.dart` with `{Name}StyleId.all`
   - `renderer.dart`
   - `{name}_registry.dart`
   - `styles/*.dart` (one per style)
2. Add `{Name}SectionRegistry.registry` to `RegisteredSections.all`.
3. Add schema to `docs/schemas/{name}.json`.
4. Document in `docs/storefront_sections_data_contract.md`.

**Do not modify:** `StorefrontLayoutEngine`, `StorefrontLayoutView`, `StorefrontSectionCatalog`.

### Add a new style to an existing section

1. Add id to `{Section}StyleId.all`.
2. Create `styles/new_style.dart` widget.
3. Register in `{Section}Renderer` (switch case or builder map).
4. Document the style id in the data contract.

**Do not modify:** layout engines, other sections, other styles.

### Add a new palette

1. Add id to `PaletteId`.
2. Add `AppPalette` constant in `PaletteRegistry`.
3. Register in `PaletteRegistry.get()` lookup.

All sections automatically support the new palette — no section changes needed.

### Add a new typography profile

1. Add id to `TypographyId`.
2. Add `TypographyProfile` in `TypographyRegistry`.
3. Register in `TypographyRegistry.get()` lookup.

All sections automatically inherit the new typography.

### Add a new product detail sub-section

> Currently fixed at 4 sub-sections (media, info, variants, reviews). Adding a fifth requires:

1. Add id to `ProductDetailSectionId`.
2. Create sub-module under `product_detail/{name}/`.
3. Register in `ProductDetailSectionCatalog._definitions`.
4. Add schema `docs/schemas/product_detail_{name}.json`.
5. Update data contract.

**Do not modify:** resolution pipeline structure (only extend the catalog).

---

## Appendix A — Resolution Pseudocode

### Storefront

```text
function resolve(sections):
  seen = {}
  result = []
  for entry in sections:
    if not entry.enabled: continue
    if not catalog.isKnown(entry.id): continue
    if seen.contains(entry.id): continue
    style = catalog.resolveStyleId(entry.id, entry.style)
    if not catalog.hasRenderableContent(entry.id, style): continue
    seen.add(entry.id)
    result.add(entry with style)
  result.sortBy(order)
  if banner in result and banner.index > 0:
    move banner to index 0
  return result
```

### Product Detail

```text
function resolve(sections):
  seen = {}
  result = []
  for entry in sections:
    if not entry.enabled: continue
    if not catalog.isKnown(entry.sectionId): continue
    if seen.contains(entry.sectionId): continue
    style = catalog.resolveStyleId(entry.sectionId, entry.styleId)
    seen.add(entry.sectionId)
    result.add(entry with style)
  result.sortBy(order)
  return result
```

---

## Appendix B — Related Systems (Outside Template Engine)

### Product List (`lib/product_list/`)

Four **fixed** navigation destinations (not backend-driven sections):

- Store category (adaptive grid)
- Store collection (horizontal cards)
- Service category (vertical cards)
- Service collection (compact cards)

Opened via modal bottom sheet (`ProductListSheet`). These are reusable list layouts for navigation flows, separate from the storefront section system.

### Mall Explorer (`lib/modules/home/`)

Legacy shell for the multi-floor mall experience (3D areas, store carousel, category tabs). Predates the template engine. Will coexist until full API integration routes through `StorefrontRenderer`.

---

*End of architecture reference.*
