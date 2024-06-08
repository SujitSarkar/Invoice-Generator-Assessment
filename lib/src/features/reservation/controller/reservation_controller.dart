import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../../shared/utils/date_time_helper.dart';
import '../model/duration_model.dart';

class ReservationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController reservationId = TextEditingController();
  final TextEditingController pickupDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
  final TextEditingController discount = TextEditingController();

  final RxInt week = 0.obs;
  final RxInt day = 0.obs;
  final RxInt hour = 0.obs;

  final Rxn<DateTime> pickupDateTime = Rxn();
  final Rxn<DateTime> returnDateTime = Rxn();

  Future<void> pickupDateTimeOnTap(BuildContext context) async {
    pickupDateTime.value = await pickDateTime(context);
    if (pickupDateTime.value != null) {
      pickupDateController.text = DateFormat(AppString.dateTimeFormatString)
          .format(pickupDateTime.value!);
    }
  }

  Future<void> returnDateTimeOnTap(BuildContext context) async {
    if (pickupDateTime.value == null) {
      showToast('Select pickup date first');
      return;
    }
    final date = await pickDateTime(context);
    if (date != null) {
      if (validateReturnDateTime(newReturnDate: date)) {
        returnDateTime(date);
        returnDateController.text = DateFormat(AppString.dateTimeFormatString)
            .format(returnDateTime.value!);
        calculateDuration();
      } else {
        showToast('Minimum duration must be 1 hour');
      }
    }
  }

  bool validateReturnDateTime({required DateTime newReturnDate}) {
    if (pickupDateTime.value != null) {
      final duration = newReturnDate.difference(pickupDateTime.value!);
      return duration.inHours >= 1;
    } else {
      return false;
    }
  }

  void calculateDuration() {
    if (pickupDateTime.value != null && returnDateTime.value != null) {
      final DurationModel durationModel = calculateDateDifference(
          pickupDate: pickupDateTime.value!, returnDate: returnDateTime.value!);
      week(durationModel.week ?? 0);
      day(durationModel.day ?? 0);
      hour(durationModel.hour ?? 0);
    } else {
      showToast('Select pickup and return date time');
    }
  }

  void nextButtonOnTap() {
    if (formKey.currentState!.validate()) {
      if (pickupDateTime.value == null) {
        showToast('Select pickup Date');
        return;
      }
      if (returnDateTime.value == null) {
        showToast('Select return Date');
        return;
      }
      Get.toNamed(RouterPaths.customerInformation);
    }
  }
}
