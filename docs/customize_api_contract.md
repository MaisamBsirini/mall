# Customize API Contract

**Version:** 1.0  
**Audience:** Laravel API, Flutter Mobile, React Admin  
**Scope:** UI customization only.

This contract defines **how** a merchant customizes the storefront and product detail pages. It does not define section content. Content (slides, products, reviews, text, images) is delivered by separate APIs that are not part of this document.

---

## What this API controls

| Field | Controls |
|-------|----------|
| `palette` | Global color theme for the store |
| `typography` | Global font theme for the store |
| `sections[].enabled` | Whether a section is visible |
| `sections[].order` | Vertical position on the page |
| `sections[].style` | Visual layout variant for that section |

## What this API does not control

- Banner slides, images, titles, or CTAs
- Collection items, category lists, offer products
- Staff profiles, review bodies, location text, social URLs
- Product images, prices, variant options, product reviews

Those belong to future **content APIs** — one per section (or per product detail sub-section).

---

## Storefront Customize API

### Response shape

```json
{
  "palette": "luxury_dark",
  "typography": "elegant_serif",
  "sections": [
    {
      "id": "banner",
      "name": "Banner",
      "enabled": true,
      "order": 1,
      "style": "hero_banner"
    }
  ]
}
```

**Example file:** [storefront_customize_example.json](storefront_customize_example.json)

### Root fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `palette` | `string` | Yes | Palette registry id |
| `typography` | `string` | Yes | Typography registry id |
| `sections` | `array` | Yes | Storefront section layout entries |

### Section entry fields

Every storefront section uses the same envelope. No other fields are allowed.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | `string` | Yes | Section identifier |
| `name` | `string` | Yes | Display label (admin / accessibility) |
| `enabled` | `boolean` | Yes | `false` hides the section |
| `order` | `integer` | Yes | Sort key; lower renders first |
| `style` | `string` | Yes | Registered style id for this section |

### Forbidden in section entries

`data` · `items` · `title` · `subtitle` · `description` · image URLs · prices · any business or content field.

### Flutter rendering rules

1. Skip sections where `enabled` is `false`.
2. Skip unknown `id` values.
3. On duplicate `id`, first entry wins.
4. Invalid `style` falls back to the section's first registered style.
5. Sort by `order` ascending.
6. **Pin `banner` to index 0** when present, regardless of `order`.

---

## Product Detail Customize API

Separate endpoint for product page **layout only** — `sections` array with no `palette` or `typography`.

`palette` and `typography` come from the **storefront customize** response (`storefront_customize_example.json`). The client applies that same store design to product detail via `ProductDetailRenderer` / `MerchantStorefrontConfig.productDetailRenderer`.

Product content (images, title, price, variants, review text) is **never** included here. It will be delivered by dedicated product content APIs.

```json
{
  "sections": [
    {
      "id": "media",
      "name": "Media",
      "enabled": true,
      "order": 1,
      "style": "hero_full_width"
    }
  ]
}
```

**Example file:** [product_detail_customize_example.json](product_detail_customize_example.json)

### Section entry fields

Identical to storefront sections. Exactly five fields — nothing else.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | `string` | Yes | One of: `media`, `info`, `variants`, `reviews` |
| `name` | `string` | Yes | Display label (admin / accessibility) |
| `enabled` | `boolean` | Yes | `false` hides the sub-section |
| `order` | `integer` | Yes | Sort key; any order is valid |
| `style` | `string` | Yes | Registered style id for this sub-section |

### Forbidden in product detail section entries

`data` · `items` · `sectionId` · `styleId` · `title` · `price` · `description` · `image_url` · `attribute_groups` · `reviews` array · any product or content field.

Legacy `sectionId` / `styleId` keys are not part of this contract. Use `id` and `style`.

### Flutter rendering rules

1. Skip sections where `enabled` is `false`.
2. Skip unknown `id` values.
3. On duplicate `id`, first entry wins.
4. Invalid `style` falls back to the sub-section's first registered style.
5. Sort by `order` ascending.
6. No banner pin — product detail has no special ordering exceptions.

`palette` and `typography` are **not** part of this payload — they are read from the storefront customize JSON and shared with product detail at render time.

### Section entry examples

**Media**

```json
{
  "id": "media",
  "name": "Media",
  "enabled": true,
  "order": 1,
  "style": "hero_full_width"
}
```

**Info**

```json
{
  "id": "info",
  "name": "Product Information",
  "enabled": true,
  "order": 2,
  "style": "large_title_stack"
}
```

**Variants**

```json
{
  "id": "variants",
  "name": "Variants",
  "enabled": true,
  "order": 3,
  "style": "adaptive_chips"
}
```

**Reviews**

```json
{
  "id": "reviews",
  "name": "Reviews",
  "enabled": true,
  "order": 4,
  "style": "review_dashboard"
}
```

These examples show **configuration only**. They do not include product data.

---

## Global registries

### Palettes

`luxury_gold` · `modern_indigo` · `soft_beige` · `dark_emerald` · `rose_boutique` · `midnight_purple` · `warm_minimal` · `ocean_blue` · `neutral_editorial` · `premium_monochrome` · `luxury_dark`

### Typography

`elegant_serif` · `modern_sans` · `luxury_editorial` · `minimal_clean` · `bold_commerce` · `soft_rounded` · `premium_display`

Invalid palette or typography ids should be rejected at the API layer. The admin panel must only offer registered values.

---

## Storefront sections reference

---

### Banner

| | |
|---|---|
| **Section id** | `banner` |
| **Purpose** | Hero / promotional area at the top of the store page |
| **Styles** | `hero_banner` · `slider_banner` · `minimal_banner` · `modern_banner` · `glass_banner` |

**Supported configuration:** `enabled`, `order`, `style`, plus global `palette` and `typography`.

**Notes:**
- Banner is a normal section in the customize payload — same envelope as all others.
- Banner is always rendered first when enabled (client-side pin).
- Banner slide content is **not** part of customize API. It will come from a dedicated banner content API.

---

### Booking

| | |
|---|---|
| **Section id** | `booking` |
| **Purpose** | Appointment booking entry — visual entry point to the booking flow |
| **Styles** | `stacked_step_cards` · `compact_chip_flow` · `timeline_rail_flow` · `accordion_step_flow` · `popup_staff_picker_flow` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Styles change the booking entry presentation only.
- Services, staff, slots, and booking logic are content/API concerns — not customize fields.

---

### Staff

| | |
|---|---|
| **Section id** | `staff` |
| **Purpose** | Team member introduction block |
| **Styles** | `alternating_staff` · `team_directory` · `premium_specialists_grid` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Staff member profiles and bios are loaded from a separate staff content API.

---

### Collections

| | |
|---|---|
| **Section id** | `collections` |
| **Purpose** | Collection navigation / showcase layout |
| **Styles** | `horizontal_circles` · `rectangle_cards` · `split_cards` · `stacked_cards` · `minimal_tiles` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Collection names, cover images, and descriptions are content API fields.

---

### Categories

| | |
|---|---|
| **Section id** | `categories` |
| **Purpose** | Category navigation layout |
| **Styles** | `icon_hub` · `honeycomb_categories` · `category_ribbons` · `floating_category_cloud` · `category_command_center` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Category icons and labels are content API fields.

---

### Offers

| | |
|---|---|
| **Section id** | `offers` |
| **Purpose** | Promotional offers strip / grid layout |
| **Styles** | `compact_horizontal_offer` · `dense_offer_list` · `badge_based_offers` · `image_left_strip` · `minimal_offer_grid` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Offer products, images, and discount values are content API fields.

---

### Reviews

| | |
|---|---|
| **Section id** | `reviews` |
| **Purpose** | Store-level reviews summary and list layout |
| **Styles** | `review_dashboard` · `floating_rating_header` · `featured_rating_hero` · `rating_sidebar` · `editorial_timeline_reviews` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Ratings, review text, and reviewer names are content API fields.
- This is store-level reviews — not product detail reviews.

---

### Location

| | |
|---|---|
| **Section id** | `location` |
| **Purpose** | Location overlay on banner — small anchor component |
| **Styles** | `corner_location_badge` · `floating_location_pill` · `location_bubble` · `location_ribbon` · `header_location_chip` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Store owner picks style and anchor position; component renders as a soft overlay on the banner area.
- Location text is a content API field at runtime.

---

### Social Media

| | |
|---|---|
| **Section id** | `social_media` |
| **Purpose** | Social profile links layout |
| **Styles** | `minimal_social_chips` · `floating_icon_grid` · `compact_profile_strip` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Platform links and profile URLs are content API fields.

---

### Certifications

| | |
|---|---|
| **Section id** | `certifications` |
| **Purpose** | Trust credentials / certificate gallery layout |
| **Styles** | `certificate_wall` · `achievement_gallery` · `premium_carousel` · `credential_strip` |

**Supported configuration:** `enabled`, `order`, `style`.

**Notes:**
- Certificate images and titles are content API fields.

---

## Product detail sections reference

---

### Media

| | |
|---|---|
| **Section id** | `media` |
| **Purpose** | Product image / video gallery layout |
| **Styles** | `hero_full_width` · `image_carousel` · `swipe_gallery` · `stacked_gallery` · `card_gallery` |

**Supported configuration:** `id`, `name`, `enabled`, `order`, `style`.

**Notes:**
- Customize controls layout only — visibility, order, and style.
- Product images, videos, and gallery assets are product content API fields.

---

### Info

| | |
|---|---|
| **Section id** | `info` |
| **Purpose** | Product information block layout |
| **Styles** | `large_title_stack` · `compact_header` · `overlay_info` · `editorial_card` · `minimal_centered` |

**Supported configuration:** `id`, `name`, `enabled`, `order`, `style`.

**Notes:**
- Title, category, description, and price are product content API fields.

---

### Variants

| | |
|---|---|
| **Section id** | `variants` |
| **Purpose** | Attribute selector layout |
| **Styles** | `adaptive_chips` · `horizontal_scroll` · `card_selector` · `segmented_pills` · `expandable_list` |

**Supported configuration:** `id`, `name`, `enabled`, `order`, `style`.

**Notes:**
- Attribute groups and option labels are product content API fields.
- Customize selects **how** selectors are presented — not which attributes exist.

---

### Reviews

| | |
|---|---|
| **Section id** | `reviews` |
| **Purpose** | Product-level reviews block — **same UI styles as storefront `reviews`** |
| **Styles** | `review_dashboard` · `floating_rating_header` · `featured_rating_hero` · `rating_sidebar` · `editorial_timeline_reviews` |

**Supported configuration:** `id`, `name`, `enabled`, `order`, `style`.

**Notes:**
- Review text, ratings, and reviewer names are product content API fields.
- Style ids are shared with the storefront `reviews` section — customize picks layout only.

---

## Admin panel rules

1. Only expose registered `palette`, `typography`, section `id`, and `style` values.
2. Never expose content fields in the customize editor.
3. Storefront and product detail customize are edited separately.
4. Disabling a section removes it from the layout — it does not delete content.

---

## Changelog

| Version | Date | Notes |
|---------|------|-------|
| 1.0 | 2026-06-11 | Initial customize-only contract; content APIs out of scope |
| 1.1 | 2026-06-11 | Product detail sections aligned to `id` / `name` / `style` envelope |
