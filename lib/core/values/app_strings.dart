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
  static const String login = "Login";
  static const String register = "Register";
  static const String question = "Question";
  static const String to = "To";
  static const String questionContent =
      "Select the correctly punctuated sentence.";
  static const String backButtonText = "Back";
  static const String nextButtonText = "Next";
  static const String timeOutException = "Something went wrong";
  static const String timeOutMessage = "Time out !!";
  static const String noData = "No Data";
  static const String exam = "Exam";
  static const String finish = "Finish";
  static const String viewScore = "Exam Score";
  static const String showResult = "Show Result";
  static const String startAgain = "Start Again";
  static const String yourScore = "Your Score";
  static const String wrong = "Wrong";
  static const String correct = "Correct";
  static const String answer = "Answers";
}
