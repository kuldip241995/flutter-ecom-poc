part of 'plp_bloc.dart';

abstract class PLPEvent {}

final class PLPScreenProductEvent extends PLPEvent {}

final class PLPSearchProductsEvent extends PLPEvent {
  final String searchTerm;
  PLPSearchProductsEvent({required this.searchTerm});
}

class PLPLoadMoreEvent extends PLPEvent {}
