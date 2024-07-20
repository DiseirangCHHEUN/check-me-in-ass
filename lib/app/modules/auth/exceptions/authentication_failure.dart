class AuthenticationFailure {
  final String title;
  final String msg;

  const AuthenticationFailure(
      [this.title = 'Unknow error',
      this.msg = 'An unknown error was occured.']);

  factory AuthenticationFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const AuthenticationFailure('Weak password',
            'Your password is weakness. Please enter a strong password.');
      case 'invalid-email':
        return const AuthenticationFailure(
            'Invalid email', 'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const AuthenticationFailure('Email already in use',
            'The email address is already in use by another account.');
      case 'operation-not-allowed':
        return const AuthenticationFailure('Opperation not allowed',
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const AuthenticationFailure('Disabled user',
            'This user has been disabled. Please contact support.');
      case 'invalid-credential':
        return const AuthenticationFailure(
            'Invalid credential', 'The email or password is not valid.');
      default:
        return const AuthenticationFailure();
    }
  }
}
