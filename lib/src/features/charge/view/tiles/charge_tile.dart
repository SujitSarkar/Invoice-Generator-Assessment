import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../shared/widgets/text_widget.dart';
import '../../controller/charge_controller.dart';
import '../../model/additional_charge_checkbox_model.dart';

class ChargeTile extends StatelessWidget {
  const ChargeTile({super.key, required this.model, required this.index});
  final AdditionalChargeCheckboxModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ChargeController controller = Get.find();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
            visualDensity: VisualDensity.compact,
            side: const BorderSide(color: AppColors.borderColor, width: 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            value: model.checkValue,
            onChanged: (value) => controller.changeChargeCheckboxValue(
              index,
              value!,
              model,
            ),
          ),
        ),
        Expanded(child: BodyText(text: model.name)),
        BodyText(
            text:
                '${model.chargeType == ChargeType.amount ? '\$' : ''}${model.amount}${model.chargeType == ChargeType.percent ? '%' : ''}')
      ],
    );
  }
}
