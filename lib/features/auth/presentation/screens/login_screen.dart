import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:up_dev_chef_app/core/Widgets/custom_text_field.dart';
import 'package:up_dev_chef_app/core/services/service_locator.dart';
import 'package:up_dev_chef_app/core/theme/app_theme.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';
import 'package:up_dev_chef_app/core/utils/app_router.dart';
import 'package:up_dev_chef_app/core/utils/commons.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:up_dev_chef_app/features/auth/presentation/cubits/cubit/login_state.dart';

import '../../../../core/common/commons.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                showTwist(
                    state: ToastStates.success,
                    messege: AppStrings.loginSuccessful);
                navigateReplacment(context: context, route: Routes.home);
                BlocProvider.of<LoginCubit>(context).emailController.clear();
                BlocProvider.of<LoginCubit>(context).passwordController.clear();
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<LoginCubit>(context).loginKey,
                child: Column(
                  children: [
                    //! Image and welcome text
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(AppAssets.backgroundTwo))),
                        ),
                        const Center(
                            child: Text(
                          AppStrings.welcome,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),

                    //two texts Email and password
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Email
                          CustomTextFormField(
                            hint: AppStrings.email,
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            validator: (value) {
                              if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(value!) !=
                                  true) {
                                return AppStrings.pleaseEnterValidEmail;
                              }
                              if (value.isEmpty) {
                                return AppStrings.pleaseEnterValidEmail;
                              }
                              if (value.contains(' ')) {
                                return AppStrings.pleaseEnterValidEmail;
                              }
                              return null;
                            },
                          ),

                          const SizedBox(
                            height: 32,
                          ),

                          // Passsword Text Field
                          CustomTextFormField(
                            hint: AppStrings.password,
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            showSuffix: true,
                            suffixIcon: BlocProvider.of<LoginCubit>(context)
                                .suffixIcon(),
                            isObscure:
                                BlocProvider.of<LoginCubit>(context).obscure,

                            // changeSuffix: BlocProvider.of<LoginCubit>(context).changeSuffixIcon(),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  AppStrings.forgetPass,
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),

                          //elevated button

                          state is LoginLoadingState
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  height: 50,
                                  width: 190,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      bool internetCheacker =
                                          await sl<InternetConnectionChecker>()
                                              .hasConnection;

                                      if (loginCubit.loginKey.currentState!
                                          .validate()) {
                                        if (internetCheacker == true) {
                                          loginCubit.login();
                                        } else {
                                          showTwist(
                                              messege: "No Internet connection",
                                              state: ToastStates.error);
                                        }
                                      }
                                    },
                                    style:
                                        getAppTheme().elevatedButtonTheme.style,
                                    child: const Text(AppStrings.login),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),

                          //new account + Text

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    navigateReplacment(
                                        context: context, route: Routes.signUp);
                                  },
                                  child: const Text(
                                    AppStrings.createEmail,
                                    style: TextStyle(color: AppColors.primary),
                                  )),
                              const Text(AppStrings.dontHaveEmail)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
