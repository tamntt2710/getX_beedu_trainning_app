import 'package:get/get_connect/http/src/status/http_status.dart';

import '../utils.dart';

class BaseResponse {
  BaseResponse({this.status, this.statusCode, this.message});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    catchAnyError(() {
      status = json['status'];
      statusCode = json['statusCode'];
      message = json['message'];
      errorCode = json['errorCode'];
      error = json["error"];
    }, tag: "BaseResponse.fromJson");
  }

  fromJson(Map<String, dynamic> json) {
    catchAnyError(() {
      status = json['status'];
      statusCode = json['statusCode'];
      message = json['message'];
    }, tag: "BaseResponse fromJson");
  }

  dynamic status;
  int? statusCode;
  int? errorCode;
  String? message;
  String? error;

  bool get isSuccess => status == 'SUCCESS';

  bool get shouldForceLogOut => errorCode == HttpStatus.unauthorized;

  /// take care of error messages
  String? get errorMessage {
    if (error == "invalid_token") {
      return "common_invalid_token";
    }

    if (status == 500) {
      return error;
    }

    if (message != null) {
      return message;
    }

    return "common_unknown_error";
  }
}

class BaseListResponse<E> extends BaseResponse {
  List<E>? _data;
  E Function(dynamic)? elementHandler;

  List<E> get data {
    return _data == null ? [] : _data!;
  }

  BaseListResponse();

  @override
  fromJson(dynamic json) {
    super.fromJson(json);
    if (json['data'] == null) {
      _data = null;
      return;
    }

    final list = json['data'] as List<dynamic>;
    _data = list.map((e) => elementHandler?.call(e)) as List<E>;
  }
}

class EmptyResponse extends BaseResponse {}

class ListResponse<T> extends BaseResponse {
  List<T> items = [];
  int? total = 0;
  late T Function(dynamic) elementHandler;

  @override
  fromJson(dynamic json) {
    super.fromJson(json);

    catchAnyError(() {
      if (json?['data'] == null) {
        return;
      }

      final listData = json["data"]["content"] as List<dynamic>;
      items = listData.map((e) => elementHandler.call(e)).toList();
      total = json["totalElements"];
    });
  }
}