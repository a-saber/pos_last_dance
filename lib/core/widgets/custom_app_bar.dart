import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions, this.leading});
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
