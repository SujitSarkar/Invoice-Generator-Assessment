import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_string.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/widgets/page_title.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controller/customer_controller.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.find();
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageTitle(title: AppString.customerInformation)
                .paddingOnly(bottom: 25, left: 16, right: 16),
            CardWidget(
              contentPadding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormFieldWidget(
                    controller: controller.firstName,
                    labelText: AppString.firstName,
                    required: true,
                    textCapitalization: TextCapitalization.words,
                  ).paddingOnly(bottom: 20),
                  TextFormFieldWidget(
                    controller: controller.lastName,
                    labelText: AppString.lastName,
                    required: true,
                    textCapitalization: TextCapitalization.words,
                  ).paddingOnly(bottom: 20),
                  TextFormFieldWidget(
                    controller: controller.email,
                    labelText: AppString.email,
                    required: true,
                    textInputType: TextInputType.emailAddress,
                  ).paddingOnly(bottom: 20),
                  TextFormFieldWidget(
                    controller: controller.phone,
                    labelText: AppString.phone,
                    required: true,
                    textInputType: TextInputType.phone,
                  ).paddingOnly(bottom: 20),
                ],
              ),
            ).paddingOnly(bottom: 80, left: 16, right: 16),
            SolidButton(
                onTap: () {
                  Get.toNamed(RouterPaths.vehicleInformation);
                },
                buttonText: AppString.next)
          ],
        ),
      ),
    );
  }
}
