import 'package:coaching_app/core/widgets/custom_check_box.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxsBlocBuilder extends StatelessWidget {
  final int count;
  final List<String> checkBoxsNames;
  const CheckBoxsBlocBuilder({
    super.key,
    required this.count,
    required this.checkBoxsNames,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientInformationCubit, ClientInformationState>(
      builder: (context, state) {
        final ClientInformationCubit controller =
            context.read<ClientInformationCubit>();
        return Column(
            spacing: 30.0,
            children: List.generate(
                count,
                (index) => customCheckBox(
                    customCheckBoxInputModel: CustomCheckBoxInputModel(
                        context: context,
                        checkBoxName: checkBoxsNames[index],
                        value: index == state.selectedCheckBox,
                        onChanged:
                            controller.changeStateOfCheckBox(index: index)))));
      },
    );
  }
}
