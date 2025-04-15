import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'update_category_state.dart';


class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit() : super(UpdateCategoryInitial());
  static UpdateCategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo = CategoryRepo();

  TextEditingController nameController = TextEditingController();
  XFile? image;
  bool showInSalesController = true;
  TextEditingController orderNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateCategory({required int index}) async
  {
    emit(UpdateCategoryLoading());
    if(formKey.currentState!.validate())
    {
      var response = await categoryRepo.updateCategory(
        category: CategoryModel(
          name: nameController.text,
          showInSales: showInSalesController,
          orderNumber: int.parse(orderNumberController.text),
        ),
        index: index
      );
      response.fold(
        (l) => emit(UpdateCategoryError(l)),
        (r) => emit(UpdateCategorySuccess()),
      );
    }
  }
}
