import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../charge/controller/charge_controller.dart';
import '../../charge/model/additional_charge_checkbox_model.dart';
import '../../reservation/controller/reservation_controller.dart';
import '../../vehicle/controller/vehicle_controller.dart';
import '../model/additional_charge.dart';
import 'dart:math' as math;

class SummaryController extends GetxController {
  final ReservationController reservationController = Get.find();
  final VehicleController vehicleController = Get.find();
  final ChargeController chargeController = Get.find();

  final RxDouble chargeOfWeek = 0.0.obs;
  final RxDouble chargeOfDay = 0.0.obs;
  final RxDouble chargeOfHour = 0.0.obs;

  double vehicleTotal = 0.0;
  double additionalTotal = 0.0;
  final RxDouble netTotal = 0.0.obs;

  final RxList<AdditionalCharge> additionalCharges = <AdditionalCharge>[].obs;

  @override
  void onInit() {
    calculateIndividualCharge();
    calculateVehicleTotal();
    calculateAdditionalCharge();
    calculateNetTotal();
    super.onInit();
  }

  void calculateIndividualCharge() {
    if (reservationController.week.value != 0) {
      chargeOfWeek.value = reservationController.week.value *
          (vehicleController.selectedVehicle.value?.rates?.weekly ?? 0.0)
              .toDouble();
    }
    if (reservationController.day.value != 0) {
      chargeOfDay.value = reservationController.day.value *
          (vehicleController.selectedVehicle.value?.rates?.daily ?? 0.0)
              .toDouble();
    }
    if (reservationController.hour.value != 0) {
      chargeOfHour.value = reservationController.hour.value *
          (vehicleController.selectedVehicle.value?.rates?.hourly ?? 0.0)
              .toDouble();
    }
  }

  void calculateVehicleTotal() {
    vehicleTotal = chargeOfWeek.value + chargeOfDay.value + chargeOfHour.value;
  }

  void calculateAdditionalCharge() {
    additionalCharges.clear();
    for (var element in chargeController.chargeList) {
      if (element.checkValue) {
        if (element.chargeType == ChargeType.percent) {
          additionalCharges.add(
            AdditionalCharge(
              name: element.name,
              amount: vehicleTotal * (element.amount / 100),
            ),
          );
        } else {
          additionalCharges.add(
            AdditionalCharge(
              name: element.name,
              amount: element.amount,
            ),
          );
        }
      }
    }
  }

  void calculateNetTotal() {
    additionalTotal = 0.0;
    for (var element in additionalCharges) {
      additionalTotal = additionalTotal + element.amount;
    }
    final discount = double.parse(reservationController.discount.text.isNotEmpty
        ? reservationController.discount.text
        : '0.0');

    netTotal.value = vehicleTotal + additionalTotal - discount;

    final double minimum = calculateMinimumCost(
      reservationController.hour.value,
      reservationController.day.value,
      reservationController.week.value,
      vehicleController.selectedVehicle.value!.rates!.hourly!.toDouble(),
      vehicleController.selectedVehicle.value!.rates!.daily!.toDouble(),
      vehicleController.selectedVehicle.value!.rates!.weekly!.toDouble(),
    );
    debugPrint('Minumum Rate: $minimum');
  }

  double calculateMinimumCost(int hours, int days, int weeks, double hourlyRate,
      double dailyRate, double weeklyRate) {
    final double hourlyCost =
        math.min((hours.toDouble() * hourlyRate), dailyRate);
    final double dailyCost =
        math.min((days.toDouble() * dailyRate), weeklyRate);
    final double weeklyCost = weeks * weeklyRate;
    return hourlyCost + dailyCost + weeklyCost;
  }
}
