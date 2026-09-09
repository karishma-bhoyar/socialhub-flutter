import 'package:flutter_application_socialhub/core/constants/app_enums.dart';

class AppState<T> {
  final AppStatus status;
  final T? data;
  final String? errorMessage;

  const AppState({
    this.status = AppStatus.initial,
    this.data,
    this.errorMessage,
  });

  const AppState.initial()
    : status = AppStatus.initial,
      data = null,
      errorMessage = null;

  const AppState.loading()
    : status = AppStatus.loading,
      data = null,
      errorMessage = null;

  const AppState.success(this.data)
    : status = AppStatus.success,
      errorMessage = null;

  const AppState.failure(this.errorMessage)
    : status = AppStatus.failure,
      data = null;
}
