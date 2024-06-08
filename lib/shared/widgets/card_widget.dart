part of 'widget_imports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.child,
      this.contentPadding,
      this.height,
      this.width,
      this.borderRadius = 5,
      this.alignment,
      this.color,
      this.borderColor});
  final Widget child;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final double? width;
  final double borderRadius;
  final Alignment? alignment;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      padding: contentPadding,
      decoration: BoxDecoration(
        color: color,
        border:
            Border.all(color: borderColor ?? AppColors.borderColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
