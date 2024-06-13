part of 'razorpay_bloc.dart';

abstract class RazorPayEvent {}

class MakePaymentEvent extends RazorPayEvent {
  final double amount;
  MakePaymentEvent(this.amount);
}
