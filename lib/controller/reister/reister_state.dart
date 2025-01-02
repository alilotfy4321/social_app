part of 'reister_cubit.dart';

@immutable
abstract class SocialReisterStates {}

class SocialReisterInitial extends SocialReisterStates {}
class SocialReisterChangeLanguageState extends SocialReisterStates {}

class UploadProfilePicState extends SocialReisterStates {}
class ChangePasswordVisibilityState extends SocialReisterStates {}
//-------------------user register using fire_auth to get uid
class UserRegisterLoadingState extends SocialReisterStates {}
class UserRegisterSuccessState extends SocialReisterStates {}
class UserRegisterErrorState extends SocialReisterStates {
  final String error;
  UserRegisterErrorState({required this.error});
}
//--------create firestore account--
class CreateUserAccountLoadingState extends SocialReisterStates {}
class CreateUserAccountSuccessState extends SocialReisterStates {}

