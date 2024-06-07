import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  final TextEditingController reservationId = TextEditingController();
  final TextEditingController pickupDate = TextEditingController();
  final TextEditingController returnDate = TextEditingController();
  final TextEditingController discount = TextEditingController();
  final Rxn<String> duration = Rxn();
}
