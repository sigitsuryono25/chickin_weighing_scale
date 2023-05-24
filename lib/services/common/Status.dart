import 'dart:io';

class Status<T> {
  T? data;
  String? message;
  int? messageId = 0;
  int? errorCode;
  String? errorData;
  HttpException? httpException;
  dynamic? chickinError;

  Status({this.data,
    this.message,
    this.messageId,
    this.errorCode,
    this.errorData,
    this.httpException,
    this.chickinError}) {
    print(this.data);
  }
}

class Success<T> extends Status<T> {
  Success(T? data) : super(data: data);
}

class Loading<T> extends Status<T> {
  Loading(T? data) : super(data: data);
}

class Error<T> extends Status<T> {
  Error({String? message,
    int? errorCode,
    dynamic errorData,
    int messageId = 0,
    T? data}) :super(data: data,
      errorCode: errorCode,
      errorData: errorData,
      message: message,
      messageId: messageId
  );
}
