import 'package:flutter_bloc/flutter_bloc.dart';

import 'selling_point_states.dart';


class SellingPointCubit extends Cubit<SellingPointStates> {
  SellingPointCubit() : super(SellingPointInitialState());
  static SellingPointCubit get(context) => BlocProvider.of(context);

  List<CollectionModel> collections = [
    CollectionModel(title: 'فراخ', items: [
      ItemModel(
          title: 'شاورما',
          count: 1,
          tax: 5,
          pricePerOne: 50,
          image: 'AppAssets.test'),
      ItemModel(
          title: 'رول',
          count: 1,
          tax: 8,
          pricePerOne: 30,
          image: 'AssetsManager.test'),
      ItemModel(
          title: 'سوري',
          count: 1,
          tax: 10,
          pricePerOne: 60,
          image: 'AssetsManager.test'),
      ItemModel(
          title: 'طاجن',
          count: 1,
          tax: 2,
          pricePerOne: 40,
          image: 'AssetsManager.test'),
    ]),
    CollectionModel(title: 'لحم', items: [
      ItemModel(
          title: 'شاورما',
          count: 1,
          tax: 5,
          pricePerOne: 60,
          image: 'AssetsManager.meat'),
      ItemModel(
          title: 'رول',
          count: 1,
          tax: 8,
          pricePerOne: 40,
          image:' AssetsManager.meat'),
      ItemModel(
          title: 'سوري',
          count: 1,
          tax: 10,
          pricePerOne: 70,
          image: 'AssetsManager.meat'),
      ItemModel(
          title: 'طاجن',
          count: 1,
          tax: 2,
          pricePerOne: 50,
          image: 'AssetsManager.meat'),
    ]),
    CollectionModel(title: 'مشوربات غازية', items: [
      ItemModel(
          title: 'كوكاكولا',
          count: 1,
          tax: 5,
          pricePerOne: 20,
          image: 'AssetsManager.pepsi'),
      ItemModel(
          title: 'بيبسي',
          count: 1,
          tax: 8,
          pricePerOne: 10,
          image:' AssetsManager.pepsi'),
      ItemModel(
          title: 'سيفين اب',
          count: 1,
          tax: 10,
          pricePerOne: 15,
          image: 'AssetsManager.pepsi'),
      ItemModel(
          title: 'شويبس',
          count: 1,
          tax: 2,
          pricePerOne: 10,
          image: 'AssetsManager.pepsi'),
    ]),
    CollectionModel(title: 'عصائر', items: [
      ItemModel(
          title: 'قصب',
          count: 1,
          tax: 5,
          pricePerOne: 20,
          image: 'AssetsManager.mango'),
      ItemModel(
          title: 'برتقال',
          count: 1,
          tax: 8,
          pricePerOne: 10,
          image: 'AssetsManager.mango'),
      ItemModel(
          title: 'تمر',
          count: 1,
          tax: 10,
          pricePerOne: 15,
          image: 'AssetsManager.mango'),
      ItemModel(
          title: 'مانجا',
          count: 1,
          tax: 2,
          pricePerOne: 10,
          image: 'AssetsManager.mango'),
      ItemModel(
          title: 'تفاح',
          count: 1,
          tax: 2,
          pricePerOne: 10,
          image: 'AssetsManager.mango'),
    ]),
  ];
  int collectionCurrentIndex = 0;
  double orderTotal = 0;
  int orderItemsNumber = 0;
  List<ItemModel> order = [];

  int itemIndex = -1;
  groupTapped(int index) {
    itemIndex = index;
    emit(SellingPointTappedState());
  }

  void addItemToOrder(ItemModel itemModel)
  {
    orderTotal += (itemModel.count * itemModel.pricePerOne) + itemModel.tax;
    orderItemsNumber += itemModel.count;
    order.add(itemModel);
    emit(OrderAddItemState());
  }
  void deleteItemFromOrder(int index)
  {
    orderItemsNumber -= order[index].count;
    orderTotal -= (order[index].count *
        order[index].pricePerOne) +
        order[index].tax;
    order.removeAt(index);
    emit(OrderDeleteItemState());
  }
  void clearOrder()
  {
    order.clear();
    orderTotal = 0;
    orderItemsNumber = 0;
    emit(OrderClearItemState());
  }
  void changeItemCount({bool fromBill = false, required int val, required int index})
  {
    if(fromBill) {
      if (val > order[index].count)
      {
        orderItemsNumber +=
        (val - order[index].count);
        orderTotal +=
            (val - order[index].count) *
                order[index].pricePerOne;
      }
      else
      {
        orderItemsNumber -=
        (order[index].count -
            val);
        orderTotal -=
            (order[index].count -
                val) *
                order[index]
                    .pricePerOne;
      }
      order[index].count = val;
    }
    else
    {
      print(val);
      print('$index +++++++++');
      collections[0].items[index].count = val;
    }
    emit(changeItemCountState());
  }
}



class ItemModel {
  String title;
  String image;
  int count;
  double tax;
  double pricePerOne;

  ItemModel({
    required this.title,
    required this.image,
    required this.count,
    required this.tax,
    required this.pricePerOne,
  });
}

class CollectionModel {
  String title;
  List<ItemModel> items;

  CollectionModel({required this.title, required this.items});
}