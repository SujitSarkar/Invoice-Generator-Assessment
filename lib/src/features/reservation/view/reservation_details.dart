import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyntax_car_rent/core/constants/app_color.dart';
import 'package:nyntax_car_rent/shared/widgets/text_widget.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controller/reservation_controller.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ReservationController controller = Get.find();
    return AppScaffold(
        body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const PageTitle(title: AppString.reservationDetails)
            .paddingOnly(bottom: 25),
        CardWidget(
          contentPadding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormFieldWidget(
                controller: controller.reservationId,
                labelText: AppString.reservationId,
                required: true,
              ).paddingOnly(bottom: 20),
              TextFormFieldWidget(
                controller: controller.pickupDate,
                onTap: () {},
                labelText: AppString.pickupDate,
                hintText: '${AppString.select} ${AppString.dateAndTime}',
                required: true,
                readOnly: true,
                suffixIcon: Icons.calendar_today_outlined,
              ).paddingOnly(bottom: 20),
              TextFormFieldWidget(
                controller: controller.returnDate,
                onTap: () {},
                labelText: AppString.returnDate,
                hintText: '${AppString.select} ${AppString.dateAndTime}',
                required: true,
                readOnly: true,
                suffixIcon: Icons.calendar_today_outlined,
              ).paddingOnly(bottom: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 2,
                      child: BodyText(
                        text: AppString.duration,
                      )),
                  Expanded(
                      flex: 3,
                      child: CardWidget(
                        alignment: Alignment.center,
                        contentPadding: const EdgeInsets.all(10),
                        child: BodyText(
                          text: controller.duration.value ?? 'Select Duration',
                          textColor: AppColors.textFieldHintColor,
                        ),
                      ))
                ],
              ).paddingOnly(bottom: 20),
              TextFormFieldWidget(
                controller: controller.discount,
                labelText: AppString.discount,
              ).paddingOnly(bottom: 20),
            ],
          ),
        ).paddingOnly(bottom: 100),
        SolidButton(onTap: () {}, buttonText: AppString.next)
      ],
    ));
  }
}
