import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../shared/widgets/text_widget.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget(
      {super.key,
      required this.title,
      required this.value,
      this.isBoald = false});
  final String title;
  final String value;
  final bool isBoald;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BodyText(
          text: title,
          textAlign: TextAlign.start,
          fontWeight: isBoald ? FontWeight.w600 : null,
        ),
        Flexible(
            child: BodyText(
          text: value,
          textAlign: TextAlign.end,
          fontWeight: isBoald ? FontWeight.w600 : null,
        )),
      ],
    ).paddingOnly(bottom: 10);
  }
}
