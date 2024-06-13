// import 'package:bloc/bloc.dart';
// import 'package:flutter_poc/features/domain/entities/models/product.dart';
// import 'package:flutter_poc/features/presentation/pages/pdp/data/repositories/pdp_repo.dart';
// import 'package:meta/meta.dart';

// part 'pdp_event.dart';
// part 'pdp_state.dart';

// class PDPBloc extends Bloc<PDPEvent, PDPState> {
//   final PDPRepo pdpRepo; // Corrected variable name
//   PDPBloc(this.pdpRepo) : super(PDPInitial()) {
//     on<FetchProductDetailsEvent>((event, emit) async {
//       emit(PDPLoadingState());
//       try {
//         final Product product =
//             await pdpRepo.getProductDetails(event.productId);
//         emit(PDPSuccessState(product));
//       } catch (e) {
//         emit(PDPFailureState('Error while fetching data from the server.'));
//       }
//     });
//   }
// }
