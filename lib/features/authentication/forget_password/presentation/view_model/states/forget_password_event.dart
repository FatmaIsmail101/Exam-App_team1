sealed class ForgetPasswordEvent {}

class SendEmailEvent extends ForgetPasswordEvent {}

class VerifyEmailEvent extends ForgetPasswordEvent {}
