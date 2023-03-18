import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../presentation/styles/colors.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String varificationId = "";
  String userPhone = "";
  bool loginButtonEnabled=true;

  Future verifyPhoneNumber({required String phoneNumer}) async {
    emit(LoginInitial());
    print('phoneNumer $phoneNumer');
    userPhone=phoneNumer;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumer,
      verificationCompleted: (PhoneAuthCredential credential) {
        emit(PhoneValid());
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
          Fluttertoast.showToast(
              msg: e.code,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: AppColor.customGrey);
        }
        loginButtonEnabled=true;
        emit(PhoneInvalid());
      },
      codeSent: (String verificationId, int? resendToken) {
        varificationId = verificationId;
        loginButtonEnabled=true;
        emit(PhoneValid());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future checkOTP({required String verifyId, required String code}) async {
    print("OTP is : $code");
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);
          // cred=credential;
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginVerificationSucess());
    } catch (e) {
      print("check OTP Error: ${e.toString()[0]}");
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: AppColor.customGrey);
      emit(LoginVerificationFailed());
    }
  }
  Future signOut()async{
    try {
      await FirebaseAuth.instance.signOut();
      print("signOut");
      emit(LogOut());
    } catch (e) {
      print("error signOut: ${e.toString()}");
    }
  }
}
