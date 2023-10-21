
sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class GetChefDataLoadingState extends GlobalState {}
final class GetChefDataSuccessState extends GlobalState {}
final class GetChefDataErrorState extends GlobalState {}

