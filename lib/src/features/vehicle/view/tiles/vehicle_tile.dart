import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../shared/widgets/text_widget.dart';
import '../../../../../shared/widgets/widget_imports.dart';
import '../../controller/vehicle_controller.dart';
import '../../model/vehicle_model.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({super.key, required this.model});
  final VehicleModel model;

  @override
  Widget build(BuildContext context) {
    final VehicleController controller = Get.find();
    return Obx(
      () => InkWell(
        onTap: () => controller.vehicleOnTap(model),
        child: CardWidget(
          color: controller.selectedVehicle.value == model
              ? AppColors.primaryColor.withOpacity(0.2)
              : null,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: model.imageUrl ?? '',
                    errorWidget: (context, url, error) =>
                        const ImagePlaceholderWidget(),
                    placeholder: (context, url) =>
                        const ImagePlaceholderWidget(),
                    width: 163.w,
                    fit: BoxFit.fitWidth,
                  ).paddingOnly(right: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: '${model.make} ${model.model}',
                        fontFamily: GoogleFonts.mulish().fontFamily,
                      ).paddingOnly(bottom: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Assets.assetsUser),
                          SmallBodyText(
                            text: '${model.seats ?? '0'} ${AppString.seat}',
                            textColor: AppColors.secondaryTextColor,
                          ).paddingOnly(left: 8)
                        ],
                      ).paddingOnly(bottom: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Assets.assetsBag),
                          SmallBodyText(
                            text: '${model.bags ?? '0'} ${AppString.bags}',
                            textColor: AppColors.secondaryTextColor,
                          ).paddingOnly(left: 8)
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 8)
                ],
              ).paddingOnly(bottom: 20, top: 20, right: 16),
              const Divider(color: AppColors.borderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallBodyText(
                    text: '\$${model.rates?.hourly} / ${AppString.hour}',
                    textColor: AppColors.secondaryTextColor,
                  ),
                  SmallBodyText(
                    text: '\$${model.rates?.daily} / ${AppString.day}',
                    textColor: AppColors.secondaryTextColor,
                  ),
                  SmallBodyText(
                    text: '\$${model.rates?.weekly} / ${AppString.week}',
                    textColor: AppColors.secondaryTextColor,
                  ),
                ],
              ).paddingOnly(left: 16, right: 16, bottom: 6)
            ],
          ),
        ),
      ),
    );
  }
}
