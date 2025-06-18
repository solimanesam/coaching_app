import 'package:coaching_app/features/client_dashboard/presentation/view/components/contact_us_list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsTabView extends StatelessWidget {
  const ContactUsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    const String text =
        "If you have any other questions or\nneed further assistance, please contact us at";
    const List<String> contactUsListTilesTitles = <String>[
      "Customer service",
      "Whatsapp"
    ];
    const List<IconData> contactUsListTilesIcons = <IconData>[
      Icons.phone,
      CupertinoIcons.phone
    ];
    
    return Column(
      spacing: 5.0,
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
        ),
        ...List.generate(
            2,
            (index) => contactUsListTileWidget(
                icon: contactUsListTilesIcons[index],
                title: contactUsListTilesTitles[index],
                context: context))
      ],
    );
  }
}
