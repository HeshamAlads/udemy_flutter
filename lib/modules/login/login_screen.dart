import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

// reusable components
// 1. timing
// 2. refactor
// 3. quality

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Components.defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Email can\'t be empty';
                      }
                    },
                    onSubmit: () {
                      debugPrint(emailController.text);
                      debugPrint(passwordController.text);
                    },
                    onChanged: () {
                      debugPrint(emailController.text);
                      debugPrint(passwordController.text);
                    },
                    label: 'EmailAddress',
                    hint: 'EmailAddress',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Components.defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Password can\'t be empty';
                      }
                    },
                    onSubmit: () {
                      debugPrint(emailController.text);
                      debugPrint(passwordController.text);
                    },
                    onChanged: () {
                      debugPrint(emailController.text);
                      debugPrint(passwordController.text);
                    },
                    isPassword: isPassword,
                    label: 'Password',
                    hint: 'Password',
                    prefix: Icons.lock,
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    onTapEye: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Components.defaultButton(
                    text: 'login',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint(emailController.text);
                        debugPrint(passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register Now'),
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
