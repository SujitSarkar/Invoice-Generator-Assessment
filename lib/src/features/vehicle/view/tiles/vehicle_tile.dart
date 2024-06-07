import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nyntax_car_rent/shared/widgets/text_widget.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../shared/widgets/widget_imports.dart';
import '../../model/vehicle_model.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({super.key, required this.model});
  final VehicleModel model;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: model.imageUrl ?? '',
                errorWidget: (context, url, error) =>
                    const ImagePlaceholderWidget(),
                placeholder: (context, url) => const ImagePlaceholderWidget(),
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
                        text: '${model.seats ?? '0'} seat',
                        textColor: AppColors.secondaryTextColor,
                      ).paddingOnly(left: 8)
                    ],
                  ).paddingOnly(bottom: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Assets.assetsBag),
                      SmallBodyText(
                        text: '${model.bags ?? '0'} bag',
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
                text: '\$${model.rates?.hourly} / Hour',
                textColor: AppColors.secondaryTextColor,
              ),
              SmallBodyText(
                text: '\$${model.rates?.daily} / Day',
                textColor: AppColors.secondaryTextColor,
              ),
              SmallBodyText(
                text: '\$${model.rates?.weekly} / Week',
                textColor: AppColors.secondaryTextColor,
              ),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 6)
        ],
      ),
    );
  }
}
