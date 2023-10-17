import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:up_dev_chef_app/core/theme/app_theme.dart';
import 'package:up_dev_chef_app/core/utils/app_colors.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVis = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              //image and welcome text

              Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(AppAssets.backgroundTwo),
                    Center(
                        child: Text(AppStrings.welcome,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            color: AppColors.white
                          ),
                        )
                    )
                  ],
              ),

              SizedBox(
                height: 100,
              ),
              //two texts Email and password
              Padding(
                padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [

                            // Email

                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                              hintText: AppStrings.email,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),

                              validator: (data){
                                if(data!.isEmpty||
                                    !data.contains('@gmail.com')){
                                  return AppStrings.pleaseEnterValidEmail;
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 32,),

                            // Passsword

                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              obscureText: isVis,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                              hintText: AppStrings.password,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.grey),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isVis =! isVis;
                                    });
                                  },
                                  icon: isVis ? Icon(Icons.visibility_off,color: AppColors.primary,)
                                      :Icon(Icons.visibility,color: AppColors.primary,),
                                )
                              ),

                              validator: (data){
                                if(data!.length<6||data.isEmpty){
                                  return AppStrings.pleaseEnterValidPassword;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 24,),

                            // ForgetPass

                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {

                                  },
                                  child: Text(AppStrings.forgetPass,
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32,),

                            //elevated button

                            SizedBox(
                              height: 50,
                              width: 190,
                              child: ElevatedButton(
                                onPressed: (){

                                },
                                child: Text(AppStrings.login),
                              style: getAppTheme().elevatedButtonTheme.style,

                              ),
                              ),
                            SizedBox(height: 20,),

                            //new account + Text

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: (){},
                                    child: Text(AppStrings.createEmail,style: TextStyle(color: AppColors.primary),)
                                ),
                                Text(AppStrings.dontHaveEmail)
                              ],
                            )
                          ],
                            ),
              )
           ],
          ),
        ),
      ),
    );
  }
}
