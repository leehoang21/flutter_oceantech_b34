import 'dart:developer';

void logger(Object? message) {
  log('app_logger: {${message.toString()}}');
}

bool isNullEmpty(Object? object) {
  if (object == null || object == 'null') {
    return true;
  }
  if (object == '') {
    return true;
  }
  if (object is Iterable && object.isEmpty) {
    return true;
  }
  if (object is Map && object.isEmpty) {
    return true;
  }
  return false;
}
