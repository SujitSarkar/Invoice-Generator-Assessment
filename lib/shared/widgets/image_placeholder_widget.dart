part of 'widget_imports.dart';

class ImagePlaceholderWidget extends StatelessWidget {
  const ImagePlaceholderWidget(
      {super.key, this.height, this.width, this.iconSize});
  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Ink(
          width: width ?? 130.w,
          height: height ?? 140.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Icon(
            Icons.image,
            color: AppColors.secondaryTextColor,
            size: iconSize ?? 130.sp,
          ),
        ));
  }
}
