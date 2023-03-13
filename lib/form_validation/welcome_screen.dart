import 'package:block_pattern/form_validation/bloc/sign_in_bloc.dart';
import 'package:block_pattern/form_validation/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelocomeScreen extends StatelessWidget {
  const WelocomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => SignInBloc(),
                        child: SignUpPage(),
                      );
                    },
                  ));
                },
                child: Text(
                  "Sign in with email",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ))),
      ),
    );
  }
}
