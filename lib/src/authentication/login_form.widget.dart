import 'package:flutter/material.dart';
import 'package:spotify_clone/src/atomic/objects/form_validators.dart';

class LoginForm extends StatefulWidget {
  static const emailKey = Key('loginEmail');
  static const passwordKey = Key('loginPassword');
  static const submitBtnKey = Key('loginSubmitBtn');

  final void Function(LoginFormInput input) onSubmit;

  const LoginForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final LoginFormInput _input = LoginFormInput();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: const Key('loginEmail'),
              validator: FormValidators.required(),
              decoration: const InputDecoration(hintText: 'E-mail'),
              onChanged: (value) => _input.email = value,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              key: const Key('loginPassword'),
              validator: FormValidators.required(),
              decoration: const InputDecoration(hintText: 'Senha'),
              onChanged: (value) => _input.password = value,
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              key: LoginForm.submitBtnKey,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(_input);
                }
              },
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginFormInput {
  String email;
  String password;

  LoginFormInput({
    this.email = '',
    this.password = '',
  });

  @override
  String toString() {
    return '$email, $password';
  }

  @override
  bool operator ==(covariant LoginFormInput other) {
    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => hashList([email, password]);
}
