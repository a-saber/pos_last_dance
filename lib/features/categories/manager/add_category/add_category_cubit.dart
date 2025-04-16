import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'add_category_state.dart';


class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this.categoryRepo) : super(AddCategoryInitial());
  static AddCategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? image;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addCategory() async
  {
    if(!formKey.currentState!.validate()) return;
    emit(AddCategoryLoading());
    var response = await categoryRepo.addCategory(
      category: CategoryModel(
        name: nameController.text,
        description: descriptionController.text,
        imagePath: image?.path,
      )
    );
    response.fold(
      (l) => emit(AddCategoryError(l)),
      (r) => emit(AddCategorySuccess()),
    );
  }
}
