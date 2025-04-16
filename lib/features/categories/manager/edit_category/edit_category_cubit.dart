import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'edit_category_state.dart';


class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit(this.categoryRepo, this.category) : super(EditCategoryInitial())
  {
    nameController.text = category.name ?? '';
    descriptionController.text = category.description ?? '';
  }
  static EditCategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo;
  CategoryModel category;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? image;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> editCategory() async
  {
    if(!formKey.currentState!.validate()) return;

    category.name = nameController.text;
    category.description = descriptionController.text;
    if(image != null) category.imagePath = image?.path;

    emit(EditCategoryLoading());
    var response = await categoryRepo.updateCategory(
      category: category,
    );
    response.fold(
      (l) => emit(EditCategoryError(l)),
      (r) => emit(EditCategorySuccess()),
    );

  }
}
