import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeViewItemBuilder extends StatelessWidget {
  const HomeViewItemBuilder({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.page,
  });

  final Color color ;
  final IconData icon;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        MyNavigator.goTo( destinationBuilder: () => page);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: _w > 800 ? _w / 70 : _w / 30,
          bottom: _w > 800 ? _w / 70 : _w / 30,
          left: _w > 800 ? _w / 60 : _w / 40,
          right: _w > 800 ? _w / 60 : _w / 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(25),
              blurRadius: 7,
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Container(
              height: _w > 800 ? 50 : _w / 8,
              width: _w > 800 ? 50 : _w / 8,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primary.withOpacity(.9),
              ),
            ),
            Text(
              title,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}