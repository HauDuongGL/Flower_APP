import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_base_bloc/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_base_bloc/presentation/home/common/enum.dart';
import 'package:flutter_base_bloc/presentation/home/common/search_common.dart';
import 'package:flutter_base_bloc/presentation/home/widget/items.dart';
import 'package:flutter_base_bloc/presentation/home/widget/list_items_flower.dart';
import 'package:flutter_base_bloc/presentation/widgets/button/app_button.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _isSearch = TextEditingController();
  final pageType = PageType.values;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AppScaffold(
        showAppBar: false,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppTheme.getInstance().linearHomeAppBar,
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello', style: AppTextStyle.boldText),
                          Text(
                            'Let’s Learn More About Plants',
                            style: AppTextStyle.lightText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Assets.images.onboardingFirst.image(
                          width: 47,
                          height: 47,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(Dimens.d21),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SearchCommon(
                              hint: 'Search For Plants ',
                              controller: _isSearch,
                            ),
                          ),
                          spaceW10,
                          GestureDetector(
                            child: Container(
                              child: Assets.icons.icChatgpt.svg(),
                            ),
                            onTap: () =>
                                context.pushNamed(RoutesName.chatGPT.name),
                          ),
                        ],
                      ),
                      spaceH18,
                      Text(
                        'Plant Types',
                        style: AppTextStyle.boldText.copyWith(
                          fontSize: 17,
                          color: AppTheme.getInstance().darkBlueGray,
                        ),
                      ),
                      spaceH20,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var item in PageType.values) ...[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                              ),
                              ...pageType
                                  .where((e) => e.pageName == item.pageName)
                                  .map((e) => Items(
                                        image: e.assetsGenImage,
                                        textItem: e.pageName,
                                        onTap: () => print(e.pageName),
                                        // context.pushNamed(e.pageName),
                                      ))
                            ]
                          ],
                        ),
                      ),
                      spaceH18,
                      Text(
                        'chatBot',
                        style: AppTextStyle.boldText.copyWith(
                          fontSize: 17,
                          color: AppTheme.getInstance().darkBlueGray,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 299,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                image: Assets.images.bgQuestion.provider()),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceH20,
                                  Text(
                                    'Answer your question with Flobot',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.boldText.copyWith(
                                      fontSize: 14,
                                      color: colorWhite,
                                    ),
                                  ),
                                  Text(
                                    'Flobot - Great assistant',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.boldText.copyWith(
                                      fontSize: 17,
                                      color: colorWhite,
                                    ),
                                  ),
                                  spaceH18,
                                  AppButton(
                                    color: colorWhite,
                                    title: 'Try it now',
                                    style: AppTextStyle.boldText
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Text(
                        'Favorite Flowers',
                        style: AppTextStyle.boldText.copyWith(
                          fontSize: 17,
                          color: AppTheme.getInstance().darkBlueGray,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 299,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                image: Assets.images.bgFavorite.provider()),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceH20,
                                  Text(
                                    'Store all your favorite flowers',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.boldText.copyWith(
                                      fontSize: 14,
                                      color: colorWhite,
                                    ),
                                  ),
                                  Text(
                                    'Flower collection',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.boldText.copyWith(
                                      fontSize: 17,
                                      color: colorWhite,
                                    ),
                                  ),
                                  spaceH18,
                                  AppButton(
                                    color: colorWhite,
                                    title: 'Go favorite flowers',
                                    style: AppTextStyle.boldText
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      ListItemFlower()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
