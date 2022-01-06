T? cast<T>(x, {T? defaultValue}) => x is T ? x : defaultValue;

int pluralValue(int? value) {
  if (value == null) {
    return 1;
  }

  if (value == 0 || value == 1) {
    return 1;
  }

  return 0;
}

typedef ExceptionThrowableBlock = Function();

catchAnyError<T>(ExceptionThrowableBlock exceptionThrowableBlock, {String tag = "ERROR"}) {
  try {
    exceptionThrowableBlock();
  } catch (e) {
    print("ERROR");
  //  logger.e(e.toString());
  }
}
