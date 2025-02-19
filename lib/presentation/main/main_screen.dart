import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';
import 'package:flutter_base_bloc/presentation/camera/camera.dart';
import 'package:flutter_base_bloc/presentation/home/home_page.dart';
import 'package:flutter_base_bloc/presentation/main/common/enum.dart';
import 'package:flutter_base_bloc/presentation/profile/profile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController();
  late MainBloc bloc;

  @override
  void initState() {
    bloc = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Trạm Sạc EV',
      showBackButton: false,
      showAppBar: false,
      body: BlocListener<MainBloc, MainState>(
        listenWhen: (previous, current) =>
            previous.currentPageType != current.currentPageType,
        listener: (context, state) {
          _pageController.animateToPage(
            state.currentPageType.pageIndex,
            curve: Curves.linearToEaseOut,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePageProvider(),
            CameraPageProvider(),
            ProfilePageProvider(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          color: Colors.white,
          child: BlocSelector<MainBloc, MainState, PageType>(
            selector: (state) {
              return state.currentPageType;
            },
            builder: (context, state) {
              return Row(
                children: List.generate(
                  PageType.values.length,
                  (i) => _buildBottomNavigationItem(
                    page: PageType.values[i],
                    currentPage: state,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(
      {required PageType page, required PageType currentPage}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          bloc.add(
            MainEvent.changePage(
              page,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 4.h,
          ),
          color: page == currentPage ? null : Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              page.svgGenImage.svg(
                colorFilter: page == currentPage
                    ? ColorFilter.mode(
                        AppTheme.getInstance().mintyFresh, BlendMode.srcIn)
                    : ColorFilter.mode(
                        AppTheme.getInstance().lightSilver, BlendMode.srcIn),
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  page.pageName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight:
                        page == currentPage ? FontWeight.w700 : FontWeight.w400,
                    color: page == currentPage
                        ? AppTheme.getInstance().mintyFresh
                        : AppTheme.getInstance().lightSilver,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
