class AppEndPoints {
  AppEndPoints._();

  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String signUpEndpoint = '$baseUrl/auth/signup';
  static const String signInEndpoint = '$baseUrl/auth/signin';
  static const String changePasswordEndpoint = '$baseUrl/auth/changePassword';
  static const String deleteMyAccountEndpoint = '$baseUrl/auth/deleteMe';
  static const String editProfileEndpoint = '$baseUrl/auth/editProfile';
  static const String logOutEndpoint = '$baseUrl/auth/logout';
  static const String getLoggedUserInfoEndpoint = '$baseUrl/auth/profileData';
  static const String forgetPasswordEndpoint = '$baseUrl/auth/forgotPassword';
  static const String verifyResetPasswordEndpoint =
      '$baseUrl/auth/verifyResetCode';
  static const String resetPasswordEndpoint = '$baseUrl/auth/resetPassword';
  static const String addExamEndpoint = '$baseUrl/exams';
  static const String getAllExamsEndpoint = '$baseUrl/exams';

  static const String getAllExamsOnSubject = "$baseUrl/exams";

  static String getExamById(String examId) {
    return "$baseUrl/exams/$examId";
  }

  static const String addQuestionEndPoint = "$baseUrl/questions";
  static const String getAllQuestionsEndpoint = "$baseUrl/questions";
  static const String getAllQuestionsOnExam = "$baseUrl/questions/exam";
  static const String getUserHistoryEndpoint = "$baseUrl/questions/history";

  static String getQuestionById(String questionId) {
    return "$baseUrl/questions/$questionId";
  }

  static const String checkQuestionEndPoint = "$baseUrl/questions/check";
  static const String addSubjectEndpoint = "$baseUrl/subjects";

  static String updateSubjectEndpoint(String subjectId) {
    return "$baseUrl/subjects/$subjectId";
  }

  static String deleteSubjectEndpoint(String subjectId) {
    return "$baseUrl/subjects/$subjectId";
  }

  static const String getAllSubjectsEndpoint = "$baseUrl/subjects";

  static String getSubjectById(String subjectId) {
    return "$baseUrl/subjects/$subjectId";
  }
}
