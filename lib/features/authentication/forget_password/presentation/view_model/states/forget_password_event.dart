import '../../../data/models/request_model/forget_password_request.dart';
import '../../../data/models/request_model/reset_password_request.dart';
import '../../../data/models/request_model/verify_email_request.dart';

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
