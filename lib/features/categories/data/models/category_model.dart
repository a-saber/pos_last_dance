class CategoryModel
{
  int? id;
  String? name;
  String? imagePath;
  String? description;

  CategoryModel({
    this.id,
    this.name,
    this.imagePath,
    this.description,
});

  static CategoryModel from (CategoryModel source)
  {
    return CategoryModel(
      id: source.id,
      name: source.name,
      imagePath: source.imagePath,
      description: source.description,
    );
  }

}