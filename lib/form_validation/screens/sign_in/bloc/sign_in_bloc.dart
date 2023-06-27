import 'dart:html';

import 'package:block_pattern/form_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:block_pattern/form_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SigInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextFieldEvent>((event, emit) {
      if (EmailValidator.validate(event.emailvalue) == false) {
        emit(SignInErrorState("please enter the valid email"));
      } else if (event.passvalue.length < 8) {
        emit(SignInErrorState("please enter the valid password"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
