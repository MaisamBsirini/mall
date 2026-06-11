import '../models/typography_profile.dart';
import 'typography_ids.dart';

class TypographyRegistry {
  TypographyRegistry._();

  static const TypographyProfile elegantSerif = TypographyProfile(
    id: TypographyId.elegantSerif,
    name: 'Elegant Serif',
    fontFamily: 'serif',
    headingScale: 1.05,
    titleScale: 1.02,
    headingWeight: 700,
    titleWeight: 600,
    headingLetterSpacing: -0.2,
    titleLetterSpacing: 0.1,
    bodyLetterSpacing: 0.15,
  );

  static const TypographyProfile modernSans = TypographyProfile(
    id: TypographyId.modernSans,
    name: 'Modern Sans',
    fontFamily: 'sans-serif',
    headingScale: 1.0,
    titleScale: 0.98,
    headingWeight: 700,
    titleWeight: 600,
    headingLetterSpacing: -0.5,
    buttonLetterSpacing: 0.8,
  );

  static const TypographyProfile luxuryEditorial = TypographyProfile(
    id: TypographyId.luxuryEditorial,
    name: 'Luxury Editorial',
    fontFamily: 'serif',
    headingScale: 1.12,
    titleScale: 1.06,
    bodyScale: 1.02,
    headingWeight: 700,
    titleWeight: 500,
    headingLetterSpacing: 0.2,
    titleLetterSpacing: 0.4,
    bodyLetterSpacing: 0.2,
    headingLineHeight: 1.1,
  );

  static const TypographyProfile minimalClean = TypographyProfile(
    id: TypographyId.minimalClean,
    name: 'Minimal Clean',
    fontFamily: 'sans-serif',
    headingScale: 0.96,
    titleScale: 0.94,
    bodyScale: 0.96,
    captionScale: 0.94,
    headingWeight: 600,
    titleWeight: 500,
    bodyWeight: 400,
    headingLetterSpacing: -0.8,
    bodyLetterSpacing: 0,
    headingLineHeight: 1.2,
  );

  static const TypographyProfile boldCommerce = TypographyProfile(
    id: TypographyId.boldCommerce,
    name: 'Bold Commerce',
    fontFamily: 'sans-serif',
    headingScale: 1.08,
    titleScale: 1.04,
    buttonScale: 1.02,
    headingWeight: 800,
    titleWeight: 700,
    buttonWeight: 700,
    headingLetterSpacing: -1.0,
    buttonLetterSpacing: 1.0,
    headingLineHeight: 1.1,
  );

  static const TypographyProfile softRounded = TypographyProfile(
    id: TypographyId.softRounded,
    name: 'Soft Rounded',
    fontFamily: 'sans-serif',
    headingScale: 1.0,
    titleScale: 0.98,
    bodyScale: 1.0,
    headingWeight: 600,
    titleWeight: 500,
    bodyWeight: 400,
    headingLetterSpacing: 0,
    bodyLetterSpacing: 0.2,
    headingLineHeight: 1.25,
    titleLineHeight: 1.3,
  );

  static const TypographyProfile premiumDisplay = TypographyProfile(
    id: TypographyId.premiumDisplay,
    name: 'Premium Display',
    fontFamily: 'serif',
    headingScale: 1.18,
    titleScale: 1.08,
    captionScale: 0.92,
    headingWeight: 700,
    titleWeight: 600,
    headingLetterSpacing: 0.5,
    titleLetterSpacing: 0.3,
    headingLineHeight: 1.05,
    titleLineHeight: 1.15,
  );

  static const Map<String, TypographyProfile> _profiles = {
    TypographyId.elegantSerif: elegantSerif,
    TypographyId.modernSans: modernSans,
    TypographyId.luxuryEditorial: luxuryEditorial,
    TypographyId.minimalClean: minimalClean,
    TypographyId.boldCommerce: boldCommerce,
    TypographyId.softRounded: softRounded,
    TypographyId.premiumDisplay: premiumDisplay,
  };

  static TypographyProfile get(String id) =>
      _profiles[id] ?? modernSans;

  static List<TypographyProfile> get all => _profiles.values.toList();
}
