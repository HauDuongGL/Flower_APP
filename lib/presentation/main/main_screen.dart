import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_page_state.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/language.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';
import 'package:flutter_base_bloc/presentation/home/home_page.dart';
import 'package:flutter_base_bloc/utils/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_bloc.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageState<MainScreen, MainBloc> {
  final _pageController = PageController();

  @override
  void initState() {
    // bloc.add(const MainEvent.getAllUser());
    // bloc.add(const MainEvent.getUserInfo());
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return AppScaffold(
      title: 'HOME SCREEN',
      showBackButton: false,
      appbarAction: [
        InkWell(
          onTap: () {
            context.setLocale(
              context.locale == AppLanguages.vi
                  ? AppLanguages.en
                  : AppLanguages.vi,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.getInstance().primaryColor.withOpacity(0.6),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              context.locale.languageCode,
            ),
          ),
        )
      ],
      body: BlocListener<MainBloc, MainState>(
        listenWhen: (previous, current) =>
            previous.currentPageIndex != current.currentPageIndex,
        listener: (context, state) {
          _pageController.animateToPage(
            state.currentPageIndex,
            curve: Curves.linearToEaseOut,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (currentPage) {
            bloc.add(MainEvent.changePage(currentPage));
          },
          children: const [
            HomePageProvider(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppTheme.getInstance().primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocSelector<MainBloc, MainState, int>(
              selector: (state) {
                return state.currentPageIndex;
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    bloc.add(const MainEvent.changePage(0));
                  },
                  icon: Icon(
                    CupertinoIcons.home,
                    color: state == 0
                        ? const Color(0xff870333)
                        : AppTheme.getInstance().formColor,
                  ),
                );
              },
            ),
            BlocSelector<MainBloc, MainState, int>(
              selector: (state) {
                return state.currentPageIndex;
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    bloc.add(const MainEvent.changePage(1));
                  },
                  icon: Icon(
                    CupertinoIcons.list_dash,
                    color: state == 1
                        ? const Color(0xff870333)
                        : AppTheme.getInstance().formColor,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                exitApp();
              },
              icon: Icon(
                CupertinoIcons.power,
                color: AppTheme.getInstance().formColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
