
sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}

final class AddCategoryLoading extends AddCategoryState {}

final class AddCategorySuccess extends AddCategoryState {}

final class AddCategoryError extends AddCategoryState {

  final String error;

  AddCategoryError(this.error);
}

final class AddCategoryShowInSalesStatus extends AddCategoryState {}
