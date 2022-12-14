import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_store/core/resources/color_manager.dart';
import 'package:mega_store/core/utils/custom_text.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/extensions.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/string_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/login_register_button.dart';
import '../../../login/presentation/widgets/default_form_field.dart';
import '../../../login/presentation/widgets/face_google_regis.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);


  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s20),
                child: Form(
                  key: formkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: AppSize.s20.w),
                          child: Image.asset(ImageAssets.megaLogo ,fit: BoxFit.fill,),),
                        SizedBox(height: AppSize.s30.h,),
                        TextUtils(text: AppStrings.getStarted, fontSize: AppSize.s16.sp, fontWeight: FontWeight.bold, color: ColorManager.wellcmeTo),
                        SizedBox(height: AppSize.s10.h,),
                        TextUtils(text: AppStrings.creatAcoount, fontSize: AppSize.s12.sp, fontWeight: FontWeight.normal, color: ColorManager.gGrey),
                        SizedBox(height: AppSize.s20.h,),

                        defaultFormField(
                          border: const OutlineInputBorder(),
                          controller: nameController,

                          type: TextInputType.emailAddress,
                          validate: ( value) {
                            if (value.isEmpty) {
                              return AppStrings.yourName;
                            }
                            return null ;
                          },
                          label: AppStrings.fullName,
                          prefix: Icons.person_outline,
                        ),
                        SizedBox(height: 15.0.h,),
                        defaultFormField(
                          border: const OutlineInputBorder(),
                          controller: emailController,

                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return AppStrings.validEmail;
                            } else {
                              return null;
                            }
                          },
                          label: AppStrings.yourEmail,
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(height: 15.0.h,),

                        defaultFormField(
                          border: const OutlineInputBorder(),
                          controller: phoneController,

                          type: TextInputType.phone,
                          validate: ( value) {
                            if (value.isEmpty) {
                              return AppStrings.validNumber;
                            }
                            return null ;
                          },
                          label: AppStrings.yourPhone,
                          prefix: Icons.phone,
                        ),
                        SizedBox(height: 15.0.h,),

                        defaultFormField(
                          border: const OutlineInputBorder(),
                          controller: passwordController,

                          type: TextInputType.visiblePassword,
                          validate: ( value) {
                            if (value.isEmpty) {
                              return AppStrings.enterPassword;
                            }
                            return null ;
                          },
                          label: AppStrings.password,
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(height: 15.0.h,),


                        defaultFormField(
                          border: const OutlineInputBorder(),
                          onFieldSubmitted: (value){


                          },

                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          validate: ( value) {
                            if (value.isEmpty) {
                              return AppStrings.enterPassword;
                            }
                            if(value !=passwordController.text)
                              return 'Password Not Match';
                            return null ;
                          },
                          label: AppStrings.confirmPass,
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(height: AppSize.s30.h,),

                        LoginRegisterButton(
                          text: AppStrings.signIn,
                          onPressed: () {
                            if ( formkey.currentState!.validate())
                            {

                              print('hhello');
                            }

                          }, buttonColor: ColorManager.buttonColor, fontSize: AppSize.s20.sp, textColor: ColorManager.sWhite, fontFamily: AppStrings.fontFamily,
                        ),

                        SizedBox(height: AppSize.s10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(text:AppStrings.haveAccount , fontSize: AppSize.s12.sp, fontWeight: FontWeight.normal, color: ColorManager.gGrey),


                            defaultTextBottom(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.loginScreen);
                                },
                                text:AppStrings.signIn )

                          ],
                        )

                      ]),
                ),
              ),
            )));

  }
}
