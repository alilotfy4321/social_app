import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/shared_in_app/constants.dart';

part 'login_state.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitial());
  static SocialLoginCubit get(context) => BlocProvider.of(context);

  changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    //print(language);
    emit(SocialLoginChangeLanguageState());
  }

  bool isPasswordLock = false;
  void changePasswordVisibility() {
    isPasswordLock = !isPasswordLock;
    emit(ChangePasswordVisibilityState());
  }

  userLogin(email, password) async {
    emit(SocialLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password).then((vaue){
          emit(SocialLoginSuccessState());
        });
  }
}
