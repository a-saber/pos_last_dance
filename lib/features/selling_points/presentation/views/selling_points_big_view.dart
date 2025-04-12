import 'package:flutter/material.dart';

import 'widgets/big/body/selling_point_body.dart';

class SellingPointBigView extends StatelessWidget {
  const SellingPointBigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SafeArea(child: const SellingPointBody())
        )
    );
  }
}
