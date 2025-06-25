import 'package:file_picker/file_picker.dart';

abstract class BaseFilePicker {
  Future<String?> pickFile();
}

class FilePickerImpl implements BaseFilePicker {
  @override
  Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path!;
    }
    return null;
  }
}
