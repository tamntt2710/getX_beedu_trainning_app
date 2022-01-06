// // import 'package:beedu_app_training/Model/login_request.dart';
// // import 'package:beedu_app_training/Model/user.dart';
// // import 'package:beedu_app_training/const/auth_route.dart';
// // import 'package:get/get_connect/http/src/response/response.dart';
// //
// // abstract class ISignInProvider {
// //   Future<Response<UserResponse>> signIn({required LoginRequest information});
// //   }
// //
// // class SignInProvider implements ISignInProvider {
// //   @override
// //   Future<Response<UserResponse>> signIn(
// //       {required LoginRequest information}) async {
// //     // TODO: implement signIn
// //     shouldAddJWTToken = false;
// //     final response = await post(UserRoutes.login, body: information.toJson());
// //     return convertResponse(
// //         response: response, dataHandler: (json) => UserResponse.fromJson(json));
// //   }
// //   }
// import 'package:beedu_app_training/Model/login_request.dart';
// import 'package:beedu_app_training/Model/user.dart';
// import 'package:beedu_app_training/const/auth_route.dart';
// import 'package:beedu_app_training/const/config_const.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:http/http.dart';
// // const SERVER_IP = 'https://dongythientrithuc.vn/api';
// // class SignInProvider{
// //   Future<String?> attemptLogIn(String username, String password) async {
// //     var res = await post(
// //         Uri.parse('$SERVER_IP/auth/login'),
// //         body: {
// //           "username": username,
// //           "password": password
// //         }
// //     );
// //     if(res.statusCode == 200) return res.body;
// //     return null;
// //   }
// // }
// abstract class ISignInProvider {
//   Future<Response<UserResponse>> signIn({required LoginRequest information});
//
// }
//
// class SignInProvider extends AuthBaseProvider implements ISignInProvider {
//   @override
//   Future<Response<UserResponse>> signIn(
//       {required LoginRequest information}) async {
//     // TODO: implement signIn
//     shouldAddBearerToken = false;
//     final response = await post(UserRoutes.login, info/**/rmation.toJson());
//     return convertResponse(response: response, dataHandler: (json) => UserResponse.fromJson(json));
//   }
//
//   @override
//   Future<Response<LoginTwoFactorAuthValidationResponse>>
//   validateTwoFactorAuthType(
//       {required LoginTwoFactorAuthValidationRequest request}) async {
//     final response =
//     await post(UserRoutes.twoFactorValidation, request.toJson());
//     return convertResponse(
//         response: response,
//         dataHandler: (json) =>
//             LoginTwoFactorAuthValidationResponse.fromJson(json));
//   }
// }