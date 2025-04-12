
sealed class UpdateCategoryState {}

final class UpdateCategoryInitial extends UpdateCategoryState {}

final class UpdateCategoryLoading extends UpdateCategoryState {}

final class UpdateCategorySuccess extends UpdateCategoryState {}

final class UpdateCategoryError extends UpdateCategoryState {

  final String error;

  UpdateCategoryError(this.error);
}

