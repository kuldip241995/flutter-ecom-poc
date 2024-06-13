part of 'razorpay_bloc.dart';

abstract class RazorPayState {}

class PaymentSuccessState extends RazorPayState {
  final String message;
  PaymentSuccessState(this.message);
}

class PaymentFailureState extends RazorPayState {
  final String error;
  PaymentFailureState(this.error);
}
