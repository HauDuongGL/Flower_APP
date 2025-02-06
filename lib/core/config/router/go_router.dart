import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/network/di/module.dart';
import 'package:flutter_base_bloc/domain/locals/prefs_service.dart';
import 'package:flutter_base_bloc/presentation/Forgot_Password/forgotPassword_page.dart';
import 'package:flutter_base_bloc/presentation/login/login_page.dart';
// import 'package:flutter_base_bloc/presentation/home/home_page.dart';
import 'package:flutter_base_bloc/presentation/main/main_screen.dart';
import 'package:flutter_base_bloc/presentation/register/register_page.dart';
import 'package:flutter_base_bloc/presentation/welcome/welcome_screen.dart';
import 'package:flutter_base_bloc/presentation/widgets/dialog/app_bottom_sheet_args.dart';
import 'package:flutter_base_bloc/presentation/widgets/dialog/app_dialog_page.dart';

import 'package:go_router/go_router.dart';

import 'router_name.dart';

GoRoute _defaultGorouter({
  required RoutesGen router,
  required Widget Function(BuildContext context, GoRouterState state) builder,
  List<GoRoute> goRoutes = const [],
}) =>
    GoRoute(
      path: router.path,
      name: router.name,
      routes: goRoutes,
      builder: builder,
    );

// ignore: unused_element
GoRoute _transitionRouter({
  required RoutesGen router,
  required Widget page,
  List<GoRoute> goRoutes = const [],
}) =>
    GoRoute(
      path: router.path,
      name: router.name.isNotEmpty ? router.name : null,
      routes: goRoutes,
      redirect: (BuildContext context, GoRouterState state) {
        if (PrefsService.getToken().isEmpty &&
            state.name != RoutesName.register.name) {
          return RoutesName.login.path;
        }
        return null;
      },
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    );

GoRoute _dialogRoute({
  required RoutesGen router,
  required Widget Function(BuildContext context, GoRouterState state) builder,
}) {
  return GoRoute(
    path: router.path,
    name: router.name,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return AppDialogPage(
        builder: (context) => builder(context, state),
      );
    },
  );
}

GoRoute _bottomSheetRoute({
  required RoutesGen router,
  required AppBottomSheetArgs arg,
}) {
  return GoRoute(
    path: router.path,
    name: router.name,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return AppBottomSheetPage(
        args: arg,
      );
    },
  );
}

class InformationDialogArg {
  final String title;
  final String content;

  InformationDialogArg({
    required this.title,
    required this.content,
  });
}

final GoRouter appRouterConfig = GoRouter(
  navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
  initialLocation: RoutesName.welcome.path,
  routes: <RouteBase>[
    _defaultGorouter(
      router: RoutesName.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    _defaultGorouter(
      router: RoutesName.login,
      builder: (context, state) => const LoginPage(),
    ),
    _defaultGorouter(
      router: RoutesName.register,
      builder: (context, state) => const RegisterPage(),
    ),
    _defaultGorouter(
      router: RoutesName.forgotPassword,
      builder: (context, state) => const ForgotpasswordPage(),
    ),
    // _defaultGorouter(
    //   router: RoutesName.newsDetail,
    //   builder: (context, state) {
    //     final args = state.extra as NewsModel;
    //     return NewsDetailScreen(
    //       news: args,
    //     );
    //   },
    // ),
    // _defaultGorouter(
    //   router: RoutesName.detailsCharge,
    //   builder: (context, state) {
    //     final args = state.extra as ChargeStationModel;
    //     return DetailsScreen(
    //       item: args,
    //     );
    //   },
    // ),
    _defaultGorouter(
      router: RoutesName.main,
      builder: (context, state) => const Main(),
      goRoutes: [
        // _defaultGorouter(
        //   router: RoutesName.home,
        //   builder: (context, state) {
        //     final args = state.extra as bool;
        //     return HomePage(
        //       locationPermission: args,
        //     );
        //   },
        // ),
      ],
    ),
    // _dialogRoute(
    //   router: RoutesName.dialogInformation,
    //   builder: (context, state) {
    //     final args = state.extra as InformationDialogArg;

    //     return InformationDialogWidget(
    //       title: args.title,
    //       content: args.content,
    //     );
    //   },
    // ),
    // _dialogRoute(
    //   router: RoutesName.dialogConfirm,
    //   builder: (context, state) {
    //     final args = state.extra as ConfirmDialogArg;
    //     return ConfirmDialogWidget(
    //       confirmDialogArg: args,
    //     );
    //   },
    // ),
    _bottomSheetRoute(
      router: RoutesName.bottomSheet,
      arg: AppBottomSheetArgs(
        builder: (context) {
          // TODO(hungnd): test function
          return Container(
            color: Colors.red,
            width: double.infinity,
          );
        },
      ),
    ),
  ],
);
