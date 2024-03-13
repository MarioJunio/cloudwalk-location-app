import 'dart:io';

import 'package:cloudwalk_location/src/app/shared/services/check_internet_service.dart';

abstract class CheckInternetConnectionUsecase {
  Future<bool> call();
}

class CheckInternetConnectionUsecaseImpl
    implements CheckInternetConnectionUsecase {
  final CheckInternetService _checkInternetService;

  CheckInternetConnectionUsecaseImpl(this._checkInternetService);

  @override
  Future<bool> call() async {
    try {
      final result = await _checkInternetService.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }

    return false;
  }
}
