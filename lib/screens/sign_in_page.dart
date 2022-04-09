import 'package:chat_app/components/buttons_comp.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _mailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "@gmail.com",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ButtonsComp.filledButton(
              context,
              "Sign In",
              () {
                AuthService().signInWithMail(
                  context,
                  _mailController.text,
                  _passwordController.text,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            const Text("or", style: TextStyle(color: Colors.grey)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002),
            ButtonsComp.textButton(
              context,
              "Sign Up",
              () => Navigator.pushNamed(context, "/sign_up"),
            ),
          ],
        ),
      ),
    );
  }
}
