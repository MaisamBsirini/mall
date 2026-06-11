import 'registries/palette_ids.dart';
import 'registries/theme_ids.dart';
import 'registries/typography_ids.dart';

class MerchantDesignConfig {
  final String paletteId;
  final String typographyId;
  final String themeId;

  const MerchantDesignConfig({
    required this.paletteId,
    required this.typographyId,
    required this.themeId,
  });

  factory MerchantDesignConfig.fromJson(Map<String, dynamic> json) {
    return MerchantDesignConfig(
      paletteId: json['palette'] as String? ?? PaletteId.luxuryDark,
      typographyId: json['typography'] as String? ?? TypographyId.elegantSerif,
      themeId: json['theme'] as String? ?? ThemeId.luxuryDark,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'palette': paletteId,
      'typography': typographyId,
      'theme': themeId,
    };
  }

  static const MerchantDesignConfig defaults = MerchantDesignConfig(
    paletteId: PaletteId.luxuryDark,
    typographyId: TypographyId.elegantSerif,
    themeId: ThemeId.luxuryDark,
  );
}
