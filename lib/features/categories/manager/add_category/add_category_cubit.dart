import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'add_category_state.dart';


class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());
  static AddCategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo = CategoryRepo();

  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  XFile? image;
  bool showInSales = true;
  TextEditingController orderNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addCategory() async
  {
    emit(AddCategoryLoading());
    if(formKey.currentState!.validate())
    {
      var response = await categoryRepo.addCategory(
        category: CategoryModel(
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
          showInSales: showInSales,
          orderNumber: int.tryParse(orderNumberController.text),
        )
      );
      response.fold(
        (l) => emit(AddCategoryError(l)),
        (r) => emit(AddCategorySuccess()),
      );
    }
  }

  void changeShowInSalesStatus({required bool value})
  {
    showInSales = value;
    emit(AddCategoryShowInSalesStatus());
  }
}
