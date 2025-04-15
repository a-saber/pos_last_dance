import 'package:dartz/dartz.dart';
import 'package:pos/features/categories/data/models/category_model.dart';

class CategoryRepo
{
  // singleton
  CategoryRepo._();
  static final CategoryRepo _instance = CategoryRepo._();
  factory CategoryRepo() => _instance;


  List<CategoryModel> categories =
  [
    CategoryModel(
      imagePath: 'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature_thumb.jpg?sfvrsn=7abe71fe_4',
      name: 'Fruits',
      showInSales: true,
      orderNumber: 1
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

  Future<Either<String, void>> updateCategory({required CategoryModel category, required int index}) async
  {
    try
    {
      categories[index] = category;
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteCategory({required int index, required CategoryModel category,}) async
  {
    try
    {
      categories.removeAt(index);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }
}