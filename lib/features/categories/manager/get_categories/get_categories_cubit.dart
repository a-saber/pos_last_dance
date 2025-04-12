

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/categories/data/repo/category_repo.dart';

import 'get_categories_state.dart';


class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());
  static GetCategoriesCubit get(context) => BlocProvider.of(context);

  CategoryRepo categoryRepo = CategoryRepo();

  Future<void> getCategories() async
  {
    print("calling get categories . . . ");
    emit(GetCategoriesLoading());
    var response = await categoryRepo.getCategories();
    response.fold(
      (l) => emit(GetCategoriesError(l)),
      (r) => emit(GetCategoriesSuccess(r)),
    );
  }
}
