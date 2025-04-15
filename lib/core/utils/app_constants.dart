
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/features/categories/views/categories_view.dart';
import 'package:pos/features/home/views/widgets/home_view_item_builder.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';
import 'package:pos/features/permissions/views/permissions_view.dart';
import 'package:pos/features/selling_points/presentation/views/selling_points_view.dart';
import 'package:pos/features/users/views/users_view.dart';

class AppConstants{
  static const fontFamily = 'Cairo';
  static List<PermissionItemModel> allPermissions ({bool asAdmin = false})=>
  [
    PermissionItemModel(name:  "Sales Invoice",  isSelected: asAdmin),
    PermissionItemModel(name: "Users",  isSelected: asAdmin),
    PermissionItemModel(name: "Permissions", isSelected: asAdmin),
    PermissionItemModel(name: "Categories",  isSelected: asAdmin),
    PermissionItemModel(name: "Products",  isSelected: asAdmin),
  ];
  static List<HomeViewItemBuilder> gridItems = [
    // homePageCard(
    //   color: Color(0xfff37736),
    //   icon: Icons.grid_view_outlined,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Sales Invoice")),
    //   ),
    //   title: "Sales Invoice",
    //   context: context,
    // ),
    // HomeViewItemBuilder(
    //   color: Color(0xfff37736),
    //   icon: Icons.merge_type,
    //   page: Scaffold(),
    //   title: "Branches",
    // ),
    HomeViewItemBuilder(
      color: Color(0xffFF6D6D),
      page: const SellingPointsView(),
      icon: Icons.control_point_duplicate,
      title: TranslationsKeys.sellingPoint.tr,
    ),
    // homePageCard(
    //   color: Colors.lightGreen,
    //   icon: Icons.account_tree_outlined,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Purchases")),
    //   ),
    //   title: "Purchases",
    //   context: context,
    // ),
    HomeViewItemBuilder(
      color: Color(0xffffa700),
      page: CategoriesView(),
      icon: Icons.code,
      title: TranslationsKeys.categories.tr,
    ),
    HomeViewItemBuilder(
      color: Color(0xfff37736),
      page: Scaffold(),
      icon: Icons.code,
      title: TranslationsKeys.products.tr,
    ),
    HomeViewItemBuilder(
      color: Color(0xffFF6D6D),
      icon: Icons.manage_accounts_outlined,
      page: UsersView(),
      title: TranslationsKeys.users.tr,
    ),
    HomeViewItemBuilder(
      color: Color(0xffFF6D6D),
      icon: Icons.security_rounded,
      page: PermissionsView(),
      title: TranslationsKeys.permissions.tr,
    ),
    // homePageCard(
    //   color: Colors.lightGreen,
    //   icon: Icons.attach_money_outlined,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Cash Receipt")),
    //   ),
    //   title: "Cash Receipt",
    //   context: context,
    // ),
    // homePageCard(
    //   color: Color(0xffffa700),
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Payment Voucher")),
    //   ),
    //   icon: Icons.payment,
    //   title: "Payment Voucher",
    //   context: context,
    // ),
    // homePageCard(
    //   color: Color(0xfff37736),
    //   icon: Icons.money,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Expenses")),
    //   ),
    //   title: "Expenses",
    //   context: context,
    // ),
    // homePageCard(
    //   color: Color(0xffFF6D6D),
    //   icon: Icons.monetization_on_outlined,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Revenue")),
    //   ),
    //   title: "Revenue",
    //   context: context,
    // ),
    // homePageCard(
    //   color: Colors.lightGreen,
    //   icon: Icons.report_gmailerrorred,
    //   title: "Earnings Report & Budget",
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("General Earnings Report & Budget")),
    //   ),
    //   context: context,
    // ),
    // homePageCard(
    //   color: Color(0xffffa700),
    //   icon: FontAwesomeIcons.file,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Taxes")),
    //   ),
    //   title: "Taxes",
    //   context: context,
    // ),
    // homePageCard(
    //   color: Color(0xfff37736),
    //   icon: Icons.ballot_outlined,
    //   page: Scaffold(
    //     appBar: AppBar(title: const Text("Movement Of Financial Invoices")),
    //   ),
    //   title: "Financial Invoices",
    //   context: context,
    // ),
  ];
}