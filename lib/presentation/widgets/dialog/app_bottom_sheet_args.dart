import 'package:flutter/material.dart';

class AppBottomSheetArgs {
  AppBottomSheetArgs({
    required this.builder,
    this.anchorPoint,
    this.backgroundColor = Colors.white,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    this.isScrollControlled = false,
  });
  final Offset? anchorPoint;
  final Color? backgroundColor;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;
  final bool isScrollControlled;
}

class AppBottomSheetPage<T> extends Page<T> {
  const AppBottomSheetPage({
    required this.args,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });
  final AppBottomSheetArgs args;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        backgroundColor: args.backgroundColor,
        isScrollControlled: args.isScrollControlled,
        settings: this,
        builder: args.builder,
        anchorPoint: args.anchorPoint,
        barrierLabel: args.barrierLabel,
        useSafeArea: args.useSafeArea,
      );
}
