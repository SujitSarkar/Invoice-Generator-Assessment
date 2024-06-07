import 'package:get/get.dart';
import '../../src/features/charge/controller/charge_controller.dart';
import '../../src/features/customer/controller/customer_controller.dart';
import '../../src/features/reservation/controller/reservation_controller.dart';
import '../../src/features/summary/controller/summary_controller.dart';
import '../../src/features/vehicle/controller/vehicle_controller.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationController>(() => ReservationController());
  }
}

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}

class VehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleController>(() => VehicleController());
  }
}

class ChargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargeController>(() => ChargeController());
  }
}

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SummaryController>(() => SummaryController());
  }
}
