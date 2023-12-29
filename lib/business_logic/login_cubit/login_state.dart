abstract class LoginState {}

class LoginInitial extends LoginState {}

//Phone Auth
class PhoneValid extends LoginState {}

class PhoneInvalid extends LoginState {}

class PhoneLoginVerificationSucess extends LoginState {}

class PhoneLoginVerificationFailed extends LoginState {}
 //Google Auth
class GoogleLoginSuccess extends LoginState {}

class GoogleLoginFailed extends LoginState {}


class LogOut extends LoginState {}
