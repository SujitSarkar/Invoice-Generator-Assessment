enum ChargeType { amount, percent }

class AdditionalChargeModel {
  final String name;
  final double amount;
  final ChargeType chargeType;
  final bool checkValue;

  AdditionalChargeModel(
      {required this.name,
      required this.amount,
      required this.chargeType,
      required this.checkValue});

  static List<AdditionalChargeModel> chargeList = [
    AdditionalChargeModel(
        name: 'Collision Damage Waiver',
        amount: 9.00,
        chargeType: ChargeType.amount,
        checkValue: false),
    AdditionalChargeModel(
        name: 'Liability Insurance',
        amount: 15.00,
        chargeType: ChargeType.amount,
        checkValue: false),
    AdditionalChargeModel(
        name: 'Rental Tax',
        amount: 11.5,
        chargeType: ChargeType.percent,
        checkValue: false),
  ];
}
