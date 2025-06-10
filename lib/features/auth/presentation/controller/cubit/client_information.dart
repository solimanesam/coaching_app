import 'package:get/get.dart';

class ClientInformationController extends GetxController {
  RxnInt selectedCheckBox = RxnInt(); 

  void changeStateOfCheckBox(int index) {
    selectedCheckBox.value = index;
  }

  bool validateGenderSelection() {
    return selectedCheckBox.value != null;
  }
}
