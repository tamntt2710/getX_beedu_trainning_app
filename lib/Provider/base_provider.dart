//
// // ignore: implementation_imports
// import 'dart:convert';
//
// import 'package:beedu_app_training/network/base_response.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/src/response.dart' as dio_response;
//
// import 'package:get/get_connect/connect.dart' as get_connect;
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';
//
// abstract class BaseProvider extends GetConnect {
//   final String url;
//   final String apiVersion;
//   String apiPrefix;
//
//   var shouldAddJWTToken = true;
//   var shouldShowExpiredPopup = true;
//   var dio = Dio();
//
//   BaseProvider(
//       {required this.url, required this.apiVersion, this.apiPrefix = ''});
//
//   @override
//   void onInit() async {
//     timeout = const Duration(seconds: 15);
//     httpClient.baseUrl = url + apiPrefix + apiVersion;
//     httpClient.errorSafety = true; // if true => app kill -> error , if false
//     // -> exception
//     dio.options.baseUrl = httpClient.baseUrl!;
//     httpClient.addRequestModifier<void>((request) async {
//       String? accessToken = await BEStorage().accessToken;
//
//       if (accessToken.isNullOrBlank && shouldAddJWTToken) {
//         request.headers['Authorization'] = 'Bearer ' + accessToken!;
//       }
//
//       HttpLoggingUtils.requestLog(request);
//
//       return request;
//     });
//
//     // httpClient.addAuthenticator<void>((request) async {
//     //   TokenService service = Get.find();
//     //   await service.refreshToken();
//     //   return request;
//     // });
//
//     String? accessToken = await BEStorage().accessToken;
//     if(accessToken.isNullOrBlank!){
//       dio.options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//
//     httpClient.addResponseModifier((request, response) {
//       HttpLoggingUtils.responseLog(response);
//       _handleIncomingResponse(response);
//       return response;
//     });
//   }
//
//   @override
//   Future<get_connect.Response<T>> post<T>(
//       String? url,
//       dynamic body, {
//         String? contentType,
//         Map<String, String>? headers,
//         Map<String, dynamic>? query,
//         Decoder<T>? decoder,
//         Progress? uploadProgress,
//       }) {
//     _logBodyRequest(body);
//     return super.post(url, body,
//         contentType: contentType,
//         headers: headers,
//         query: query,
//         decoder: decoder,
//         uploadProgress: uploadProgress);
//   }
//
//   Future<dio_response.Response<T>> postUpload<T>(
//       String path, {
//         data,
//       }) {
//     return dio.post(path, data: data);
//   }
//
//   @override
//   Future<get_connect.Response<T>> put<T>(
//       String url,
//       dynamic body, {
//         String? contentType,
//         Map<String, String>? headers,
//         Map<String, dynamic>? query,
//         Decoder<T>? decoder,
//         Progress? uploadProgress,
//       }) {
//     _logBodyRequest(body);
//     return super.put(
//       url,
//       body,
//       headers: headers,
//       contentType: contentType,
//       query: query,
//       decoder: decoder,
//       uploadProgress: uploadProgress,
//     );
//   }
//
//   @override
//   Future<get_connect.Response<T>> patch<T>(
//       String url,
//       dynamic body, {
//         String? contentType,
//         Map<String, String>? headers,
//         Map<String, dynamic>? query,
//         Decoder<T>? decoder,
//         Progress? uploadProgress,
//       }) {
//     _logBodyRequest(body);
//     return super.patch(
//       url,
//       body,
//       headers: headers,
//       contentType: contentType,
//       query: query,
//       decoder: decoder,
//       uploadProgress: uploadProgress,
//     );
//   }
//
//
//   get_connect.Response<T> convertResponseDio<T extends BaseResponse>(
//       {required dio_response.Response response, required T Function(dynamic) dataHandler}) {
//     if (response.statusCode == 0) {
//       try {
//         var baseResponse = BaseResponse.fromJson(response.data);
//         return get_connect.Response(
//             statusCode: response.statusCode,
//             statusText: baseResponse.errorMessage,
//             bodyString:  baseResponse.status,
//             body: null);
//       } catch (e) {
//         logger.d(e.toString());
//         return get_connect.Response(
//             statusCode: response.statusCode,
//             statusText: "Internal Server error",
//             bodyString: null,
//             body: null);
//       }
//     }
//
//     return get_connect.Response(
//         statusCode: response.statusCode,
//         statusText: response.statusMessage,
//         body: dataHandler(response.data));
//   }
//
//   _logBodyRequest(dynamic body) {
//     JsonEncoder encoder = const JsonEncoder.withIndent('  ');
//     String prettyPrint = "";
//
//     if (body is get_connect.FormData) {
//       prettyPrint = "Body length: ${body.length}";
//     } else {
//       prettyPrint = encoder.convert(body);
//     }
//
//     logger.d("""
//     ----------start----------
//     ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ RequestBody ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓\n\n
//     $prettyPrint
//     \n\n↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ RequestBody ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑""");
//   }
//
//   _handleIncomingResponse(get_connect.Response incomingResponse) {
//     if (incomingResponse.statusCode == HttpStatus.unauthorized &&
//         shouldShowExpiredPopup && shouldAddJWTToken) {
//       /// we need to hide loading if it is presenting
//       AlertUtils.hideLoading();
//       AlertUtils.showError(
//           titleError: "Expired session",
//           desc: "Please sign in again!",
//           okButtonTitle: "OK",
//           onOkButtonPressed: () {
//             UserService.to.logoutUser();
//           },
//           onCloseButtonPressed: () {
//             UserService.to.logoutUser();
//           },
//           identifier: "app.dialog.unauthorized");
//     }
//   }
// }
