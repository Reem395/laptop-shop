abstract class LoginState {}

class LoginInitial extends LoginState {}

class PhoneValid extends LoginState {}
class PhoneInvalid extends LoginState {}

class LoginVerificationSucess extends LoginState {}
class LoginVerificationFailed extends LoginState {}
class LogOut extends LoginState {}
