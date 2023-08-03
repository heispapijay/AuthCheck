class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "Please enter your email and password"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for this email');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('This email is invalid');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'This operation is not allowed');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'This password is too weak');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled, Please contact support for help.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
