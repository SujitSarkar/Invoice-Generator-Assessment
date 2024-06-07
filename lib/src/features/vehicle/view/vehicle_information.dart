import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controller/vehicle_controller.dart';
import 'tiles/vehicle_tile.dart';

class VehicleInformation extends StatelessWidget {
  const VehicleInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final VehicleController controller = Get.find();
    return AppScaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingWidget()
            : Column(
                children: [
                  const PageTitle(title: AppString.vehicleInformation)
                      .paddingOnly(bottom: 25, left: 16, right: 16),
                  CardWidget(
                    contentPadding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        BasicDropdown(
                          items: controller.vehicleTypes,
                          selectedValue: controller.selectedVehicleType.value,
                          hintText: AppString.select,
                          labelText: AppString.vehicleType,
                          required: true,
                          onChanged: (value) =>
                              controller.chanheVehicleType(value),
                        ).paddingOnly(bottom: 20),
                        TextFormFieldWidget(
                          controller: controller.vehicleModel,
                          labelText: AppString.vehicleModel,
                          required: true,
                          suffixIcon: Icons.search,
                          suffixColor: AppColors.primaryColor,
                        ).paddingOnly(bottom: 20),
                      ],
                    ),
                  ).paddingOnly(left: 16, right: 16),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: controller.filteredVehicleList.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) => VehicleTile(
                          model: controller.filteredVehicleList[index]),
                    ),
                  )
                ],
              ),
      ),
      bottomNav: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SolidButton(
              onTap: () {
                Get.toNamed(RouterPaths.additionalCharge);
              },
              buttonText: AppString.next),
        ],
      ).paddingOnly(bottom: 20),
    );
  }
}
