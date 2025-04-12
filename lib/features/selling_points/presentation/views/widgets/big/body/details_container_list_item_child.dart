import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';

import '../orders/list_of_orders.dart';


class DetailsContainerListItemBody extends StatefulWidget {
  const DetailsContainerListItemBody({Key? key}) : super(key: key);

  @override
  State<DetailsContainerListItemBody> createState() =>
      _DetailsContainerListItemBodyState();
}

var barcodeController = TextEditingController();
var noteController = TextEditingController();
String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
var startController = TextEditingController();
var discountController = TextEditingController();
var addController = TextEditingController();

class _DetailsContainerListItemBodyState
    extends State<DetailsContainerListItemBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        CustomFormField(
          labelText: 'barCode',
          // fillColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          // borderColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          controller: barcodeController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
          labelText: 'note',
          // fillColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          // borderColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          controller: noteController,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomFormField(
          labelText: _startTime,
          // fillColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          // borderColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
          //subtitle: _startTime,
          controller: startController,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.access_time_outlined,
              color: Colors.grey,
            ),
            onPressed: () async {
              await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                print("^^^^^^^^^^^^^^^^^^^^");
                print(value.toString());
                if (value != null) {
                  setState(() {
                    startController.text = value.format(context).toString();
                    _startTime = startController.text;
                  });
                }
              });
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Order Items",
         // style: StyleManager.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        const ListOfOrders(),
        const SizedBox(
          height: 15,
        ),
        Row(
          children:  [
            Text(
              "Total",
            //  style: StyleManager.textStyle18,
            ),
            Spacer(),
            Text(
              "\$101.7",
              // style: StyleManager.textStyle18,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children:  [
            Text(
              "Tax",
              // style: StyleManager.textStyle18,
            ),
            Spacer(),
            Text(
              "\$20.7",
              // style: StyleManager.textStyle18,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
             Text(
              "discount for",
              // style: StyleManager.textStyle18,
            ),
            const Spacer(),
            SizedBox(
                height: 50,
                width: 150,
                child: CustomFormField(
                  controller: discountController,
                  // fillColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
                  // borderColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
                  labelText: '',),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
             Text(
              "addition for",
              // style: StyleManager.textStyle18,
            ),
            const Spacer(),
            SizedBox(
                height: 50,
                width: 150,
                child: CustomFormField(
                  controller: addController,
                  // fillColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
                  // borderColor: Get.isDarkMode?ColorsManager.primary:ColorsManager.grey.withOpacity(0.2),
                  labelText: '',),),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: CustomFilledBtn(text: "hanging", onPressed: () {  },)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: CustomFilledBtn(text: "outstanding invoice", onPressed: () {  },)),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: CustomFilledBtn(text: "Sales", onPressed: () {  },)),
            SizedBox(
              width: 20,
            ),
            Expanded(child: CustomFilledBtn(text: "Items returned", onPressed: () {  },)),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
             Expanded(child: CustomFilledBtn(text: "Items", onPressed: () {  },)),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: Container())
          ],
        ),
      ],
    );
  }
}
