
import 'package:pos/features/categories/data/models/category_model.dart';

sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesSuccess extends GetCategoriesState
{
  final List<CategoryModel> categories;
  GetCategoriesSuccess(this.categories);
}

final class GetCategoriesError extends GetCategoriesState
{
  final String error;
  GetCategoriesError(this.error);
}