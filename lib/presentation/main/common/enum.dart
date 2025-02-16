import 'package:flutter_base_bloc/gen/assets.gen.dart';

enum PageType {
  search(0),
  battery(1),
  news(2);

  final int pageIndex;
  const PageType(this.pageIndex);

  static getPageFromIndex(int index) {
    try {
      return PageType.values.firstWhere(
        (element) => element.pageIndex == index,
      );
    } catch (_) {
      return PageType.search;
    }
  }
}

extension PageTypeExtension on PageType {
  String get pageName {
    switch (this) {
      case PageType.news:
        return "Home";
      case PageType.search:
        return "camera";
      case PageType.battery:
        return "profile";
    }
  }

  SvgGenImage get svgGenImage {
    switch (this) {
      case PageType.news:
        return Assets.icons.icAddSmall;
      case PageType.search:
        return Assets.icons.icAddressBook;
      case PageType.battery:
        return Assets.icons.icArrowLeft;
    }
  }
}
