import 'package:get/get.dart';

abstract class AppTransition
{
  static const Transition defaultTransition = Transition.rightToLeftWithFade;

}
abstract class AppDuration
{
  static const Duration defaultDuration = Duration(milliseconds: 300);
}