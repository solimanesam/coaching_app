import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String url) async {
  try {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('Error launching URL: $e');
  }
}
