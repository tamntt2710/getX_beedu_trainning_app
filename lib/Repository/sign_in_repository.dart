// import 'package:beedu_app_training/Model/login_request.dart';
// import 'package:beedu_app_training/Model/user.dart';
// import 'package:beedu_app_training/Provider/sign_in_provider.dart';
// import 'package:beedu_app_training/network/repository_mixin.dart';
//
// abstract class ISignInRepository {
//   Stream<UserResponse> signIn({required LoginRequest information});
// }
//
// class SignInRepository with RepositoryMixin implements ISignInRepository {
//   final ISignInProvider _provider;
//
//   SignInRepository(this._provider);
//
//   @override
//   Stream<UserResponse> signIn({required LoginRequest information}) async* {
//     // TODO: implement signIn
//     final response = await _provider.signIn(information: information);
//     yield extractDataOrError(fromResponse: response);
//   }
//
//
//
// }