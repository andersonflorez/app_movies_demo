class CustomException implements Exception {
  final String messageUser;
  final String internalErrorCode;
  final String internalErrorMessage;
  final StackTrace stackTrace;
  final String? data;
  final int? httpErrorCode;

  CustomException({
    required this.messageUser,
    required this.internalErrorCode,
    required this.internalErrorMessage,
    required this.stackTrace,
    this.data,
    this.httpErrorCode
  }){
    //Crashlytics
    print("CRASH ${this.stackTrace}");
    print("CRASH ${this.data}");
  }
}
