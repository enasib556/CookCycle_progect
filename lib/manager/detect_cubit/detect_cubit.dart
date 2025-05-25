import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../models/detect_model.dart';
import '../../network/apiService.dart';
import 'detect_state.dart';

class DetectCubit extends Cubit<DetectState> {
  DetectCubit() : super(InitialDetectState());

  final ApiService2 apiService = ApiService2();

  Future<void> detectObjects(File imageFile) async {
    emit(LoadingDetectState());

    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      final response = await apiService.dio.post(
        '${ApiService2.baseUrl}vision-chat/',
        data: formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );
      DetectModel model = DetectModel.fromJson(response.data);
      emit(SuccessDetectState(model));
    } catch (e) {
      emit(ErrorDetectState(errorMessage: e.toString()));
    }
  }
}