
sealed class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoading extends DeleteCategoryState {}

final class DeleteCategorySuccess extends DeleteCategoryState {}

final class DeleteCategoryError extends DeleteCategoryState {

  final String error;

  DeleteCategoryError(this.error);
}

