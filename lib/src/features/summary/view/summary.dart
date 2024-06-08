import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nyntax_car_rent/shared/utils/extensions/double_extension.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../../customer/controller/customer_controller.dart';
import '../../reservation/controller/reservation_controller.dart';
import '../../vehicle/controller/vehicle_controller.dart';
import '../controller/summary_controller.dart';
import 'widgets/information_widget.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    final SummaryController controller = Get.find();
    final ReservationController reservationController = Get.find();
    final CustomerController customerController = Get.find();
    final VehicleController vehicleController = Get.find();
    return AppScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Reservation Details
            const PageTitle(title: AppString.reservationDetails)
                .paddingOnly(bottom: 20),
            CardWidget(
              contentPadding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  InformationWidget(
                      title: AppString.reservationId,
                      value: reservationController.reservationId.text),
                  InformationWidget(
                      title: AppString.pickupDate,
                      value: DateFormat(AppString.dateTimeFormatString)
                          .format(reservationController.pickupDateTime.value!)),
                  InformationWidget(
                      title: AppString.dropoffDate,
                      value: DateFormat(AppString.dateTimeFormatString)
                          .format(reservationController.returnDateTime.value!)),
                ],
              ),
            ).paddingOnly(bottom: 35),

            // Customer Information
            const PageTitle(title: AppString.customerInformation)
                .paddingOnly(bottom: 20),
            CardWidget(
              contentPadding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  InformationWidget(
                      title: AppString.firstName,
                      value: customerController.firstName.text),
                  InformationWidget(
                      title: AppString.lastName,
                      value: customerController.lastName.text),
                  InformationWidget(
                      title: AppString.email,
                      value: customerController.email.text),
                  InformationWidget(
                      title: AppString.phone,
                      value: customerController.phone.text),
                ],
              ),
            ).paddingOnly(bottom: 35),

            // Vehicle Information
            const PageTitle(title: AppString.vehicleInformation)
                .paddingOnly(bottom: 20),
            CardWidget(
              contentPadding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  InformationWidget(
                      title: AppString.vehicleType,
                      value: vehicleController.selectedVehicleType.value ??
                          'Not found'),
                  InformationWidget(
                      title: AppString.vehicleModel,
                      value: vehicleController.vehicleModelController.text),
                ],
              ),
            ).paddingOnly(bottom: 35),

            // Charge Summary
            const PageTitle(title: AppString.chargesSummery)
                .paddingOnly(bottom: 20),
            CardWidget(
              contentPadding: const EdgeInsets.all(12),
              color: AppColors.primaryColor.withOpacity(0.2),
              borderColor: AppColors.primaryColor,
              child: Column(
                children: [
                  const InformationWidget(
                    title: AppString.charge,
                    value: AppString.total,
                    isBoald: true,
                  ).paddingOnly(top: 8),
                  const Divider(
                    color: AppColors.primaryColor,
                    height: 0,
                  ).paddingOnly(bottom: 8),
                  if (controller.chargeOfWeek.value != 0)
                    InformationWidget(
                        title:
                            '${AppString.weekly} (${pluralize(reservationController.week.value, AppString.week.toLowerCase())})',
                        value:
                            '\$${controller.chargeOfWeek.value.toTwoDecimalPlaces()}'),
                  if (controller.chargeOfDay.value != 0)
                    InformationWidget(
                        title:
                            '${AppString.daily} (${pluralize(reservationController.day.value, AppString.day.toLowerCase())})',
                        value:
                            '\$${controller.chargeOfDay.value.toTwoDecimalPlaces()}'),
                  if (controller.chargeOfHour.value != 0)
                    InformationWidget(
                        title:
                            '${AppString.hourly} (${pluralize(reservationController.hour.value, AppString.hour.toLowerCase())})',
                        value:
                            '\$${controller.chargeOfHour.value.toTwoDecimalPlaces()}'),
                  Column(
                      children: controller.additionalCharges
                          .map(
                            (item) => InformationWidget(
                                title: item.name,
                                value: '\$${item.amount.toTwoDecimalPlaces()}'),
                          )
                          .toList()),
                  if (reservationController.discount.text.isNotEmpty)
                    InformationWidget(
                      title: AppString.discount,
                      value: '\$${reservationController.discount.text}',
                    ),
                  InformationWidget(
                    title: AppString.netTotal,
                    value:
                        '\$${controller.netTotal.value.toTwoDecimalPlaces()}',
                    isBoald: true,
                  ),
                ],
              ),
            ).paddingOnly(bottom: 35),
          ],
        ),
      ),
    );
  }
}
