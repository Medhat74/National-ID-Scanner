import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/texts/app_text_styles.dart';

// ignore: must_be_immutable
class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
  }) : super(key: key);
  String title;
  List<Widget>? actions;
  Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.qr_code_rounded,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: AppTextStyle.appBarText(),
          )
        ],
      ),
      leading: leading,
      backgroundColor: Colors.white,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
