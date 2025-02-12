import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/router/router_name.dart';
import 'package:flutter_base_bloc/domain/entities/forgotPassword.dart';
import 'package:flutter_base_bloc/gen/translations.g.dart';
import 'package:flutter_base_bloc/presentation/Forgot_Password/bloc/forgot_password_bloc.dart';
import 'package:flutter_base_bloc/presentation/widgets/button/app_button.dart';
import 'package:flutter_base_bloc/presentation/widgets/fillter/filter_screen.dart';

import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotpasswordPageProvider extends StatelessWidget {
  const ForgotpasswordPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: const ForgotpasswordPage(),
    );
  }
}

class ForgotpasswordPage extends StatefulWidget {
  const ForgotpasswordPage({super.key});

  @override
  State<ForgotpasswordPage> createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    email.dispose();
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
                      LocaleKeys.ForgotpasswordPage_title.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d30,
                      ),
                    ),
                    spaceH4,
                    Text(
                      LocaleKeys.ForgotpasswordPage_subTitile.tr(),
                      style: AppTextStyle.mediumText.copyWith(
                        fontSize: Dimens.d12,
                        fontWeight: null,
                        color: color495566,
                      ),
                    ),
                    spaceH16,
                    FieldTextCommon(
                      labelText: LocaleKeys.ForgotpasswordPage_email.tr(),
                      suffixIcon: const Icon(
                        CupertinoIcons.person,
                        color: color6A6F7D,
                      ),
                      controller: email,
                    ),
                    spaceH16,
                    FieldTextCommon(
                      isPassword: _obscureText,
                      labelText: LocaleKeys.ForgotpasswordPage_password.tr(),
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
                      labelText:
                          LocaleKeys.ForgotpasswordPage_confirmPassword.tr(),
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
                    spaceH28,
                    Center(
                      child:
                          BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                        listenWhen: (previous, current) =>
                            previous.isLoading != current.isLoading,
                        listener: (context, state) {
                          if (state.isLoading) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => const Center(
                                      child: CircularProgressIndicator(),
                                    ));
                          } else {
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                          if (state.isSuccess) {
                            context.pushNamed(RoutesName.login.name);
                          }
                          if (state.errorMessgae.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMessgae),
                              ),
                            );
                          }
                        },
                        child: BlocBuilder<ForgotPasswordBloc,
                            ForgotPasswordState>(
                          buildWhen: (previous, current) =>
                              previous.isLoading != current.isLoading,
                          builder: (context, state) {
                            return AppButton(
                              color: colorMintyFresh,
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimens.d80.r,
                                vertical: Dimens.d12.r,
                              ),
                              onTap: () {
                                if (passwordController.text !=
                                    confirmpasswordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(LocaleKeys
                                            .ForgotpasswordPage_message.tr())),
                                  );
                                  return;
                                }
                                context
                                    .read<ForgotPasswordBloc>()
                                    .add(ForgotPasswordEvent.forgotPassword(
                                      forgotPassword: ForgotpasswordModel(
                                        email: email.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmpasswordController.text,
                                      ),
                                    ));
                              },
                              title: LocaleKeys
                                  .ForgotpasswordPage_forgotPassword.tr(),
                              style: AppTextStyle.mediumText.copyWith(
                                  fontSize: Dimens.d15, color: colorWhite),
                            );
                          },
                        ),
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
