import 'package:block_pattern/form_validation/bloc/sign_in_bloc.dart';
import 'package:block_pattern/form_validation/bloc/sign_in_event.dart';
import 'package:block_pattern/form_validation/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: BlocBuilder<SignInBloc, SigInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(SignInTextFieldEvent(
                      _emailController.text, _passController.text));
                },
                decoration: InputDecoration(
                  hintText: "Enter the email",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _passController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(SignInTextFieldEvent(
                      _emailController.text, _passController.text));
                },
                decoration: InputDecoration(
                  hintText: "Enter the password",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<SignInBloc, SigInState>(
            builder: (context, state) {
              if (state is SignInLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              return CupertinoButton(
                onPressed: () {
                  if (state is SignInValidState) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(
                            _emailController.text, _passController.text));
                  }
                },
                color: (state is SignInValidState) ? Colors.blue : Colors.grey,
                child: Text("Sign In"),
              );
            },
          )
        ],
      ),
    );
  }
}
