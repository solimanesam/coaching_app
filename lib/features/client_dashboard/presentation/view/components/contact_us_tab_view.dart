import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coaching_app/features/client_dashboard/presentation/view/components/contact_us_list_tile_widget.dart';

class ContactUsTabView extends StatelessWidget {
  const ContactUsTabView({super.key});

  static const String phoneNumber = '+201022056432';

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/${phoneNumber.replaceAll('+', '')}');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String text =
        "If you have any other questions or\nneed further assistance, please contact us at";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(text),
        ),
        contactUsListTileWidget(
          icon: Icons.phone,
          title: "Customer service",
          context: context,
          onTap: _launchPhone,
        ),
        contactUsListTileWidget(
          icon: CupertinoIcons.phone,
          title: "Whatsapp",
          context: context,
          onTap: _launchWhatsApp,
        ),
      ],
    );
  }
}
