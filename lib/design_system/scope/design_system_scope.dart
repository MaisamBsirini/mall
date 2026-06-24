import 'package:flutter/material.dart';

import '../app_design_system.dart';
import '../merchant_design_config.dart';

class DesignSystemScope extends InheritedWidget {
  final AppDesignSystem designSystem;

  const DesignSystemScope({
    super.key,
    required this.designSystem,
    required super.child,
  });

  static AppDesignSystem of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<DesignSystemScope>();

    assert(
      scope != null,
      'DesignSystemScope not found. Wrap your app with DesignSystemScope.',
    );

    return scope!.designSystem;
  }

  static AppDesignSystem? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DesignSystemScope>()
        ?.designSystem;
  }

  factory DesignSystemScope.fromConfig({
    Key? key,
    required MerchantDesignConfig config,
    required Widget child,
  }) {
    return DesignSystemScope(
      key: key,
      designSystem: AppDesignSystem.fromConfig(config),
      child: child,
    );
  }

  @override
  bool updateShouldNotify(DesignSystemScope oldWidget) {
    return designSystem.palette.id != oldWidget.designSystem.palette.id ||
        designSystem.typographyProfile.id !=
            oldWidget.designSystem.typographyProfile.id;
  }
}

extension DesignSystemContext on BuildContext {
  AppDesignSystem get ds => DesignSystemScope.of(this);
}
