import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/categories/data/models/category_model.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'delete_category_state.dart';


class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit() : super(DeleteCategoryInitial());
  static DeleteCategoryCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo = CategoryRepo();

  Future<void> deleteCategory({required int index, required CategoryModel category}) async
  {
    emit(DeleteCategoryLoading());

    var response = await categoryRepo.deleteCategory(
      index: index,
      category: category,
    );
    response.fold(
      (l) => emit(DeleteCategoryError(l)),
      (r) => emit(DeleteCategorySuccess()),
    );
  }
}
