import 'package:flutter_base_bloc/gen/assets.gen.dart';

enum PageType {
  home(0),
  camera(1),
  profile(2);

  final int pageIndex;
  const PageType(this.pageIndex);

  static getPageFromIndex(int index) {
    try {
      return PageType.values.firstWhere(
        (element) => element.pageIndex == index,
      );
    } catch (_) {
      return PageType.home;
    }
  }
}

extension PageTypeExtension on PageType {
  String get pageName {
    switch (this) {
      case PageType.profile:
        return "Profile";
      case PageType.camera:
        return "Camera";
      case PageType.home:
        return "Home";
    }
  }

  SvgGenImage get svgGenImage {
    switch (this) {
      case PageType.home:
        return Assets.icons.icHome;
      case PageType.camera:
        return Assets.icons.icAddressBook;
      case PageType.profile:
        return Assets.icons.icGroup;
    }
  }
}
