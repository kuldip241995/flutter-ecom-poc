import 'package:bloc/bloc.dart';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:flutter_poc/features/presentation/pages/home/data/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeInitial()) {
    on<PopularProductHomeScreenEvent>((event, emit) async {
      emit(PopularProductLoadingState());
      try {
        final data = await homeRepo.getHomeProducts('mens-shoes');
        final res = await homeRepo.getHomeProducts('mens-shirts');
        emit(PopularProductSuccessState(data, res));
      } catch (e) {
        emit(PopularProductFailureState(
            'Error while fetching data from server.'));
      }
    });
  }
}
