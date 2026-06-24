# Mall — Dynamic Storefront UI Engine

A Flutter mobile application that renders **merchant storefronts** and **product detail pages** entirely from backend JSON configuration. The client never hardcodes layout order, section visibility, visual styles, colors, or typography.

---

## What This Project Is

This is a **configuration-driven UI engine** for ecommerce and service businesses. Merchants customize their mobile presence through Laravel (data + layout) and React Admin (editing). Flutter receives a JSON payload and renders the result — nothing more.

| Layer | Responsibility |
|-------|----------------|
| **Laravel API** | Owns data, layout config, business rules |
| **Flutter Mobile** | Owns rendering only |
| **React Admin** | Owns merchant editing (future) |

There is no fixed store page. There is no fixed product detail screen. Pages are **assembled dynamically** from independent sections.

---

## Why This Architecture

Traditional mobile apps hardcode screens: banner at top, then categories, then products. Every merchant gets the same structure.

This project inverts that model:

- **Sections** are reusable building blocks (Banner, Collections, Reviews, …).
- **Styles** are swappable visual layouts per section (5+ per section).
- **Order**, **enabled**, and **style** come from the backend.
- **Palette** and **typography** are global — one choice applies everywhere.

The same renderer and the same engine serve every merchant. Only the configuration changes.

---

## Two Rendering Systems

### 1. Store Page

Renders up to **10 storefront sections**:

`banner` · `booking` · `staff` · `collections` · `categories` · `offers` · `reviews` · `location` · `social_media` · `certifications`

Driven by: `id`, `style`, `enabled`, `order`, `data`

**Banner is always pinned to the top.** All other sections follow backend `order`.

### 2. Product Detail Page

Renders **4 independent sub-sections**:

`media` · `info` · `variants` · `reviews`

Driven by: `sectionId`, `styleId`, `enabled`, `order`, `data`

**No fixed layout order.** Any permutation is valid.

---

## Quick Start

```bash
flutter pub get
flutter run
```

The app entry route is `/products` (`StoreProductsView`) — the legacy mall explorer shell. The template engines (`StorefrontRenderer`, `ProductDetailScreen`) are production components wired when API integration is complete.

---

## Documentation

| Document | Purpose |
|----------|---------|
| **[ARCHITECTURE.md](ARCHITECTURE.md)** | Complete system architecture — philosophy, flow, folder structure, porting guide |
| **[docs/storefront_sections_data_contract.md](docs/storefront_sections_data_contract.md)** | Laravel ↔ Flutter JSON contract |
| **[docs/storefront_sections_examples.json](docs/storefront_sections_examples.json)** | Full API response examples |
| **[docs/schemas/](docs/schemas/)** | Per-section `data` payload schemas |

---

## Core Concepts (30-Second Version)

```
Backend JSON
     ↓
Layout Engine (resolve: filter → dedupe → sort → pin banner)
     ↓
Section Catalog (lookup section by id)
     ↓
Section Registry (lookup style by styleId)
     ↓
Style Widget (pure UI)
     ↓
Screen
```

- **Section** — A page region with its own data model and style registry.
- **Style** — A visual layout variant inside a section.
- **Registry** — Maps string ids to widgets. No scattered switch statements at the app level.
- **Design System** — Global palette + typography inherited by every section via `DesignSystemScope`.
- **Layout Engine** — Sorts and filters sections; never decides business logic.

---

## Project Structure (Summary)

```
lib/
├── design_system/       # Palette, typography, tokens, DesignSystemScope
├── sections/            # Storefront + product detail template engines
│   ├── banner/          # Example section module (config, data, registry, renderer, styles)
│   ├── …                # One folder per storefront section
│   └── product_detail/  # Product detail layout engine (4 sub-sections)
├── product_list/        # Fixed product-list navigation sheets (4 destinations)
├── modules/home/        # Legacy mall explorer UI (3D areas, store carousel)
├── data/                # Models and repositories (mall explorer data)
└── core/                # Shared constants, network, widgets
docs/                    # API data contract and JSON schemas
```

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full folder guide.

---

## Development Rules

1. **No hardcoded layouts** — section order comes from JSON.
2. **No hardcoded colors** — use `context.ds.palette`.
3. **No hardcoded fonts** — use `context.ds.typography`.
4. **No hardcoded styles** — register in `*StyleId.all` and the section registry.
5. **No business logic in UI** — Flutter renders; Laravel decides.
6. **Registry-driven** — new styles and sections extend registries; do not modify engines.

---

## Tech Stack

- **Flutter** 3.7+ / Dart 3.7+
- **GetX** — routing and light state management
- **Material 3** — via design system theme
- **google_fonts** — typography profiles
- **dio** — HTTP client (API integration)

---

## License

Private project — not published to pub.dev.
