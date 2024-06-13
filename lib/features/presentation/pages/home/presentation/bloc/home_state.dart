part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class PopularProductLoadingState extends HomeState {}

final class PopularProductSuccessState extends HomeState {
  final List<Product> arrPopularItems;
  final List<Product> arrDealsForYouItems;
  PopularProductSuccessState(this.arrPopularItems, this.arrDealsForYouItems);
}

final class PopularProductFailureState extends HomeState {
  final String error;
  PopularProductFailureState(this.error);
}

final class DealForYouLoadingState extends HomeState {}

final class DealForYouSuccessState extends HomeState {
  final List<Product> arrDealItems;
  DealForYouSuccessState(this.arrDealItems);
}

final class DealForYouFailureState extends HomeState {
  final String error;
  DealForYouFailureState(this.error);
}
