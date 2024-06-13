part of 'plp_bloc.dart';

abstract class PLPState {}

final class PLPInitial extends PLPState {}

final class PLPProductLoadingState extends PLPState {}

final class PLPProductSuccessState extends PLPState {
  final List<Product> arrProductsItems;
  PLPProductSuccessState(this.arrProductsItems);
}

final class PLPProductFailureState extends PLPState {
  final String error;
  PLPProductFailureState(this.error);
}
