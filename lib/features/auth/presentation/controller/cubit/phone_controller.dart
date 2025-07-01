import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneController extends GetxController {
  final String _baseUrl = ApiConstants.baseUrl; 

  var isLoading = false.obs;
  var updateSuccess = false.obs;

  Future<void> updatePhoneNumber(String phoneNumber) async {
    isLoading.value = true;

    final url = Uri.parse("$_baseUrl/Auth/update-phone");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await locator<BaseCache>().getStringFromCache(key: CacheConstant.tokenKey)}',
    };
    final body = jsonEncode({
      "phoneNumber": phoneNumber,
    });

    try {
      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        updateSuccess.value = true;
        Get.snackbar("نجاح", "تم تحديث رقم الهاتف بنجاح");
      } else {
        updateSuccess.value = false;
        Get.snackbar("خطأ", "فشل في تحديث رقم الهاتف: ${response.statusCode}");
      }
    } catch (e) {
      updateSuccess.value = false;
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالسيرفر");
    } finally {
      isLoading.value = false;
    }
  }
}
