part of 'widget_imports.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.body});
  final Widget body;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Navigator.of(context).canPop()
              ? InkWell(
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.back,
                        color: AppColors.textColor,
                        size: 20.sp,
                      ),
                      const SizedBox(width: 4),
                      const BodyText(text: 'Back')
                    ],
                  ).paddingOnly(left: 16),
                )
              : const SizedBox.shrink(),
        ),
        body: widget.body);
  }
}
