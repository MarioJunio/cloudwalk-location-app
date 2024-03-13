import 'package:cloudwalk_location/src/app/home/domain/model/error_message_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/usecase/get_current_position_usecase.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final GetCurrentPositionUsecase _getCurrentPositionUsecase;

  HomeController(this._getCurrentPositionUsecase);

  bool _loading = false;

  bool get loading => _loading;

  Future<Either<ErrorMessageModel, PositionModel>> getCurrentPosition() async {
    try {
      _loading = true;
      notifyListeners();

      return await _getCurrentPositionUsecase();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
