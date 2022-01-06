import 'package:get/get_connect/http/src/response/response.dart';

class AppError {
  String? message;
  String? status;
  AppError(this.message, {this.status});
}

mixin RepositoryMixin {
  T extractDataOrError<T>({required Response<T> fromResponse}) {
    if (fromResponse.status.hasError) {
      throw AppError(fromResponse.statusText, status: fromResponse.bodyString);
    } else if (fromResponse.body != null) {
      return fromResponse.body!;
    }

    throw AppError("Body is null", status: "Status null");
  }
}