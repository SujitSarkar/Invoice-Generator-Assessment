import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../shared/utils/utils.dart';
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
        child: Form(
          key: controller.formKey,
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
                      textInputType: TextInputType.number,
                    ).paddingOnly(bottom: 20),
                    TextFormFieldWidget(
                      controller: controller.pickupDateController,
                      onTap: () => controller.pickupDateTimeOnTap(context),
                      labelText: AppString.pickupDate,
                      hintText: '${AppString.select} ${AppString.dateAndTime}',
                      required: true,
                      readOnly: true,
                      suffixIcon: Icons.calendar_today_outlined,
                    ).paddingOnly(bottom: 20),
                    TextFormFieldWidget(
                      controller: controller.returnDateController,
                      onTap: () => controller.returnDateTimeOnTap(context),
                      labelText: AppString.returnDate,
                      hintText: '${AppString.select} ${AppString.dateAndTime}',
                      required: true,
                      readOnly: true,
                      suffixIcon: Icons.calendar_today_outlined,
                    ).paddingOnly(bottom: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const BodyText(
                          text: AppString.duration,
                        ).paddingOnly(right: 12),
                        Expanded(
                            child: CardWidget(
                                alignment: Alignment.center,
                                contentPadding: const EdgeInsets.all(10),
                                child: Obx(
                                  () => BodyText(
                                    text:
                                        '${pluralize(controller.week.value, 'week')}, ${pluralize(controller.day.value, 'day')}, ${pluralize(controller.hour.value, 'hour')}',
                                    textColor: AppColors.textFieldHintColor,
                                    textAlign: TextAlign.center,
                                  ),
                                )))
                      ],
                    ).paddingOnly(bottom: 20),
                    TextFormFieldWidget(
                      controller: controller.discount,
                      labelText: AppString.discount,
                      textInputType: TextInputType.number,
                    ).paddingOnly(bottom: 20),
                  ],
                ),
              ).paddingAll(16),
            ],
          ),
        ),
      ),
      bottomNav: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SolidButton(
              onTap: () => controller.nextButtonOnTap(),
              buttonText: AppString.next),
        ],
      ).paddingOnly(bottom: 20),
    );
  }
}
