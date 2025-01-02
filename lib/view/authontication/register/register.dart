// ignore_for_file: unused_local_variable, unnecessary_string_interpolations, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_app/controller/reister/reister_cubit.dart';
import 'package:social_app/generated/l10n.dart';
import 'package:social_app/shared_in_app/custom_widgets/Navigation.dart';
import 'package:social_app/shared_in_app/custom_widgets/customButton.dart';
import 'package:social_app/shared_in_app/custom_widgets/toastWidget.dart';
import 'package:social_app/view/authontication/login/login.dart';
import 'package:social_app/view/authontication/register/profile_pic.dart';

import '../../../shared_in_app/custom_widgets/customTextFormField.dart';
import '../../../shared_in_app/custom_widgets/vhSpace.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<SocialReisterCubit, SocialReisterStates>(
      listener: (context, state) async {
        if (state is CreateUserAccountSuccessState) {
            showToast(text: 'verify your email', toaststate: ToastState.LOADING);
            navigateAndFinish(context, LoginScreen());
        }
        if(state is UserRegisterErrorState){
                      showToast(text: state.error, toaststate: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        var cubit = SocialReisterCubit.get(context);
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
                      S.of(context).register,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                              ),
                      textAlign: TextAlign.start,
                    ),
                    VSpace(),
                    PicprofilePicWidget(),
                    VSpace(),
                    CustomTextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      label: S.of(context).name,
                      hint: S.of(context).enterName,
                      prefixicon: Icons.person,
                    ),
                    VSpace(),
                    CustomTextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      label: S.of(context).phone,
                      hint: S.of(context).enterPhone,
                      prefixicon: Icons.person,
                    ),
                    VSpace(),
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: S.of(context).email,
                      hint: S.of(context).enterEmail,
                      prefixicon: Icons.person,
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
                      condition: state is! CreateUserAccountLoadingState,
                      builder: (context) => Center(
                        child: CustomButton(
                          width: 300,
                          height: 50,
                          child: Text(
                            S.of(context).register,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          color: Colors.blueAccent,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.userRegister(
                                  context,
                                  nameController.text,
                                  phoneController.text,
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                        ),
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    VSpace(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${S.of(context).haveAnAccount} ?'),
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(context, LoginScreen());
                          },
                          child: Text(S.of(context).login),
                        ),
                      ],
                    ),
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
