enum ChargeType { amount, percent }

class AdditionalChargeCheckboxModel {
  final String name;
  final double amount;
  final ChargeType chargeType;
  final bool checkValue;

  AdditionalChargeCheckboxModel(
      {required this.name,
      required this.amount,
      required this.chargeType,
      required this.checkValue});

  static List<AdditionalChargeCheckboxModel> chargeList = [
    AdditionalChargeCheckboxModel(
        name: 'Collision Damage Waiver',
        amount: 9.00,
        chargeType: ChargeType.amount,
        checkValue: false),
    AdditionalChargeCheckboxModel(
        name: 'Liability Insurance',
        amount: 15.00,
        chargeType: ChargeType.amount,
        checkValue: false),
    AdditionalChargeCheckboxModel(
        name: 'Rental Tax',
        amount: 11.5,
        chargeType: ChargeType.percent,
        checkValue: false),
  ];
}
