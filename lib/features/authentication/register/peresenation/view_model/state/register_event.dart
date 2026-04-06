import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';

sealed class RegisterEvent {}

class RegisterWithEmailAndPasswordEvent extends RegisterEvent {
  RegisterRequestModel requestModel;
  RegisterWithEmailAndPasswordEvent({required this.requestModel});

}


class RegisterWithGoogleEvent extends RegisterEvent{

  RegisterWithGoogleEvent();
}