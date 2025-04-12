import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';


class ListOfOrdersItem extends StatefulWidget {
  const ListOfOrdersItem({Key? key}) : super(key: key);

  @override
  State<ListOfOrdersItem> createState() => _ListOfOrdersItemState();
}

class _ListOfOrdersItemState extends State<ListOfOrdersItem> {
  int currentValue = 1;
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2),
          ),
          color: AppColors.grey.withOpacity(0.2)
      ),
      padding: const EdgeInsets.all(10),
      margin:
      const EdgeInsetsDirectional.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   height: 70,
          //   width: 65,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       image: DecorationImage(
          //           image: AssetImage(AssetsManager.test),
          //           fit: BoxFit.cover)),
          // ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ice Coffee',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text('drink',
                      style: TextStyle(
                       //   color: ColorsManager.whiteOpacity,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      '20 \$',
                      style: const TextStyle(
                          fontSize: 18,
                      //    color:
                       //   ColorsManager.secondary,
                       //    fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 \$',
                      //    style:StyleManager.textStyle15,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          'الضريبة: 5\$',
                        //  style: StyleManager.textStyle15,
                        ),
                      ],
                    ),
                    // NumberPicker(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: Colors.black
                    //                 .withOpacity(0.1),
                    //             width: 1.5),
                    //         borderRadius:
                    //         BorderRadius.circular(
                    //             5)),
                    //     selectedTextStyle:
                    //     const TextStyle(
                    //         color: ColorsManager
                    //             .secondary,
                    //         fontWeight:
                    //         FontWeight.bold,
                    //         fontSize: 15),
                    //     textStyle: TextStyle(
                    //         color: Get.isDarkMode?ColorsManager.whiteOpacity
                    //             .withOpacity(0.5):ColorsManager.primaryOpacity
                    //             .withOpacity(0.5),
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 12),
                    //     itemCount: 5,
                    //     itemWidth: 30,
                    //     itemHeight: 30,
                    //     axis: Axis.horizontal,
                    //     minValue: 1,
                    //     maxValue: 1000,
                    //     value: 1,
                    //     onChanged: (val) {
                    //       setState(() {});
                    //     })
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Stack(
    //   alignment: AlignmentDirectional.topEnd,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(10),
    //       margin: const EdgeInsetsDirectional.only(
    //         top: 8,
    //       ),
    //       decoration: BoxDecoration(
    //        // color: ColorsManager.primary,
    //          // border: Border.all(color: ColorsManager.secondary),
    //           borderRadius: BorderRadius.circular(10)),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             height: 80,
    //             width: 80,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 image: const DecorationImage(
    //                   image: NetworkImage(
    //                       "https://tse1.mm.bing.net/th?id=OIP.2m86YwVZYHm4kb2zXVO19AHaKy&pid=Api&rs=1&c=1&qlt=95&w=85&h=124"),
    //                   fit: BoxFit.fill,
    //                 )),
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Ice Coffee",
    //                     style: StyleManager.textStyle20,
    //                   ),
    //                   SizedBox(width: 10,),
    //                   Text(
    //                     "cream",
    //                     style: StyleManager.textStyle20.copyWith(color: ColorsManager.whiteOpacity),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Row(
    //                 children: [
    //                   NumberPicker(
    //                     decoration: BoxDecoration(
    //                         border: Border.all(
    //                             color: Colors.grey.withOpacity(0.2),
    //                             width: 1),
    //                         borderRadius: BorderRadius.circular(5)),
    //                     selectedTextStyle: const TextStyle(
    //                         color: ColorsManager.white,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15),
    //                     textStyle: TextStyle(
    //                         color: Colors.grey,
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 12),
    //                     itemWidth: 30,
    //                     itemHeight: 30,
    //                     axis: Axis.horizontal,
    //                     minValue: 1,
    //                     maxValue: 1000,
    //                     value: currentValue,
    //                     onChanged: (value) =>
    //                         setState(() => currentValue = value),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Row(
    //                 children: const [
    //                   Text(
    //                     "Total:",
    //                     style: StyleManager.textStyle24,
    //                   ),
    //                   SizedBox(
    //                     width: 5,
    //                   ),
    //                   Text(
    //                     "\$35.00",
    //                     style: StyleManager.textStyle24,
    //                   ),
    //                   SizedBox(
    //                     width: 20,
    //                   ),
    //                   Text(
    //                     "price: ",
    //                     style: StyleManager.textStyle24,
    //                   ),
    //                   Text(
    //                     "\$35.00",
    //                     style: StyleManager.textStyle24,
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     InkWell(
    //       child: const CircleAvatar(
    //         backgroundColor: ColorsManager.primary,
    //         radius: 10,
    //         child: Icon(
    //           Icons.close,
    //           size: 14,
    //           color: Colors.white,
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
