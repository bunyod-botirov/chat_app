import 'package:chat_app/components/buttons_comp.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: _mailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ButtonsComp.filledButton(
              context,
              "Sign Up",
              () {
                AuthService().signUpWithMail(
                  context,
                  _nameController.text,
                  _mailController.text,
                  _passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
