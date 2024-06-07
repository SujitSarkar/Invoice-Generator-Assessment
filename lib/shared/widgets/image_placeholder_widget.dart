part of 'widget_imports.dart';

class ImagePlaceholderWidget extends StatelessWidget {
  const ImagePlaceholderWidget({super.key, this.width, this.iconSize});
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 163.w,
      height: 100,
      child: Icon(
        Icons.image,
        color: AppColors.textFieldHintColor.withOpacity(0.4),
        size: iconSize ?? 110.sp,
      ),
    );
  }
}
