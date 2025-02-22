import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/cap_container.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/cap_details.dart';
import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  ClientHomePage({super.key});
  List names = ['Ahmed Kamal', 'Ali Mohamed'];
  List images = ['assets/1.jpg', 'assets/2.jpg'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                  size: 45,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          customTextField(
              textFieldInputModel: TextFieldInputModel(
            context: context,
            controller: TextEditingController(),
            textHint: 'Search',
            backgroundColor: const Color(0xffF5F5F5),
            prefixIcon: Icons.search,
          )),
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: capContainer(
                        context: context,
                        image: images[index],
                        name: "Cap: ${names[index]}",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CapDetails(
                              image: images[index],
                              name: names[index],
                              phone: '01022056432',
                            ),
                          ));
                        },
                      )),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
