import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controller/reservation_controller.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ReservationController controller = Get.find();
    return AppScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const PageTitle(title: AppString.reservationDetails)
              .paddingOnly(bottom: 25, left: 16, right: 16),
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
                            text: controller.duration.value ?? 'Not Selected',
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
          ).paddingOnly(bottom: 80, left: 16, right: 16),
          SolidButton(
              onTap: () {
                Get.toNamed(RouterPaths.customerInformation);
              },
              buttonText: AppString.next)
        ],
      ),
    ));
  }
}
