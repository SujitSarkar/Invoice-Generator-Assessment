part of 'router_imports.dart';

class GeneratedPages {
  static List<GetPage> pages = [
    GetPage(
      name: RouterPaths.initializer,
      page: () => const ReservationDetails(),
      binding: ReservationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouterPaths.customerInformation,
      page: () => const CustomerInformation(),
      binding: CustomerBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouterPaths.vehicleInformation,
      page: () => const VehicleInformation(),
      binding: VehicleBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouterPaths.additionalCharge,
      page: () => const AdditionalCharges(),
      binding: ChargeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouterPaths.summary,
      page: () => const Summary(),
      binding: SummaryBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
