import 'registries/palette_ids.dart';
import 'registries/typography_ids.dart';

/// Merchant storefront visual identity — palette and typography only.
class MerchantDesignConfig {
  final String paletteId;
  final String typographyId;

  const MerchantDesignConfig({
    required this.paletteId,
    required this.typographyId,
  });

  factory MerchantDesignConfig.fromJson(Map<String, dynamic> json) {
    return MerchantDesignConfig(
      paletteId: json['palette'] as String? ?? PaletteId.luxuryDark,
      typographyId: json['typography'] as String? ?? TypographyId.elegantSerif,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'palette': paletteId,
      'typography': typographyId,
    };
  }

  static const MerchantDesignConfig defaults = MerchantDesignConfig(
    paletteId: PaletteId.luxuryDark,
    typographyId: TypographyId.elegantSerif,
  );
}
