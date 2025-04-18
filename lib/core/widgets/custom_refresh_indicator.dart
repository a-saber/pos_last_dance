import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({super.key, required this.child, required this.onRefresh});

  final Widget child;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        backgroundColor: AppColors.white,
        color: AppColors.primary,
        onRefresh: onRefresh,
        child: child
    );
  }
}
