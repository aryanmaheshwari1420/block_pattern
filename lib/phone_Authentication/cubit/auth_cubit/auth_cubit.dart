import 'package:block_pattern/phone_Authentication/cubit/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  String? _verificationid;

  void sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          _verificationid = verificationId;
          emit(AuthCodeSentState());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationid = verificationId;
        },
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        });
  }

  void VerifyOTP(String otp) async {}

  void signInWithPhone(PhoneAuthCredential Credential) async {}
}
