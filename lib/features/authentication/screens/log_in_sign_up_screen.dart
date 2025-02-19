import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/auth_screens_header.dart';
import '../../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/generic_widgets/other_login_methods.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../home/screens/main_screen.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import 'forgot_password_screen.dart';

class LogInSignUpScreen extends StatelessWidget {
  LogInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: appColors.darkerBlueColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthScreensHeader(
              firstText: AppStrings.getStartedNow,
              secondText: AppStrings.createAnAccountOrLogInToExploreAboutOurApp,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: appColors.darkerWhiteColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Theme(
                                data: ThemeData(
                                  tabBarTheme: TabBarTheme(
                                    dividerColor: Colors
                                        .transparent,
                                  ),
                                ),
                                child: SizedBox(
                                  height: 36.h,
                                  child: TabBar(
                                    labelStyle: AppTextStyle.f14W500Black(context),
                                    labelColor: appColors.blackColor,
                                    unselectedLabelColor: appColors.grayishBlueColor,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorPadding: EdgeInsets.symmetric(
                                        horizontal: 9.w, vertical: 3.h),
                                    indicator: BoxDecoration(
                                      color: appColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    tabs: [
                                      Tab(text: AppStrings.logIn.tr(),),
                                      Tab(text: AppStrings.signUp.tr(),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 610.h,
                            child: TabBarView(
                              children: [
                                LoginForm(),
                                SignUpForm(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final _formLoginKey = GlobalKey<FormState>();
  TextEditingController emailAddressLogInController = TextEditingController();
  TextEditingController passwordLogInController = TextEditingController();
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Form(
      key: _formLoginKey,
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          CustomTextFormField(
            nameController: emailAddressLogInController,
            text: AppStrings.email,
            keyboardType: TextInputType.emailAddress,
            validatorType: "email",
            hintText: AppStrings.mail,
          ),
          SizedBox(height: 6.h),
          CustomTextFormField(
            nameController: passwordLogInController,
            text: AppStrings.password,
            isPassword: true,
            validatorType: "password",
            hintText: AppStrings.pass,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 22.w,
              ),
              SizedBox(
                width: 19.w,
                child: ValueListenableBuilder(
                    valueListenable: rememberMe,
                    builder: (context, value, child) {
                      return IconButton(
                        color: appColors.lighterBlueColor,
                        iconSize: 19,
                        onPressed: () {
                          if (rememberMe.value == false) {
                            rememberMe.value = true;
                          } else {
                            rememberMe.value = false;
                          }
                        },
                        icon: Icon(rememberMe.value
                            ? Icons.check_box
                            : Icons.check_box_outline_blank),
                      );
                    }),
              ),
              SizedBox(
                width: 9.w,
              ),
              Text(
                AppStrings.rememberMe.tr(),
                style: AppTextStyle.f12W500DarkGrey(context),
              ),
              SizedBox(
                width: 108.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  AppStrings.forgotPassword.tr(),
                  style: AppTextStyle.f12W600LighterBlue(context),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
            ],
          ),
          SizedBox(
            height: 39.h,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) {
              if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return MainButton(
                    text: AppStrings.logIn.tr(),
                    onPressed: () {
                      if (_formLoginKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                            emailAddressLogInController.text,
                            passwordLogInController.text);
                      }
                    },
                    buttonColor: appColors.lighterBlueColor,
                    textColor: appColors.almostWhiteColor);
              }
            },
            listener: (BuildContext context, AuthState state) {
              if (state is LoginSuccessState) {
                state.model.cacheLoginToken();
                // if (rememberMe.value){
                //   cacheLogin();
                // }
                cacheLogin();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMsg),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 13,
          ),
          OtherLoginMethods(),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }

  Future<void> cacheLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
}

class SignUpForm extends StatelessWidget {
  final _formSignupKey = GlobalKey<FormState>();

  TextEditingController emailAddressSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController confirmPasswordSignUpController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Form(
      key: _formSignupKey,
      child: Column(
        children: [
          SizedBox(height: 12.h),
          CustomTextFormField(
            nameController: emailAddressSignUpController,
            text: AppStrings.email,
            keyboardType: TextInputType.emailAddress,
            validatorType: "email",
            hintText: AppStrings.mail,
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            nameController: passwordSignUpController,
            text: AppStrings.password,
            isPassword: true,
            validatorType: "password",
            hintText: AppStrings.pass,
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            nameController: confirmPasswordSignUpController,
            text: AppStrings.confirmPassword,
            isConfirmPassword: true,
            validatorType: "confirmPassword",
            hintText: AppStrings.pass,
            originalPasswordController: passwordSignUpController,
          ),
          SizedBox(height: 24.h),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) {
              if (state is RegisterLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return MainButton(
                    text: AppStrings.agreeAndRegister.tr(),
                    onPressed: () {
                      if (_formSignupKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                            emailAddressSignUpController.text,
                            trimUntilCharacter(
                                emailAddressSignUpController.text, '@'),
                            passwordSignUpController.text,
                            confirmPasswordSignUpController.text);
                      }
                    },
                    buttonColor: appColors.lighterBlueColor,
                    textColor: appColors.almostWhiteColor);
              }
            },
            listener: (BuildContext context, AuthState state) {
              if (state is RegisterSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.model.message!),
                  ),
                );

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LogInSignUpScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }

              if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMsg),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          OtherLoginMethods(),
        ],
      ),
    );
  }

  String trimUntilCharacter(String text, String character) {
    int index = text.indexOf(character);
    return index == -1 ? text : text.substring(0, index);
  }
}
