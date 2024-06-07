import 'package:get/get.dart';
import '../model/additional_charge_model.dart';

class ChargeController extends GetxController {
  final RxList<AdditionalChargeModel> chargeList =
      <AdditionalChargeModel>[].obs;

  @override
  void onInit() {
    chargeList.addAll(AdditionalChargeModel.chargeList);
    super.onInit();
  }

  void changeChargeCheckboxValue(
    int index,
    bool value,
    AdditionalChargeModel item,
  ) {
    chargeList[index] = AdditionalChargeModel(
        name: item.name,
        chargeType: item.chargeType,
        checkValue: value,
        amount: item.amount);
  }
}
