import 'dart:io';

abstract class CheckInternetService {
  Future<List<InternetAddress>> lookup(String host);
}

class CheckInternetServiceImpl implements CheckInternetService {

  @override
  Future<List<InternetAddress>> lookup(String host) async {
    return await InternetAddress.lookup(host);
  }
}
