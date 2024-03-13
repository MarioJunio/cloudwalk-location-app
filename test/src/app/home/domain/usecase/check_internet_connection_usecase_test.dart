import 'dart:io';

import 'package:cloudwalk_location/src/app/home/domain/usecase/check_internet_connection.usecase.dart';
import 'package:cloudwalk_location/src/app/shared/services/check_internet_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_internet_connection_usecase_test.mocks.dart';

@GenerateMocks([CheckInternetService])
void main() {
  group('check internet connection', () {
    test(
      'has internet connection',
      () async {
        final checkInternetServiceMock = MockCheckInternetService();

        when(checkInternetServiceMock.lookup(any)).thenAnswer(
          (realInvocation) => Future.value(
            [InternetAddress('192.0.0.1')],
          ),
        );

        final CheckInternetConnectionUsecase checkInternetConnectionUsecase =
            CheckInternetConnectionUsecaseImpl(checkInternetServiceMock);

        final result = await checkInternetConnectionUsecase();

        expect(result, true);
      },
    );

    test(
      'has no internet connection',
      () async {
        final checkInternetServiceMock = MockCheckInternetService();

        when(checkInternetServiceMock.lookup(any)).thenAnswer(
          (realInvocation) => Future.value([]),
        );

        final CheckInternetConnectionUsecase checkInternetConnectionUsecase =
            CheckInternetConnectionUsecaseImpl(checkInternetServiceMock);

        final result = await checkInternetConnectionUsecase();

        expect(result, false);
      },
    );

    test(
      'has internet connection throws exception',
      () async {
        final checkInternetServiceMock = MockCheckInternetService();

        when(checkInternetServiceMock.lookup(any)).thenThrow(
          const SocketException('Timeout'),
        );

        final CheckInternetConnectionUsecase checkInternetConnectionUsecase =
            CheckInternetConnectionUsecaseImpl(checkInternetServiceMock);

        final result = await checkInternetConnectionUsecase();

        expect(result, false);
      },
    );
  });
}
