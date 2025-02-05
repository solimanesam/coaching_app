import 'package:coaching_app/core/constants/view_constants.dart';

import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/auth/presentation/view/components/fill_your_profile_Bloc_builder.dart';
import 'package:flutter/material.dart';

class FillYourProfilePage extends StatelessWidget {
  const FillYourProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
              customAppBarInputModel: CustomAppBarInputModel(
            appBarTitle: 'Fill Your Profile',
            context: context,
            iconButtonOnPressedFunction: () => Navigator.pop(context),
          )),
          FillYourProfileBlocBuilder(),
          customButton(
              customButtonInputModel: CustomButtonInputModel(
            context: context,
            buttonName: ViewConstants.doneButtonText,
            onPressedFunction: () {},
          ))
        ],
      ),
    );
  }
}
