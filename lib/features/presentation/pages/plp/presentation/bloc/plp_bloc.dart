import 'package:bloc/bloc.dart';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:flutter_poc/features/presentation/pages/plp/data/repositories/plp_repo.dart';

part 'plp_event.dart';
part 'plp_state.dart';

class PLPBloc extends Bloc<PLPEvent, PLPState> {
  final PLPRepo plpRepo;
  int currentPage = 1;
  String searchTerm = '';
  List<Product> productData = [];

  PLPBloc(this.plpRepo) : super(PLPInitial()) {
    on<PLPEvent>((event, emit) async {
      if (event is PLPScreenProductEvent) {
        emit(PLPProductLoadingState());
        try {
          final data = await plpRepo.getPLPProducts(currentPage, "");
          productData = data;
          emit(PLPProductSuccessState(data));
        } catch (e) {
          emit(
              PLPProductFailureState('Error while fetching data from server.'));
        }
      }

      if (event is PLPLoadMoreEvent) {
        if (searchTerm != '') {
          return;
        }
        currentPage = currentPage + 1;
        emit(PLPProductLoadingState());
        try {
          final data = await plpRepo.getPLPProducts(currentPage, searchTerm);
          productData = List.from(productData)..addAll(data);
          emit(PLPProductSuccessState(productData));
        } catch (e) {
          emit(
              PLPProductFailureState('Error while fetching data from server.'));
        }
      }

      if (event is PLPSearchProductsEvent) {
        searchTerm = event.searchTerm;
        emit(PLPProductLoadingState());
        currentPage = 1;
        try {
          final data = await plpRepo.getPLPProducts(currentPage, searchTerm);
          productData = data;
          emit(PLPProductSuccessState(data));
        } catch (e) {
          emit(
              PLPProductFailureState('Error while fetching data from server.'));
        }
        // emit(PLPProductSuccessState(productData
        //     .where((item) => item.title
        //         .toLowerCase()
        //         .contains(event.searchTerm.toLowerCase()))
        //     .toList()));
      }
    });
  }
}
