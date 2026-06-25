# Mall — Dynamic Storefront UI Engine

Flutter app that renders merchant storefronts and product detail pages from backend **customize** configuration.

---

## Customize vs content

| API | Responsibility |
|-----|----------------|
| **Customize API** | Palette, typography, section visibility, order, style |
| **Content APIs** | Section data (items, text, images) — separate contracts, not yet documented here |

The mobile client resolves layout from customize JSON, then loads content per section when those APIs are wired.

---

## Quick start

```bash
flutter pub get
flutter run
```

Entry route: `/products` (`StoreProductsView`).

Production template engines: `StorefrontRenderer`, `ProductDetailScreen`.

---

## Documentation

| File | Purpose |
|------|---------|
| [docs/customize_api_contract.md](docs/customize_api_contract.md) | Customize API specification |
| [docs/storefront_customize_example.json](docs/storefront_customize_example.json) | Store page customize example |
| [docs/product_detail_customize_example.json](docs/product_detail_customize_example.json) | Product detail customize example |

---

## Tech stack

Flutter 3.7+ · GetX · Material 3 · google_fonts · dio

---

Private project — not published to pub.dev.
