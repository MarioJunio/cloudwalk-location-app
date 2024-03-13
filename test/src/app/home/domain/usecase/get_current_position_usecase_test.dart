import 'package:cloudwalk_location/src/app/home/data/datasource/ip_api_datasource.dart';
import 'package:cloudwalk_location/src/app/home/data/respository/ip_api_repository_impl.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/error_message_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/usecase/get_current_position_usecase.dart';
import 'package:cloudwalk_location/src/app/shared/network/http_client.dart';
import 'package:cloudwalk_location/src/app/shared/services/geolocator_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_current_position_usecase_test.mocks.dart';

@GenerateMocks([GeolocatorService, Dio, Interceptor])
void main() {
  const kDeniedAccessMessageMock = 'Acesso negado';
  const kUnexpectedError = 'Erro inesperado';

  final mockPosition = PositionModel(lat: 17.0, lon: 20.0);

  final mockErrorMessage = ErrorMessageModel(message: kUnexpectedError);

  group('get position from gps', () {
    test(
      'get position model success',
      () async {
        final geolocatorServiceMock = MockGeolocatorService();

        when(geolocatorServiceMock.isLocationServiceEnabled())
            .thenAnswer((_) => Future.value(true));

        when(geolocatorServiceMock.getCurrentPosition())
            .thenAnswer((_) => Future.value(mockPosition));

        final GetCurrentPositionUsecase getCurrentPositionUsecase =
            GetCurrentPositionUsecaseImpl(
          IpApiRepositoryImpl(IpApiDatasourceImpl(HttpClient(MockDio()))),
          geolocatorServiceMock,
        );

        final result = (await getCurrentPositionUsecase()).fold(
          ifRight: (value) => value,
          ifLeft: (ErrorMessageModel value) => value,
        );

        expect(result, mockPosition);
      },
    );

    test(
      'get error message',
      () async {
        final geolocatorServiceMock = MockGeolocatorService();

        when(geolocatorServiceMock.isLocationServiceEnabled())
            .thenAnswer((_) => Future.value(true));

        when(geolocatorServiceMock.getCurrentPosition())
            .thenAnswer((_) => Future.error(kDeniedAccessMessageMock));

        when(geolocatorServiceMock.openLocationSettingsUi()).thenAnswer(
          (_) => Future.value(true),
        );

        final GetCurrentPositionUsecase getCurrentPositionUsecase =
            GetCurrentPositionUsecaseImpl(
          IpApiRepositoryImpl(IpApiDatasourceImpl(HttpClient(MockDio()))),
          geolocatorServiceMock,
        );

        final result = (await getCurrentPositionUsecase()).fold(
          ifRight: (value) => value,
          ifLeft: (ErrorMessageModel value) => value,
        );

        expect(result, ErrorMessageModel(message: kDeniedAccessMessageMock));
      },
    );
  });

  group('get position from network', () {
    test('with success', () async {
      final geolocatorServiceMock = MockGeolocatorService();
      final dioMock = MockDio();

      when(geolocatorServiceMock.isLocationServiceEnabled()).thenAnswer(
        (realInvocation) => Future.value(false),
      );

      when(dioMock.interceptors).thenReturn(Interceptors());

      when(dioMock.get(any)).thenAnswer(
        (_) => Future.value(Response(
          requestOptions: RequestOptions(),
          data: {
            'status': 'success',
            'lat': mockPosition.lat,
            'lon': mockPosition.lon,
          },
        )),
      );

      final GetCurrentPositionUsecase getCurrentPositionUsecase =
          GetCurrentPositionUsecaseImpl(
        IpApiRepositoryImpl(IpApiDatasourceImpl(HttpClient(
          dioMock,
          interceptors: [MockInterceptor()],
        ))),
        geolocatorServiceMock,
      );

      final result = (await getCurrentPositionUsecase()).fold(
        ifRight: (value) => value,
        ifLeft: (ErrorMessageModel value) => value,
      );

      expect(result, mockPosition);
    });

    test('with fail', () async {
      final geolocatorServiceMock = MockGeolocatorService();
      final dioMock = MockDio();

      when(geolocatorServiceMock.isLocationServiceEnabled()).thenAnswer(
        (realInvocation) => Future.value(false),
      );

      when(dioMock.interceptors).thenReturn(Interceptors());

      when(dioMock.get(any)).thenAnswer(
        (_) => Future.value(Response(
          requestOptions: RequestOptions(),
          data: {
            'status': 'fail',
            'message': kUnexpectedError,
          },
        )),
      );

      final GetCurrentPositionUsecase getCurrentPositionUsecase =
          GetCurrentPositionUsecaseImpl(
        IpApiRepositoryImpl(IpApiDatasourceImpl(HttpClient(
          dioMock,
          interceptors: [MockInterceptor()],
        ))),
        geolocatorServiceMock,
      );

      final result = (await getCurrentPositionUsecase()).fold(
        ifRight: (value) => value,
        ifLeft: (ErrorMessageModel value) => value,
      );

      expect(result, mockErrorMessage);
    });

    test('with error', () async {
      final geolocatorServiceMock = MockGeolocatorService();
      final dioMock = MockDio();

      when(geolocatorServiceMock.isLocationServiceEnabled()).thenAnswer(
        (realInvocation) => Future.value(false),
      );

      when(dioMock.interceptors).thenReturn(Interceptors());

      when(dioMock.get(any)).thenThrow(Exception());

      final GetCurrentPositionUsecase getCurrentPositionUsecase =
          GetCurrentPositionUsecaseImpl(
        IpApiRepositoryImpl(IpApiDatasourceImpl(HttpClient(
          dioMock,
          interceptors: [MockInterceptor()],
        ))),
        geolocatorServiceMock,
      );

      final result = (await getCurrentPositionUsecase()).fold(
        ifRight: (value) => value,
        ifLeft: (ErrorMessageModel value) => value,
      );

      expect(result, ErrorMessageModel(message: 'Houve um erro ao tentar buscar a localização'));
    });
  });
}
