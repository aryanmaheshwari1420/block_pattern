import 'package:block_pattern/form_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:block_pattern/form_validation/screens/sign_in/sign.dart';
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
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
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
                    child: const Text(
                      "Sign in With Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ))),
                    const SizedBox(height: 10,),
            Container(
                width: MediaQuery.of(context).size.width,
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
                    child: const Text(
                      "Sign In With Google",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
