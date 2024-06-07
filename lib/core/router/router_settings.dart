part of 'router_imports.dart';

class GeneratedPages {
  static List<GetPage> pages = [
    GetPage(
      name: RouterPaths.initializer,
      page: () => const ReservationDetails(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: RouterPaths.customerInformation,
      page: () => const CustomerInformation(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: RouterPaths.vehicleInformation,
      page: () => const VehicleInformation(),
      binding: VehicleBinding(),
    ),
    GetPage(
      name: RouterPaths.additionalCharge,
      page: () => const AdditionalCharges(),
      binding: ChargeBinding(),
    ),
    GetPage(
      name: RouterPaths.summary,
      page: () => const Summary(),
      binding: SummaryBinding(),
    ),
  ];
}
