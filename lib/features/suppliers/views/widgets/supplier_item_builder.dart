import 'package:flutter/material.dart';
import 'package:pos/core/helper/my_copy_to_clipboard.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/widgets/custom_network_image.dart';
import 'package:pos/features/suppliers/data/models/supplier_model.dart';
import 'package:pos/features/suppliers/views/edit_supplier_view.dart';
import 'delete_supplier_confirm_dialog.dart';


class SupplierItemBuilder extends StatelessWidget {
  const SupplierItemBuilder({super.key, required this.supplier});

  final SupplierModel supplier;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        MyNavigator.goTo(destinationBuilder: ()=>EditSupplierView(supplier: SupplierModel.from(supplier)));
      },
      onLongPress: ()
      {
        myCopyToClipboard(context, supplier.phone.toString());
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeleteSupplierConfirmDialog(
              context: context,
              supplier: supplier,
          );
        },
        key: UniqueKey(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(25),
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              CustomCachedNetworkImage(
                imageUrl: supplier.imagePath ?? 'https://www.hitsa.com.au/wp-content/uploads/types-of-chefs.jpg',
                borderRadius: BorderRadius.circular(15),
                imageBuilder: (imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    )
                  ),
                ),
                width: 75,
                height: 75,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                    supplier.name ?? '',
                    style: AppTextStyles.itemsTitle(),
                  ),
                  if(supplier.phone != null && supplier.phone!.isNotEmpty)
                  Text( supplier.phone ?? ''),
                  if(supplier.address != null && supplier.address!.isNotEmpty)
                  Text( supplier.address??'' ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
