import 'package:dio/dio.dart';

class UploadPersonalizedPlanInputModel {
  const UploadPersonalizedPlanInputModel(
      {required this.filePath, required this.subscriberUserName});

  final String filePath;
  final String subscriberUserName;

  Future<FormData> toJson() async {
    return FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });
  }
}
