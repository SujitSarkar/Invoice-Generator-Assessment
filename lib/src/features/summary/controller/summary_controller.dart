import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../charge/controller/charge_controller.dart';
import '../../charge/model/additional_charge_checkbox_model.dart';
import '../../reservation/controller/reservation_controller.dart';
import '../../vehicle/controller/vehicle_controller.dart';
import '../model/additional_charge.dart';

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
    debugPrint('VehicleTotal: $vehicleTotal');
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
          debugPrint('Percent: ${vehicleTotal * (element.amount / 100)}');
        } else {
          additionalCharges.add(
            AdditionalCharge(
              name: element.name,
              amount: element.amount,
            ),
          );
          debugPrint('Amount: ${element.amount}');
        }
      }
    }
  }

  void calculateNetTotal() {
    additionalTotal = 0.0;
    for (var element in additionalCharges) {
      additionalTotal = additionalTotal + element.amount;
    }
    netTotal.value = vehicleTotal + additionalTotal;
    debugPrint('Net Total: ${netTotal.value}');
  }
}
