
// ignore_for_file: file_names, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_app/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    isPassword: isPassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword? Icons.remove_red_eye : Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // ignore: sized_box_for_whitespace
                  defaultButton(
                    function: (){
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        // print(passwordController.text);
                      }
                    },
                    text: 'Login',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        'Don\'t have an account',
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
