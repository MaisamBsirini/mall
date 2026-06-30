import 'package:get/get.dart';

/// Main bottom navigation routes — index matches [HomeStrings.navItems].
abstract final class MainNavRoutes {
  static const home = '/home';
  static const floors = '/floors';
  static const zones = '/zones';
  static const stores = '/stores';
  static const services = '/services';

  static const homeAr = '/home/ar';
  static const floorsAr = '/floors/ar';

  static void goToTab(int index) {
    final isAr = Get.locale?.languageCode == 'ar';
    switch (index) {
      case 0:
        Get.offNamed(isAr ? homeAr : home);
      case 1:
        Get.offNamed(isAr ? floorsAr : floors);
      default:
        break;
    }
  }

  static int currentIndexForRoute(String? route) {
    if (route == null) return 0;
    if (route.startsWith('/floors')) return 1;
    if (route.startsWith('/zones')) return 2;
    if (route.startsWith('/stores')) return 3;
    if (route.startsWith('/services')) return 4;
    return 0;
  }
}
