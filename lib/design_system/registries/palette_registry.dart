import 'package:flutter/material.dart';

import '../models/app_palette.dart';
import 'palette_ids.dart';

class PaletteRegistry {
  PaletteRegistry._();

  static const AppPalette luxuryGold = AppPalette(
    id: PaletteId.luxuryGold,
    name: 'Luxury Gold',
    primary: Color(0xFFC9A962),
    secondary: Color(0xFF8B7355),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    textPrimary: Color(0xFFF5F0E8),
    textSecondary: Color(0xFFB8AFA0),
    accent: Color(0xFFE8D5A3),
    border: Color(0xFF3D3529),
    success: Color(0xFF6B9E78),
    warning: Color(0xFFD4A853),
    isDark: true,
  );

  static const AppPalette modernIndigo = AppPalette(
    id: PaletteId.modernIndigo,
    name: 'Modern Indigo',
    primary: Color(0xFF4F46E5),
    secondary: Color(0xFF6366F1),
    background: Color(0xFFF8FAFC),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF64748B),
    accent: Color(0xFF818CF8),
    border: Color(0xFFE2E8F0),
    success: Color(0xFF10B981),
    warning: Color(0xFFF59E0B),
  );

  static const AppPalette softBeige = AppPalette(
    id: PaletteId.softBeige,
    name: 'Soft Beige',
    primary: Color(0xFF9C7C5C),
    secondary: Color(0xFFB8956F),
    background: Color(0xFFFAF7F2),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF3D3428),
    textSecondary: Color(0xFF8A7B6A),
    accent: Color(0xFFD4B896),
    border: Color(0xFFE8DFD2),
    success: Color(0xFF7A9E7E),
    warning: Color(0xFFCB9B5C),
  );

  static const AppPalette darkEmerald = AppPalette(
    id: PaletteId.darkEmerald,
    name: 'Dark Emerald',
    primary: Color(0xFF10B981),
    secondary: Color(0xFF059669),
    background: Color(0xFF0C1512),
    surface: Color(0xFF152420),
    textPrimary: Color(0xFFE8F5F0),
    textSecondary: Color(0xFF8FB5A8),
    accent: Color(0xFF34D399),
    border: Color(0xFF1F3D34),
    success: Color(0xFF34D399),
    warning: Color(0xFFFBBF24),
    isDark: true,
  );

  static const AppPalette roseBoutique = AppPalette(
    id: PaletteId.roseBoutique,
    name: 'Rose Boutique',
    primary: Color(0xFFB5496B),
    secondary: Color(0xFFD4738F),
    background: Color(0xFFFFF8FA),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF3D1F2B),
    textSecondary: Color(0xFF9A6B7A),
    accent: Color(0xFFF0A8BC),
    border: Color(0xFFF3D9E2),
    success: Color(0xFF6B9E78),
    warning: Color(0xFFE8A54B),
  );

  static const AppPalette midnightPurple = AppPalette(
    id: PaletteId.midnightPurple,
    name: 'Midnight Purple',
    primary: Color(0xFF7C3AED),
    secondary: Color(0xFF8B5CF6),
    background: Color(0xFF0F0A1A),
    surface: Color(0xFF1A1228),
    textPrimary: Color(0xFFF0EBFF),
    textSecondary: Color(0xFFA89BC4),
    accent: Color(0xFFA78BFA),
    border: Color(0xFF2D2245),
    success: Color(0xFF34D399),
    warning: Color(0xFFFBBF24),
    isDark: true,
  );

  static const AppPalette warmMinimal = AppPalette(
    id: PaletteId.warmMinimal,
    name: 'Warm Minimal',
    primary: Color(0xFF2D2A26),
    secondary: Color(0xFF5C564E),
    background: Color(0xFFFFFCF8),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF1C1917),
    textSecondary: Color(0xFF78716C),
    accent: Color(0xFFA8A29E),
    border: Color(0xFFE7E5E4),
    success: Color(0xFF65A30D),
    warning: Color(0xFFD97706),
  );

  static const AppPalette oceanBlue = AppPalette(
    id: PaletteId.oceanBlue,
    name: 'Ocean Blue',
    primary: Color(0xFF0284C7),
    secondary: Color(0xFF0EA5E9),
    background: Color(0xFFF0F9FF),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF0C4A6E),
    textSecondary: Color(0xFF64748B),
    accent: Color(0xFF38BDF8),
    border: Color(0xFFBAE6FD),
    success: Color(0xFF10B981),
    warning: Color(0xFFF59E0B),
  );

  static const AppPalette neutralEditorial = AppPalette(
    id: PaletteId.neutralEditorial,
    name: 'Neutral Editorial',
    primary: Color(0xFF374151),
    secondary: Color(0xFF6B7280),
    background: Color(0xFFF9FAFB),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF111827),
    textSecondary: Color(0xFF6B7280),
    accent: Color(0xFF9CA3AF),
    border: Color(0xFFE5E7EB),
    success: Color(0xFF059669),
    warning: Color(0xFFD97706),
  );

  static const AppPalette premiumMonochrome = AppPalette(
    id: PaletteId.premiumMonochrome,
    name: 'Premium Monochrome',
    primary: Color(0xFF18181B),
    secondary: Color(0xFF3F3F46),
    background: Color(0xFFFAFAFA),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF09090B),
    textSecondary: Color(0xFF71717A),
    accent: Color(0xFFA1A1AA),
    border: Color(0xFFE4E4E7),
    success: Color(0xFF22C55E),
    warning: Color(0xFFEAB308),
  );

  static const AppPalette luxuryDark = AppPalette(
    id: PaletteId.luxuryDark,
    name: 'Luxury Dark',
    primary: Color(0xFF6B1E2E),
    secondary: Color(0xFF8B3A4A),
    background: Color(0xFF141010),
    surface: Color(0xFF221A1C),
    textPrimary: Color(0xFFF5ECEE),
    textSecondary: Color(0xFFB8A0A6),
    accent: Color(0xFFC9A0A8),
    border: Color(0xFF3D2A30),
    success: Color(0xFF6B9E78),
    warning: Color(0xFFD4A853),
    isDark: true,
  );

  static const Map<String, AppPalette> _palettes = {
    PaletteId.luxuryGold: luxuryGold,
    PaletteId.modernIndigo: modernIndigo,
    PaletteId.softBeige: softBeige,
    PaletteId.darkEmerald: darkEmerald,
    PaletteId.roseBoutique: roseBoutique,
    PaletteId.midnightPurple: midnightPurple,
    PaletteId.warmMinimal: warmMinimal,
    PaletteId.oceanBlue: oceanBlue,
    PaletteId.neutralEditorial: neutralEditorial,
    PaletteId.premiumMonochrome: premiumMonochrome,
    PaletteId.luxuryDark: luxuryDark,
  };

  static AppPalette get(String id) => _palettes[id] ?? luxuryDark;

  static List<AppPalette> get all => _palettes.values.toList();
}
