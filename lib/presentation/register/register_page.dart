import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/domain/entities/register.dart';
import 'package:flutter_base_bloc/gen/translations.g.dart';

import 'package:flutter_base_bloc/presentation/register/bloc/register_bloc.dart';
import 'package:flutter_base_bloc/presentation/widgets/button/app_button.dart';
import 'package:flutter_base_bloc/presentation/widgets/fillter/filter_screen.dart';

import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPageProvider extends StatelessWidget {
  const RegisterPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    userController.dispose();
    mailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

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
                      LocaleKeys.RegisterPage_title.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d30,
                      ),
                    ),
                    spaceH4,
                    Text(
                      LocaleKeys.RegisterPage_subTitile.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d12,
                        fontWeight: null,
                        color: color495566,
                      ),
                    ),
                    spaceH16,
                    FieldTextCommon(
                      labelText: LocaleKeys.RegisterPage_username.tr(),
                      suffixIcon: const Icon(
                        CupertinoIcons.person,
                        color: color6A6F7D,
                      ),
                      controller: userController,
                    ),
                    spaceH16,
                    FieldTextCommon(
                      labelText: LocaleKeys.RegisterPage_mail.tr(),
                      suffixIcon: const Icon(
                        CupertinoIcons.envelope,
                        color: color6A6F7D,
                      ),
                      controller: mailController,
                    ),
                    spaceH16,
                    FieldTextCommon(
                      isPassword: _obscureText,
                      labelText: LocaleKeys.RegisterPage_password.tr(),
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
                      controller: passwordController,
                    ),
                    spaceH16,
                    FieldTextCommon(
                      isPassword: _obscureText,
                      labelText: LocaleKeys.RegisterPage_confirmPassword.tr(),
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
                      controller: confirmpasswordController,
                    ),
                    spaceH16,
                    Center(
                      child: Column(
                        children: [
                          BlocListener<RegisterBloc, RegisterState>(
                            listenWhen: (previous, current) =>
                                previous.isLoading != current.isLoading,
                            listener: (context, state) {
                              if (state.isLoading) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              }

                              if (state.isSuccess) {
                                context.pushNamed(RoutesName.login.name);
                              }

                              if (state.errorMessage.isNotEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(state.errorMessage),
                                ));
                              }
                            },
                            child: BlocBuilder<RegisterBloc, RegisterState>(
                              buildWhen: (previous, current) =>
                                  previous.isLoading != current.isLoading,
                              builder: (context, state) {
                                return AppButton(
                                  color: colorMintyFresh,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.d120.r,
                                    vertical: Dimens.d12.r,
                                  ),
                                  onTap: () {
                                    if (passwordController.text !=
                                        confirmpasswordController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'nhập mật khẩu không khớp')),
                                      );
                                      return;
                                    }

                                    context.read<RegisterBloc>().add(
                                        RegisterEvent.register(
                                            registerModel: RegisterModel(
                                                email: mailController.text,
                                                password:
                                                    passwordController.text,
                                                confirmPassword:
                                                    confirmpasswordController
                                                        .text,
                                                username:
                                                    userController.text)));
                                  },
                                  title: LocaleKeys.RegisterPage_register.tr(),
                                  style: AppTextStyle.mediumText.copyWith(
                                      fontSize: Dimens.d15, color: colorWhite),
                                );
                              },
                            ),
                          ),
                          spaceH16,
                          RichText(
                            text: TextSpan(
                              text: LocaleKeys.RegisterPage_question.tr(),
                              style: AppTextStyle.mediumText.copyWith(
                                  fontSize: Dimens.d12, color: color6A6F7D),
                              children: [
                                TextSpan(
                                    text: LocaleKeys.loginPage_login.tr(),
                                    style: AppTextStyle.mediumText.copyWith(
                                      fontSize: Dimens.d12,
                                      color: colorMintyFresh,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .pushNamed(RoutesName.login.name)),
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
