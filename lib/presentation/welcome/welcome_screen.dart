import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_base_bloc/gen/translations.g.dart';
import 'package:flutter_base_bloc/presentation/widgets/button/app_button.dart';
import 'package:flutter_base_bloc/presentation/widgets/onBoarding/onBoardingCommon.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController();
  bool islastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimens.d24.r),
          child: Container(
            padding: EdgeInsets.only(bottom: Dimens.d20.r),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => islastPage = index == Dimens.d2);
              },
              children: [
                Center(
                  child: OnBoardingCommon(
                    title: LocaleKeys.welcome_identifyPlant.tr(),
                    subTitle: LocaleKeys.welcome_onBoardingfirst.tr(),
                    image: Assets.images.onboardingFirst.path,
                  ),
                ),
                Center(
                  child: OnBoardingCommon(
                      title: LocaleKeys.welcome_learnManyPlantsSpecies.tr(),
                      subTitle: LocaleKeys.welcome_onBoardingSecond.tr(),
                      image: Assets.images.onboardingSecond.path),
                ),
                Center(
                  child: OnBoardingCommon(
                      title: LocaleKeys.welcome_readManyArticlesAboutPlant.tr(),
                      subTitle: LocaleKeys.welcome_onBoardingThird.tr(),
                      image: Assets.images.onboardingThird.path),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Dimens.d160,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.d15.r),
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  dotWidth: Dimens.d10.w,
                  dotHeight: Dimens.d10.h,
                  spacing: Dimens.d12.w,
                  dotColor: colorBlack,
                  activeDotColor: AppTheme.getInstance().mintyFresh,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
              ),
              spaceH50,
              AppButton(
                width: Dimens.d329,
                title: islastPage
                    ? LocaleKeys.welcome_getStarted.tr()
                    : LocaleKeys.welcome_next.tr(),
                style: AppTextStyle.boldText.copyWith(
                  fontSize: 15.sp,
                  color: colorWhite,
                ),
                color: AppTheme.getInstance().mintyFresh,
                onTap: () {
                  if (islastPage) {
                    context.pushNamed(RoutesName.login.name);
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
