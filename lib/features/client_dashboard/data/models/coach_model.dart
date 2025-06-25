import 'dart:convert';
import 'dart:typed_data';

import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';

class CoachModel extends CoachEntity {
  const CoachModel({required super.image, required super.name});
  factory CoachModel.fromJson(Map<String, dynamic> json) {
    Uint8List? decodedImage;
    try {
      final imageString = json['image'];
      final cleanBase64 =
          imageString.contains(',') ? imageString.split(',').last : imageString;
      decodedImage = base64Decode(cleanBase64);
    } catch (_) {
      decodedImage = null;
    }

    return CoachModel(
      name: json['userName'],
      image: decodedImage,
    );
  }
}
