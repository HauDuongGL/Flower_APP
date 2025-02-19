import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';

enum PageType {
  spring,
  summer,
  autumn,
  winter;
}

enum PageRouter {
  springPage,
  summerPage,
  autumnPage,
  winterPage;
}

extension PageTypeExtension on PageType {
  String get pageName {
    switch (this) {
      case PageType.spring:
        return "Spring Flowers";
      case PageType.summer:
        return "Summer Flowers";
      case PageType.autumn:
        return "Autumn Flowers";
      case PageType.winter:
        return "Winter Flowers";
      default:
        return "";
    }
  }

  AssetGenImage get assetsGenImage {
    switch (this) {
      case PageType.spring:
        return Assets.images.backgrondSpringFlowers;
      case PageType.summer:
        return Assets.images.backgrondSummerFlowers;
      case PageType.autumn:
        return Assets.images.backgroundAutumnFlowers;
      case PageType.winter:
        return Assets.images.backgroundWinterFlowers;
    }
  }

  String get pageRouter {
    switch (this) {
      case PageType.spring:
        return RoutesName.login.name;
      case PageType.summer:
        return "Summer Flowers";
      case PageType.autumn:
        return "Autumn Flowers";
      case PageType.winter:
        return "Winter Flowers";
      default:
        return "";
    }
  }
}
