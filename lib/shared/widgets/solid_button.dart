part of 'widget_imports.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.isLoading = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.splashColor,
  });
  final Function() onTap;
  final String buttonText;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final WidgetStateProperty<Color?>? splashColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              backgroundColor: backgroundColor ?? AppColors.primaryColor,
              elevation: 0.0,
              fixedSize: Size(width ?? 175.w, height ?? 48.h),
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(5))))
          .copyWith(
              overlayColor: splashColor ??
                  WidgetStateProperty.all(Colors.white.withOpacity(0.5))),
      onPressed: onTap,
      child: isLoading
          ? const LoadingWidget(color: Colors.white)
          : ButtonText(text: buttonText),
    );
  }
}
