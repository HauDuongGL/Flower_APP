import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/gen/translations.g.dart';
import 'package:flutter_base_bloc/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_base_bloc/presentation/widgets/button/app_button.dart';
import 'package:flutter_base_bloc/presentation/widgets/fillter/filter_screen.dart';

import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppScaffold(
        backgroundColor: colorChip,
        iconColor: colorA1A8B9,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.d24.r),
              child: FocusScope(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.loginPage_login.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d30,
                      ),
                    ),
                    spaceH4,
                    Text(
                      LocaleKeys.loginPage_subTitile.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d12,
                        fontWeight: null,
                        color: color495566,
                      ),
                    ),
                    spaceH16,
                    FieldTextCommon(
                      labelText: LocaleKeys.loginPage_userName.tr(),
                      suffixIcon: const Icon(
                        CupertinoIcons.person,
                        color: color6A6F7D,
                      ),
                    ),
                    spaceH16,
                    FieldTextCommon(
                      isPassword: _obscureText,
                      labelText: LocaleKeys.loginPage_password.tr(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: color6A6F7D,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    spaceH16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: colorRate,
                            ),
                            onPressed: () => context
                                .pushNamed(RoutesName.forgotPassword.name),
                            child: Text(
                                LocaleKeys.loginPage_forgotPassword.tr(),
                                style: AppTextStyle.mediumText.copyWith(
                                    fontSize: Dimens.d11, color: color6A6F7D))),
                      ],
                    ),
                    spaceH16,
                    Center(
                      child: Column(
                        children: [
                          AppButton(
                            color: colorMintyFresh,
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimens.d120.r,
                              vertical: Dimens.d12.r,
                            ),
                            onTap: () =>
                                context.pushNamed(RoutesName.main.name),
                            title: LocaleKeys.loginPage_login.tr(),
                            style: AppTextStyle.mediumText.copyWith(
                                fontSize: Dimens.d15, color: colorWhite),
                          ),
                          spaceH16,
                          RichText(
                            text: TextSpan(
                              text: LocaleKeys.loginPage_account.tr(),
                              style: AppTextStyle.mediumText.copyWith(
                                  fontSize: Dimens.d12, color: color6A6F7D),
                              children: [
                                TextSpan(
                                    text: LocaleKeys.loginPage_register.tr(),
                                    style: AppTextStyle.mediumText.copyWith(
                                      fontSize: Dimens.d12,
                                      color: colorMintyFresh,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .pushNamed(RoutesName.register.name)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
