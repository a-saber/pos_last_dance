import 'package:dartz/dartz.dart';
import 'package:pos/features/categories/data/models/category_model.dart';

class CategoryRepo
{
  List<CategoryModel> categories =
  [
    CategoryModel(
      imagePath: 'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature_thumb.jpg?sfvrsn=7abe71fe_4',
      name: 'Fruits',
    )
  ];

  Future<Either<String, void>> addCategory({required CategoryModel category}) async
  {
    try
    {
      categories.add(category);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getCategories() async
  {
    try
    {
      return Right(categories);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> updateCategory({required CategoryModel category}) async
  {
    try
    {
      categories[categories.indexOf(categories.firstWhere((element) => element.id == category.id))] = CategoryModel.from(category);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteCategory({required CategoryModel category}) async
  {
    try
    {
      categories.removeAt(categories.indexOf(categories.firstWhere((element) => element.id == category.id)) );
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }
}