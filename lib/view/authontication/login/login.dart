// ignore_for_file: unused_local_variable, unused_import, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/controller/login/login_cubit.dart';
import 'package:social_app/generated/l10n.dart';
import 'package:social_app/shared_in_app/custom_widgets/toastWidget.dart';
import 'package:social_app/shared_in_app/custom_widgets/vhSpace.dart';
import 'package:social_app/view/authontication/register/register.dart';
import 'package:social_app/view/social_layout/home/home.dart';
import 'package:social_app/view/social_layout/social_layout.dart';

import '../../../shared_in_app/custom_widgets/Navigation.dart';
import '../../../shared_in_app/custom_widgets/customButton.dart';
import '../../../shared_in_app/custom_widgets/customTextFormField.dart';
import '../../../shared_in_app/sharedpref.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) async {
        if (state is SocialLoginSuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            showToast(text: 'login succes', toaststate: ToastState.SUCSSES);
            await CachHelper.saveUserCacheKey(
                'uId', state.uid); // save user id in cache
            //goto home
            navigateAndFinish(context, SocialLayout());
          } else {
            showToast(
                text: 'Verify your email please!!',
                toaststate: ToastState.ERROR);
          }
        }
      },
      builder: (context, state) {
        //---------------------------------------------
        var cubit = SocialLoginCubit.get(context);
        //---------------------------------------
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  cubit.changeLanguage();
                },
                icon: Icon(
                  Icons.language,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).login,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                              ),
                      textAlign: TextAlign.start,
                    ),

                    VSpace(),
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: S.of(context).email,
                      hint: S.of(context).enterEmail,
                      prefixicon: Icons.email,
                    ),
                    VSpace(),
                    CustomTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      label: S.of(context).password,
                      hint: S.of(context).enterPassword,
                      ispasswordLock: cubit.isPasswordLock,
                      prefixicon: Icons.lock,
                      suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          icon: (cubit.isPasswordLock)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                    ),
                    VSpace(),
                    //ConditionalBuilder(),
                    ConditionalBuilder(
                      condition: state is! SocialLoginLoadingState,
                      builder: (context) => Center(
                        child: CustomButton(
                          width: 300,
                          child: Text(S.of(context).login),
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              //--------
                              cubit.userLogin(emailController.text,
                                  passwordController.text);
                            }
                          },
                        ),
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),

                    VSpace(),
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                      },
                      child: Text(S.of(context).sendEmailVerification),
                    ),
                    VSpace(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).dontHaveAnAccount),
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(context, RegisterScreen());
                          },
                          child: Text(S.of(context).register),
                        ),
                      ],
                    ),
                    VSpace(),
                    Divider(
                      height: 1,
                      thickness: 3,
                      color: Colors.grey[300],
                    ),
                    VSpace(),
                    Text(
                      S.of(context).signUpwith,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        HSpace(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Color.fromARGB(158, 50, 77, 16),
                            size: 30,
                          ),
                        ),
                        HSpace(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
