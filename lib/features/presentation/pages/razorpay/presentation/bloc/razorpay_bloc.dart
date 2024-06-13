import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'razorpay_event.dart';
part 'razorpay_state.dart';

class RazorPayBloc extends Bloc<RazorPayEvent, RazorPayState> {
  RazorPayBloc() : super(PaymentSuccessState('Initial State'));
  @override
  void onEvent(RazorPayEvent event) {
    // Handle events here
    if (event is MakePaymentEvent) {
      // Add your RazorPay logic here
      // For simplicity, let's assume payment is always successful
      emit(PaymentSuccessState('Payment Successful: \$${event.amount}'));
    }
  }
}
