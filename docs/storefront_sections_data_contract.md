# Storefront Sections — Data Contract

**Version:** 1.0  
**Audience:** Laravel API, Flutter Mobile, React Admin  
**Scope:** Data contract only — no UI or backend implementation.

This document is the single source of truth for storefront and product detail payloads.

---

## Table of Contents

1. [Global Envelope](#global-envelope)
2. [Rendering Rules](#rendering-rules)
3. [UI Fallback Rules](#ui-fallback-rules)
4. [Banner](#1-banner)
5. [Booking](#2-booking)
6. [Staff](#3-staff)
7. [Collections](#4-collections)
8. [Categories](#5-categories)
9. [Offers](#6-offers)
10. [Reviews](#7-reviews)
11. [Location](#8-location)
12. [Social Media](#9-social-media)
13. [Certifications](#10-certifications)
14. [Product Detail](#11-product-detail)

**Schema files:** `docs/schemas/*.json`  
**Full examples:** `docs/storefront_sections_examples.json`

---

## Global Envelope

### Store Page response

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
      "style": "hero_banner",
      "data": {}
    }
  ]
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `design` | `object` | **Yes** | Store visual identity inherited by all sections |
| `design.palette` | `string` | **Yes** | Palette registry id (e.g. `luxury_dark`, `modern_indigo`) |
| `design.typography` | `string` | **Yes** | Typography registry id (e.g. `elegant_serif`, `modern_sans`) |
| `sections` | `array` | **Yes** | Ordered list of section envelopes |
| `sections[].id` | `string` | **Yes** | Section identifier (see supported ids below) |
| `sections[].name` | `string` | **Yes** | Human-readable label (admin / accessibility) |
| `sections[].enabled` | `boolean` | **Yes** | `false` → Flutter skips the section entirely |
| `sections[].order` | `integer` | **Yes** | Sort key; lower renders first |
| `sections[].style` | `string` | **Yes** | Style registry id for this section |
| `sections[].data` | `object` | No | Section content payload (see per-section schemas) |

### Supported storefront section ids

| `id` | Purpose |
|------|---------|
| `banner` | Hero / promotional slides |
| `booking` | Appointment booking entry |
| `staff` | Team introduction |
| `collections` | Product / service collections |
| `categories` | Navigation categories |
| `offers` | Promotional offers |
| `reviews` | Store-level reviews |
| `location` | Text location display |
| `social_media` | Social profile links |
| `certifications` | Trust / credential images |

### Rendering rules (Flutter)

1. Ignore sections where `enabled` is `false`.
2. Ignore unknown `id` values.
3. If duplicate `id` appears, **first occurrence wins**.
4. Resolve invalid `style` to the section's default style.
5. Sort remaining sections by `order` ascending.
6. **Banner is always pinned to the top** regardless of `order`.

### Product Detail response

Product Detail is a **separate page** with its own envelope:

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
      "data": {}
    }
  ]
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `design` | `object` | **Yes** | Inherited from store configuration |
| `sections[].sectionId` | `string` | **Yes** | One of: `media`, `info`, `variants`, `reviews` |
| `sections[].styleId` | `string` | **Yes** | Style registry id for the sub-section |
| `sections[].enabled` | `boolean` | **Yes** | `false` → skip |
| `sections[].order` | `integer` | **Yes** | Sort key; any order is valid |
| `sections[].data` | `object` | No | Sub-section content payload |

Product Detail has **no fixed layout order** — Flutter renders strictly by `order`.

---

## Rendering Rules

| Rule | Behavior |
|------|----------|
| Disabled section | Not rendered; no spacing reserved |
| Unknown section id | Skipped silently |
| Duplicate section id | First wins; duplicates ignored |
| Invalid style id | Falls back to first registered style |
| Empty `data` | Section shell may render; content areas use fallbacks per field |
| Empty `items` arrays | Section collapses or shows empty state (per section) |

---

## UI Fallback Rules

| Situation | Flutter behavior |
|-----------|------------------|
| Optional text field missing | Hide widget; **no reserved height**; **no empty spacing** |
| Optional image missing | Hide image slot; layout reflows |
| Optional array empty | Hide list/grid; section may collapse if nothing else to show |
| Required field missing | Section skipped or item skipped (per field table) |
| Unknown extra JSON fields | **Ignored completely** — never rendered |

---

## 1. Banner

**Section id:** `banner`  
**Purpose:** Promotional hero slides with optional title, subtitle, and CTA label.  
**Schema file:** `docs/schemas/banner.json`

### Valid `style` values

`hero_banner` · `slider_banner` · `minimal_banner` · `modern_banner` · `glass_banner`

### JSON Schema (`data`)

```json
{
  "autoplay": true,
  "autoplay_interval_ms": 5000,
  "items": [
    {
      "id": "bnr_01",
      "image_url": "https://cdn.example.com/banners/summer.jpg",
      "title": "Summer Collection",
      "subtitle": "New arrivals up to 30% off",
      "cta_text": "Shop Now",
      "sort_order": 1
    }
  ]
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `autoplay` | `boolean` | No | Auto-advance slides (slider styles) | `true` |
| `autoplay_interval_ms` | `integer` | No | Milliseconds between slides | `5000` |
| `items` | `array` | **Yes** | Slide list (min 1 when section enabled) | `[...]` |

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | No | Stable slide id | `"bnr_01"` |
| `image_url` | `string` | **Yes** | Background image URL | `"https://…/summer.jpg"` |
| `title` | `string` | No | Primary headline | `"Summer Collection"` |
| `subtitle` | `string` | No | Secondary line | `"New arrivals…"` |
| `cta_text` | `string` | No | Button label (visual only; action handled elsewhere) | `"Shop Now"` |
| `sort_order` | `integer` | No | Display order within carousel | `1` |

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `title` | Headline row hidden; no spacing |
| `subtitle` | Subtitle row hidden; no spacing |
| `cta_text` | Button hidden; no spacing |
| `id` | Ignored; slide still renders |
| `sort_order` | Array order used |
| `autoplay` | Defaults to `false` |
| `autoplay_interval_ms` | Style default interval |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `items[].image_url` | `title`, `subtitle`, `cta_text`, `autoplay`, `autoplay_interval_ms` |

### Notes

- No navigation URLs in banner data — tap handling is outside this contract.
- No badge fields — badges are style-defined, not merchant content.
- Video backgrounds are **not** in the storefront banner contract; use `image_url` only.

---

## 2. Booking

**Section id:** `booking`  
**Purpose:** Entry point for the 5-step booking flow (service → staff → date → time → confirm).  
**Schema file:** `docs/schemas/booking.json`

### Valid `style` values

`stacked_step_cards` · `compact_chip_flow` · `timeline_rail_flow` · `split_schedule_flow` · `scroll_wizard_flow`

### JSON Schema (`data`)

```json
{
  "title": "Book an Appointment",
  "booking_enabled": true,
  "cta_label": "Confirm Booking",
  "timezone": "America/Chicago",
  "booking_target": {
    "type": "internal",
    "module_id": "booking_main"
  },
  "service_ids": ["svc_12", "svc_15"],
  "staff_ids": ["staff_2", "staff_5"],
  "availability_preview": {
    "next_available": "2026-06-12T10:30:00Z",
    "slots_today": 6
  }
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `title` | `string` | No | Section heading | `"Book an Appointment"` |
| `booking_enabled` | `boolean` | **Yes** | When `false`, section is non-interactive | `true` |
| `cta_label` | `string` | No | Primary action label | `"Confirm Booking"` |
| `timezone` | `string` | No | IANA timezone for slot display | `"America/Chicago"` |
| `booking_target` | `object` | **Yes** | Where booking flow opens | `{ "type": "internal", "module_id": "booking_main" }` |
| `booking_target.type` | `string` | **Yes** | Target type (`internal`) | `"internal"` |
| `booking_target.module_id` | `string` | **Yes** | Booking module identifier | `"booking_main"` |
| `service_ids` | `string[]` | No | Pre-filtered services | `["svc_12"]` |
| `staff_ids` | `string[]` | No | Pre-filtered staff | `["staff_2"]` |
| `availability_preview` | `object` | No | Summary hints for preview styles | `{ ... }` |
| `availability_preview.next_available` | `string` | No | ISO-8601 datetime | `"2026-06-12T10:30:00Z"` |
| `availability_preview.slots_today` | `integer` | No | Count of slots today | `6` |

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `title` | Style default heading or hidden |
| `cta_label` | Generic "Book" label |
| `timezone` | Device / store default |
| `service_ids` / `staff_ids` | All available shown in flow |
| `availability_preview` | Preview hints hidden |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `booking_enabled`, `booking_target` | `title`, `cta_label`, `timezone`, `service_ids`, `staff_ids`, `availability_preview` |

### Notes

- Booking section envelope has **no `items` array** — the multi-step flow loads its own endpoints.
- When `booking_enabled` is `false`, Flutter shows disabled state or hides section.

---

## 3. Staff

**Section id:** `staff`  
**Purpose:** Team member introduction — image, name, role, optional bio.  
**Schema file:** `docs/schemas/staff.json`

### Valid `style` values

`alternating_staff` · `team_directory` · `premium_specialists_grid`

### JSON Schema (`data`)

```json
{
  "title": "Our Team",
  "items": [
    {
      "id": "staff_1",
      "full_name": "Dr. Amira Hassan",
      "role": "Dermatology Specialist",
      "profile_image_url": "https://cdn.example.com/staff/amira.jpg",
      "short_bio": "10+ years experience."
    }
  ]
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `title` | `string` | No | Section heading | `"Our Team"` |
| `items` | `array` | **Yes** | Team members | `[...]` |

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | **Yes** | Staff member id | `"staff_1"` |
| `full_name` | `string` | **Yes** | Display name | `"Dr. Amira Hassan"` |
| `role` | `string` | **Yes** | Role / specialization | `"Dermatology Specialist"` |
| `profile_image_url` | `string` | **Yes** | Avatar image URL | `"https://…/amira.jpg"` |
| `short_bio` | `string` | No | Short biography | `"10+ years experience."` |

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `title` | Section header hidden; no spacing |
| `short_bio` | Bio block hidden; card height collapses |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `items[].id`, `full_name`, `role`, `profile_image_url` | `title`, `short_bio` |

### Notes

- No booking buttons, ratings, schedules, or linked services in staff data.
- Presentation only.

---

## 4. Collections

**Section id:** `collections`  
**Purpose:** Visual collection cards for products or services.  
**Schema file:** `docs/schemas/collections.json`

### Valid `style` values

`horizontal_circles` · `rectangle_cards` · `split_cards` · `stacked_cards` · `minimal_tiles`

### JSON Schema (`data`)

```json
{
  "items": [
    {
      "id": "col_7",
      "name": "Best Sellers",
      "cover_image": "https://cdn.example.com/collections/best-sellers.jpg",
      "description": "Top-rated products this month"
    }
  ]
}
```

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | No | Collection id | `"col_7"` |
| `name` | `string` | **Yes** | Collection title | `"Best Sellers"` |
| `cover_image` | `string` | **Yes** | Cover image URL | `"https://…/best-sellers.jpg"` |
| `description` | `string` | No | Supporting caption | `"Top-rated products…"` |

> **Naming:** `name` is the collection **title**. `cover_image` is the collection **image**.

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `description` | Description widget removed; **no empty spacing** |
| `id` | Item still renders |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `name`, `cover_image` | `id`, `description` |

### Notes

- No item counts — computed server-side if needed elsewhere.
- No per-collection icons.

---

## 5. Categories

**Section id:** `categories`  
**Purpose:** Icon-first navigation categories.  
**Schema file:** `docs/schemas/categories.json`

### Valid `style` values

`icon_hub` · `honeycomb_categories` · `category_ribbons` · `floating_category_cloud` · `category_command_center`

### JSON Schema (`data`)

```json
{
  "items": [
    {
      "id": "cat_12",
      "icon": "spa_outlined",
      "name": "Skincare"
    }
  ]
}
```

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | No | Category id | `"cat_12"` |
| `icon` | `string` | **Yes** | Icon key (Material-style name) | `"spa_outlined"` |
| `name` | `string` | No | Category label | `"Skincare"` |

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `name` | Icon-only tile; label row hidden |
| `id` | Item still renders |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `icon` | `id`, `name` |

### Notes

- No cover images or descriptions for categories.

---

## 6. Offers

**Section id:** `offers`  
**Purpose:** Promotional product offers with image and discount.  
**Schema file:** `docs/schemas/offers.json`

### Valid `style` values

`compact_horizontal_offer` · `dense_offer_list` · `badge_based_offers` · `image_left_strip` · `minimal_offer_grid`

### JSON Schema (`data`)

```json
{
  "items": [
    {
      "id": "offer_1",
      "product_name": "Hydrating Serum",
      "image": "https://cdn.example.com/products/serum.jpg",
      "discount_percentage": 40
    }
  ]
}
```

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | **Yes** | Offer id | `"offer_1"` |
| `product_name` | `string` | **Yes** | Product / offer label | `"Hydrating Serum"` |
| `image` | `string` | **Yes** | Product image URL | `"https://…/serum.jpg"` |
| `discount_percentage` | `integer` | **Yes** | Discount 0–100 | `40` |

### Optional field fallbacks

None — all item fields are required. Invalid items are skipped.

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `id`, `product_name`, `image`, `discount_percentage` | — |

### Notes

- **No `price` field** — offers display discount and product name only.
- No expiry, coupon codes, or terms in this contract.

---

## 7. Reviews

**Section id:** `reviews`  
**Purpose:** Store-level rating summary and review list.  
**Schema file:** `docs/schemas/reviews.json`

### Valid `style` values

`review_dashboard` · `floating_rating_header` · `featured_rating_hero` · `rating_sidebar` · `editorial_timeline_reviews`

### JSON Schema (`data`)

```json
{
  "average_rating": 4.8,
  "review_count": 256,
  "distribution": { "5": 180, "4": 52, "3": 16, "2": 5, "1": 3 },
  "items": [
    {
      "id": "rev_901",
      "reviewer_name": "Sarah M.",
      "rating": 5,
      "comment": "Excellent service and fast delivery.",
      "reportable": true
    }
  ]
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `average_rating` | `number` | **Yes** | Mean rating 0–5 | `4.8` |
| `review_count` | `integer` | **Yes** | Total review count | `256` |
| `distribution` | `object` | No | Star histogram (`"1"`–`"5"` → count) | `{ "5": 180 }` |
| `items` | `array` | **Yes** | Review entries | `[...]` |

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | **Yes** | Review id (required for report action) | `"rev_901"` |
| `reviewer_name` | `string` | **Yes** | Display name | `"Sarah M."` |
| `rating` | `integer` | **Yes** | Star rating 1–5 | `5` |
| `comment` | `string` | **Yes** | Review body | `"Excellent service…"` |
| `reportable` | `boolean` | **Yes** | Whether report action is shown | `true` |

### Excluded fields (do not send)

`source` · `reviewer_avatar_url` · `created_at` · `is_verified` · `is_featured` · `min_rating` · section `title`

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `distribution` | Distribution chart hidden; summary still shows |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `average_rating`, `review_count`, `items[]` core fields | `distribution` |

---

## 8. Location

**Section id:** `location`  
**Purpose:** Text-only location display.  
**Schema file:** `docs/schemas/location.json`

### Valid `style` values

`corner_location_badge` · `floating_location_pill` · `location_bubble` · `location_ribbon` · `header_location_chip`

### JSON Schema (`data`)

```json
{
  "text": "Downtown Mall, Level 2",
  "detail": "Open until 9:00 PM"
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `text` | `string` | **Yes** | Primary location line | `"Downtown Mall, Level 2"` |
| `detail` | `string` | No | Secondary line | `"Open until 9:00 PM"` |

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `detail` | Secondary line hidden; no spacing |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `text` | `detail` |

### Notes

- **No Google Maps URL** or coordinates in this contract.
- No map embed fields.

---

## 9. Social Media

**Section id:** `social_media`  
**Purpose:** External social profile links.  
**Schema file:** `docs/schemas/social_media.json`

### Valid `style` values

`minimal_social_chips` · `floating_icon_grid` · `compact_profile_strip` · `elegant_card_stack` · `bottom_social_dock`

### JSON Schema (`data`)

```json
{
  "title": "Follow Us",
  "items": [
    {
      "platform": "instagram",
      "profile_url": "https://instagram.com/store"
    }
  ]
}
```

### Fields — `data`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `title` | `string` | No | Section heading | `"Follow Us"` |
| `items` | `array` | **Yes** | Social links | `[...]` |

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `platform` | `string` | **Yes** | Platform key | `"instagram"` |
| `profile_url` | `string` | **Yes** | Full profile URL | `"https://instagram.com/store"` |

### Supported `platform` values

`instagram` · `facebook` · `tiktok` · `youtube` · `x` · `snapchat` · `linkedin` · `whatsapp`

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `title` | Header hidden; icons only |

### Notes

- **Only** `title`, `items[].platform`, `items[].profile_url` — no handles, follower counts, or embed codes.

---

## 10. Certifications

**Section id:** `certifications`  
**Purpose:** Trust credentials as image galleries.  
**Schema file:** `docs/schemas/certifications.json`

### Valid `style` values

`certificate_wall` · `achievement_gallery` · `awards_showcase` · `masonry_achievements` · `premium_carousel`

### JSON Schema (`data`)

```json
{
  "title": "Our Certifications",
  "items": [
    {
      "id": "cert_1",
      "title": "Licensed Esthetician",
      "images": [
        "https://cdn.example.com/certs/certificate_1.jpg",
        "https://cdn.example.com/certs/certificate_2.jpg"
      ]
    }
  ]
}
```

### Fields — `data.items[]`

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `id` | `string` | **Yes** | Certification id | `"cert_1"` |
| `title` | `string` | **Yes** | Credential title | `"Licensed Esthetician"` |
| `images` | `string[]` | **Yes** | One or more image URLs | `["https://…/cert.jpg"]` |

### Excluded fields (do not send)

`organization` · `issue_date` · `type` · `credential_number` · `document_url` · `is_featured` · `sort_order`

### Optional field fallbacks

| Field | If missing |
|-------|------------|
| `title` (section) | Section header hidden |

### Style dependencies

| Used by all styles | Optional |
|------------------|----------|
| `items[].id`, `title`, `images` | Section-level `title` |

---

## 11. Product Detail

Product Detail is rendered on a **separate page** with four independent sub-sections. Each sub-section has its own `sectionId`, `styleId`, `order`, and `data` payload.

Inherits `palette` and `typography` from store `design` — no separate product detail theme.

### 11a. Media

**Section id:** `media`  
**Schema file:** `docs/schemas/product_detail_media.json`

#### Valid `styleId` values

`hero_full_width` · `image_carousel` · `swipe_gallery` · `stacked_gallery` · `card_gallery`

#### JSON Schema (`data`)

```json
{
  "items": [
    {
      "id": "media_1",
      "type": "image",
      "url": "https://cdn.example.com/products/hero.jpg",
      "sort_order": 1
    }
  ]
}
```

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `items` | `array` | **Yes** | Media assets | `[...]` |
| `items[].id` | `string` | No | Asset id | `"media_1"` |
| `items[].type` | `string` | **Yes** | `"image"` or `"video"` | `"image"` |
| `items[].url` | `string` | **Yes** | Media URL | `"https://…/hero.jpg"` |
| `items[].sort_order` | `integer` | No | Display order | `1` |

#### Fallbacks

| Field | If missing |
|-------|------------|
| `sort_order` | Array order used |
| Single item | Non-carousel styles show one asset |

---

### 11b. Info

**Section id:** `info`  
**Schema file:** `docs/schemas/product_detail_info.json`

#### Valid `styleId` values

`large_title_stack` · `compact_header` · `overlay_info` · `editorial_card` · `minimal_centered`

#### JSON Schema (`data`)

```json
{
  "title": "Hydrating Renewal Serum",
  "category": "Skincare",
  "description": "A lightweight daily serum…",
  "price": {
    "amount": 49.99,
    "currency": "USD",
    "formatted": "$49.99"
  }
}
```

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `title` | `string` | No | Product name | `"Hydrating Renewal Serum"` |
| `category` | `string` | No | Category label | `"Skincare"` |
| `description` | `string` | No | Product description | `"A lightweight…"` |
| `price` | `object` | No | Price block | `{ ... }` |
| `price.amount` | `number` | No* | Numeric amount | `49.99` |
| `price.currency` | `string` | No* | ISO 4217 code | `"USD"` |
| `price.formatted` | `string` | No | Pre-formatted display string | `"$49.99"` |

\*Required when `price` object is present.

#### Fallbacks

| Field | If missing |
|-------|------------|
| `title` | Title block hidden; no spacing |
| `category` | Chip hidden; no spacing |
| `description` | Description block removed completely |
| `price` | Price row hidden; no spacing |

---

### 11c. Variants

**Section id:** `variants`  
**Schema file:** `docs/schemas/product_detail_variants.json`

#### Valid `styleId` values

`adaptive_chips` · `horizontal_scroll` · `card_selector` · `segmented_pills` · `expandable_list`

#### JSON Schema (`data`)

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

| Field | Type | Required | Description | Example |
|-------|------|----------|-------------|---------|
| `attribute_groups` | `array` | **Yes** | Dynamic attribute dimensions | `[...]` |
| `attribute_groups[].id` | `string` | **Yes** | Group id | `"group_volume"` |
| `attribute_groups[].label` | `string` | **Yes** | Display label (any text) | `"Volume"` |
| `attribute_groups[].options` | `array` | **Yes** | Selectable values | `[...]` |
| `attribute_groups[].options[].id` | `string` | **Yes** | Option id | `"opt_50ml"` |
| `attribute_groups[].options[].label` | `string` | **Yes** | Display label | `"50ml"` |
| `attribute_groups[].options[].available` | `boolean` | **Yes** | Selection enabled | `true` |
| `default_selections` | `object` | No | Map of `group_id` → `option_id` | `{ "group_volume": "opt_50ml" }` |

#### Notes

- **Fully generic** — no `color`, `size`, or `material` assumptions.
- Attribute labels and option labels are **backend-defined strings**.
- Any number of attribute groups and options is valid.

#### Fallbacks

| Field | If missing |
|-------|------------|
| `default_selections` | First available option per group selected |
| Empty `attribute_groups` | Variants section collapses |

---

### 11d. Reviews

**Section id:** `reviews`  
**Schema file:** `docs/schemas/product_detail_reviews.json`

Same schema as [Storefront Reviews](#7-reviews) `data` payload.

#### Valid `styleId` values

`rating_summary` · `compact_reviews_list` · `featured_review_card` · `review_timeline` · `minimal_rating_strip`

---

## Changelog

| Version | Date | Notes |
|---------|------|-------|
| 1.0 | 2026-06-11 | Initial contract — 10 storefront sections + 4 product detail sub-sections |
