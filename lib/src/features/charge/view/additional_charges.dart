import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controller/charge_controller.dart';
import 'tiles/charge_tile.dart';

class AdditionalCharges extends StatelessWidget {
  const AdditionalCharges({super.key});

  @override
  Widget build(BuildContext context) {
    final ChargeController controller = Get.find();
    return AppScaffold(
      body: Column(
        children: [
          const PageTitle(title: AppString.additionalCharge)
              .paddingOnly(bottom: 25, left: 16, right: 16),
          CardWidget(
              child: Obx(
            () => ListView.builder(
              padding: const EdgeInsets.only(
                  left: 10, right: 16, top: 16, bottom: 16),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.chargeList.length,
              itemBuilder: (context, index) {
                return ChargeTile(
                    model: controller.chargeList[index], index: index);
              },
            ),
          )).paddingSymmetric(horizontal: 16),
        ],
      ),
      bottomNav: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SolidButton(
              onTap: () {
                Get.toNamed(RouterPaths.summary);
              },
              buttonText: AppString.next),
        ],
      ).paddingOnly(bottom: 20),
    );
  }
}
