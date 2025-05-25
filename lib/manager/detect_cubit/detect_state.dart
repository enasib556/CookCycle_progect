import '../../models/detect_model.dart';

class DetectState {}
class InitialDetectState extends DetectState{}
class ErrorDetectState extends DetectState{
  final String errorMessage;
  ErrorDetectState({required this.errorMessage});
}
class LoadingDetectState extends DetectState{}
class SuccessDetectState extends DetectState{
  final DetectModel model;
  SuccessDetectState(this.model);
}