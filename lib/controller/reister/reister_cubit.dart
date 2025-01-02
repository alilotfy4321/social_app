// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:social_app/model/create_user_account.dart';
import 'package:social_app/shared_in_app/constants.dart';


part 'reister_state.dart';

class SocialReisterCubit extends Cubit<SocialReisterStates> {
  SocialReisterCubit() : super(SocialReisterInitial());
  static SocialReisterCubit get(context) => BlocProvider.of(context);
//  ApiConsumer api;
  changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    print(language);
    emit(SocialReisterChangeLanguageState());
  }

  XFile? profilePic;
  uploadProfilePic(XFile? image) {
    profilePic = image;
    emit(UploadProfilePicState());
  }

  bool isPasswordLock = false;
  void changePasswordVisibility() {
    isPasswordLock = !isPasswordLock;
    emit(ChangePasswordVisibilityState());
  }

//-----------------using fire store
  userRegister(context, name, phone, email, password) async {
    emit(UserRegisterLoadingState());
    await FirebaseAuth.instance.setLanguageCode('en');
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
       FirebaseAuth.instance.currentUser?.sendEmailVerification();
      createUserAccount(name, phone, email, value.user!.uid);
    }).catchError((e) {
      emit(UserRegisterErrorState(error: e.toString()));
    });
  }

// Create a CollectionReference called users that references the firestore collection
//if exist go in else create
  createUserAccount(name, phone, email, uId) async {
    emit(CreateUserAccountLoadingState());
    //create instatnce of CreateUserModel
    CreateUserModel createUserModel = CreateUserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(createUserModel.toMap());
    emit(CreateUserAccountSuccessState());
  }
}
