import 'package:flutter/material.dart';


import 'sell_points_small_view.dart';
import 'selling_points_big_view.dart';

class SellingPointsView extends StatelessWidget {
  const SellingPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 800) {
      return SellingPointBigView();
    }

    return SellingPointsSmallView();
  }
}
