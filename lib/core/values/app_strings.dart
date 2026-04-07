abstract class AppStrings {
  static const String forgetPassword = "Forget Password";
  static const String password = "Password";
  static const String passwordScreenDescription =
      "Please enter your email associated to your account";
  static const String emailLabel = "Email";
  static const String emailHint = "Enter your email";
  static const String continueButton = "Continue";
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String emailMessage = "This Email is not valid";
  static const String emailVerification = "Email verification";
  static const String emailVerificationError = "Invalid code, please try again";
  static const String emailVerificationDescription =
      "Please enter your code that send to your email address";
  static const String textFieldEmpty = "This field can't be empty";
  static const String verificationSymbol = "*";
  static const String otpSend = "The OTP Message is sent";
  static const String verifyText = "Didn't receive code? ";
  static const String resetPassword = "Reset password";
  static const String resetPasswordDescription =
      "Password must not be empty and must contain 6 characters with upper case letter and one number at least ";
  static final RegExp newPasswordReg = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
  static const String newPasswordMessage = "The Password doesn't match";
  static const String labelNewPassword = "New Password";
  static const String hintNewPassword = "Enter your new password";
  static const String labelConfirmPassword = "Confirm Password";
  static const String resend = "Resend";



  static const String register = "Register";
  //---------------------------------------------------loginpage--------------------------
  static const String enterEmail = 'Enter your email';
  static const String email = 'Email';
  static const String passwordRequired = 'Password is required';
  static const String passwordMinLength = 'Password must be at least 6 characters';
  static const String enterPassword = 'Enter your password';
  static const String rememberMe = 'Remember me';
  static const String signUp = 'Sign up';
  static const String dontHaveAccount = "Don't have an account? ";
  static const String incorrectCredentials = 'Incorrect email or password';
  static const String unauthorized = 'You are not authorized';
  static const String accountNotFound = 'Account not found';
  static const String serverError = 'Server error, please try again later';
  static const String unknownError = 'Unknown error occurred';
  static const String login = "Login";
  static const String welcome = "Welcome";
}
