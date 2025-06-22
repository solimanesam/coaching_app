import 'dart:io';

class UploadPersonalizedPlanInputModel {
  UploadPersonalizedPlanInputModel(
      {required this.planFile, required this.subscriberUserName});

  final File planFile;
  final String subscriberUserName;

  Map<String, dynamic> toJson(){
    return {
      "file": planFile
    };
  }
}
