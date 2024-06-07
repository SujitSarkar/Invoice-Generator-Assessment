import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';
import 'text_widget.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: title),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
            height: 8.0,
          )
        ]);
  }
}
