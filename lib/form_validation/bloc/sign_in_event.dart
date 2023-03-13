abstract class SignInEvent {}

class SignInTextFieldEvent extends SignInEvent {
  String emailvalue = "";
  String passvalue = "";
  SignInTextFieldEvent(this.emailvalue, this.passvalue);
}

class SignInSubmittedEvent extends SignInEvent {
  String email = "";
  String pass = "";
  SignInSubmittedEvent(this.email, this.pass);
}
