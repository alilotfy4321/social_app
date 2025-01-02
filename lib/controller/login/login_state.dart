part of 'login_cubit.dart';

@immutable
abstract class SocialLoginStates {}

class SocialLoginInitial extends SocialLoginStates {}
class ChangePasswordVisibilityState extends SocialLoginStates {}
class SocialLoginChangeLanguageState extends SocialLoginStates {}


class SocialLoginLoadingState extends SocialLoginStates {}
class SocialLoginSuccessState extends SocialLoginStates {}
class SocialLoginErrorState extends SocialLoginStates {}