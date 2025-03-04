import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_base_bloc/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_base_bloc/presentation/profile/widget/item_profile.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfilePageProvider extends StatelessWidget {
  const ProfilePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBackButton: true,
      backgroundColor: color29D890,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: color29D890,
              height: Dimens.d140.h,
              child: Column(
                children: [
                  ClipOval(
                    child: Assets.images.backgrondSpringFlowers.image(
                      fit: BoxFit.cover,
                      width: 100.w,
                      height: 100.w,
                    ),
                  ),
                  spaceW5,
                  Text(
                    'Taylor Swift',
                    style: AppTextStyle.boldText.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  spaceH5,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.icLocation.svg(),
                        spaceW10,
                        Text(
                          'Nghe An, Viet Nam',
                          style: AppTextStyle.regularText.copyWith(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.d22, vertical: Dimens.d10),
              child: Text(
                'Favorite Plant',
                style: AppTextStyle.boldText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 400.h,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemProfile();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
