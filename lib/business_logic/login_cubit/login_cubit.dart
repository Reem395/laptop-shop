import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../presentation/styles/colors.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String varificationId = "";
  String userPhone = "";
  bool loginButtonEnabled = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Phone SignIn
  Future verifyPhoneNumber({required String phoneNumer}) async {
    emit(LoginInitial());
    print('phoneNumer $phoneNumer');
    userPhone = phoneNumer;
    await _auth.verifyPhoneNumber(
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
        loginButtonEnabled = true;
        emit(PhoneInvalid());
      },
      codeSent: (String verificationId, int? resendToken) {
        varificationId = verificationId;
        loginButtonEnabled = true;
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
      await _auth.signInWithCredential(credential);
      emit(PhoneLoginVerificationSucess());
    } catch (e) {
      print("check OTP Error: ${e.toString()[0]}");
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: AppColor.customGrey);
      emit(PhoneLoginVerificationFailed());
    }
  }

// Google SignIn

// Future<UserCredential> signInWithGoogle() async {
  Future signInWithGoogle() async {
    emit(LoginInitial());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;

        // Create a new credential
        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          // return await FirebaseAuth.instance.signInWithCredential(credential);
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          print(
              "userName ${userCredential.user?.displayName} : user mail ${userCredential.user?.email} : signin method ${userCredential.credential?.signInMethod}");
          emit(GoogleLoginSuccess());
        }
      } else {
        emit(GoogleLoginFailed());
      }
    } on FirebaseAuthException catch (e) {
      emit(GoogleLoginFailed());
      Fluttertoast.showToast(msg: "${e.message}");
    }
  }

// Future signInWithGoogle() async {
//   emit(LoginInitial());
//   try {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     if (googleUser != null) {
//       // ... continue with the sign-in process
//     } else {
//       emit(GoogleLoginFailed());
//       Fluttertoast.showToast(msg: "Google Sign-In canceled.");
//     }
//   } on FirebaseAuthException catch (e) {
//     emit(GoogleLoginFailed());
//     Fluttertoast.showToast(msg: "${e.message}");
//   } on PlatformException catch (e) { // Catch PlatformException
//     if (e.code == 'sign_in_canceled') {
//       emit(GoogleLoginFailed());
//       Fluttertoast.showToast(msg: "Google Sign-In canceled.");
//     } else {
//       emit(GoogleLoginFailed());
//       Fluttertoast.showToast(msg: "An error occurred. Please try again.");
//     }
//   } catch (error) {
//     emit(GoogleLoginFailed());
//     Fluttertoast.showToast(msg: "An error occurred. Please try again.");
//   }
// }

  Future signOut() async {
    try {
      /**
       *  force a user to choose an account with FirebaseAuth
       *  and GoogleSignInAuthentication */
      User? user = _auth.currentUser;
      //If User is authenticated with Google
      if (user!.providerData
          .any((userInfo) => userInfo.providerId == 'google.com')) {
        print("google auth");
        GoogleSignIn _googleSignIn = GoogleSignIn();
        _googleSignIn.disconnect();
      }

      await _auth.signOut();
      emit(LogOut());
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: "${e.message}");
    }
  }
}
