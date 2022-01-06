import 'package:beedu_app_training/network/base_response.dart';

class UserResponse extends BaseResponse {
  User? data;

  UserResponse({this.data});

  UserResponse.fromJson(dynamic json) {
    super.fromJson(json);
    if (json['data'] == null) {
      data = null;
    } else {
      data = User.fromJson(json['data']);
    }
  }
}

class User {
  User({
    this.accessToken,
    this.refreshToken,
   });

  User.fromJson(dynamic json) {
    if (json == null) {
      return;
    }

    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }

}