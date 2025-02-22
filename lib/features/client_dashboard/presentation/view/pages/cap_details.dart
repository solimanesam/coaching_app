import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/custom_row_for_cap_details.dart';
import 'package:flutter/material.dart';

class CapDetails extends StatelessWidget {
  const CapDetails(
      {super.key,
      required this.image,
      required this.name,
      required this.phone});
  final String image;
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                color: AppColors.black,
                size: 30,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.width * .4,
                width: context.width * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.width * .25),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            customRowForCapDetails(context: context, text: name),
            SizedBox(
              height: 30,
            ),
            customRowForCapDetails(context: context, text: phone),
            customButton(
                customButtonInputModel: CustomButtonInputModel(
              context: context,
              buttonName: 'Subscribe Now',
              onPressedFunction: () {},
            ))
          ],
        ),
      ),
    );
  }
}
