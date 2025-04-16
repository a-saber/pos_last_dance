
sealed class EditCategoryState {}

final class EditCategoryInitial extends EditCategoryState {}

final class EditCategoryLoading extends EditCategoryState {}

final class EditCategorySuccess extends EditCategoryState {}

final class EditCategoryError extends EditCategoryState {

  final String error;

  EditCategoryError(this.error);
}

