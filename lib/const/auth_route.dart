class UserRoutes {
  static const login = "/user/login";
  static const register = "/user/register";
  static const verifyLogin = "/user/verify-login";
  static const forgotPassword = "/user/forget-password";
  static const resendCode = "/user/%s/resendCode";
  static const verify = "/user/%s/verify/%s";
  static const verifyPhone = '/user/phone/verify';
  static const changeTwoFactorType = "/user/change2faType";
  static const forgetPassword = "/user/forget-pass";
  static const changePassword = "/user/%s/change-pass";
  static const getTwoFactorType = "/user/get2FA";
  static const resetPassword = "/user/%s/reset-pass";
  static const twoFactorValidation = "/user/validate";
  static const getModuleConfig = '/module/config';
  static const validatePin = '/user/check-pin';
  static const getSystemParams = '/public/system-params';
  static const getFirebaseToken = '/firebase/auth';
}