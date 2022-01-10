import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone/src/authentication/login.provider.dart';
import 'package:spotify_clone/src/authentication/login_form.widget.dart';

void main() {
  group('Login Provider', () {
    test('should login successfully', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final loginResult = await container.read(
        loginProvider(
          LoginFormInput(email: 'admin@taqtile.com.br', password: '123'),
        ).future,
      );

      expect(loginResult, isTrue);
    });

    test('should throw error due invalid input', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final invalidPasswordInput = LoginFormInput(
        email: 'admin@taqtile.com.br',
        password: '',
      );
      final invalidEmailInput = LoginFormInput(
        email: '',
        password: '123',
      );

      final invalidEmailLogin = container.read(
        loginProvider(invalidEmailInput).future,
      );
      final invalidPasswordLogin = container.read(
        loginProvider(invalidPasswordInput).future,
      );

      expectLater(invalidEmailLogin, throwsArgumentError);
      expectLater(invalidPasswordLogin, throwsArgumentError);
    });
  });
}
