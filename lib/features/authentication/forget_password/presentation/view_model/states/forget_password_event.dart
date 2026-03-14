import '../../../data/models/forget_password/forget_password_request.dart';
import '../../../data/models/reset_password/reset_password_request.dart';
import '../../../data/models/verify_email/verify_email_request.dart';

sealed class ForgetPasswordEvent {}

class SendEmailEvent extends ForgetPasswordEvent {
  ForgetPasswordRequest request;

  SendEmailEvent(this.request);
}

class VerifyEmailEvent extends ForgetPasswordEvent {
  VerifyEmailRequest request;

  VerifyEmailEvent(this.request);
}

class ResetPasswordEvent extends ForgetPasswordEvent {
  ResetPasswordRequest request;

  ResetPasswordEvent(this.request);
}
