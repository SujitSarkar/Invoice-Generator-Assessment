import 'package:get/get.dart';
import '../model/additional_charge_checkbox_model.dart';

class ChargeController extends GetxController {
  final RxList<AdditionalChargeCheckboxModel> chargeList =
      <AdditionalChargeCheckboxModel>[].obs;

  @override
  void onInit() {
    chargeList.addAll(AdditionalChargeCheckboxModel.chargeList);
    super.onInit();
  }

  void changeChargeCheckboxValue(
    int index,
    bool value,
    AdditionalChargeCheckboxModel item,
  ) {
    chargeList[index] = AdditionalChargeCheckboxModel(
        name: item.name,
        chargeType: item.chargeType,
        checkValue: value,
        amount: item.amount);
  }
}
