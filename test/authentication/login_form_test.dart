import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone/src/authentication/login_form.widget.dart';

void main() {
  group('LoginForm', () {
    testWidgets(
      'should call onSubmit if form is valid',
      (WidgetTester tester) async {
        final submitCompleter = Completer<LoginFormInput>();

        final app = MaterialApp(
          home: Scaffold(
            body: LoginForm(
              onSubmit: submitCompleter.complete,
            ),
          ),
        );

        await tester.pumpWidget(app);

        final expectedInput = LoginFormInput(
          email: 'test@taqtile.com.br',
          password: '123qwer',
        );

        await tester.enterText(
          find.byKey(LoginForm.emailKey),
          expectedInput.email,
        );

        await tester.enterText(
          find.byKey(LoginForm.passwordKey),
          expectedInput.password,
        );

        await tester.tap(find.byKey(LoginForm.submitBtnKey));

        expect(submitCompleter.isCompleted, isTrue);

        expect(await submitCompleter.future, equals(expectedInput));
      },
    );

    testWidgets(
      'should not call onSubmit if form is invalid',
      (WidgetTester tester) async {
        final submitCompleter = Completer<LoginFormInput>();

        final app = MaterialApp(
          home: Scaffold(
            body: LoginForm(
              onSubmit: submitCompleter.complete,
            ),
          ),
        );

        await tester.pumpWidget(app);

        final formInput = LoginFormInput(
          email: 'test@taqtile.com.br',
          password: '',
        );

        await tester.enterText(
          find.byKey(LoginForm.emailKey),
          formInput.email,
        );

        await tester.enterText(
          find.byKey(LoginForm.passwordKey),
          formInput.password,
        );

        await tester.tap(find.byKey(LoginForm.submitBtnKey));

        expect(submitCompleter.isCompleted, isFalse);
      },
    );
  });
}
