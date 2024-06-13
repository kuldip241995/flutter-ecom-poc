import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayExample extends StatefulWidget {
  @override
  State<RazorPayExample> createState() => _RazorPayExampleState();
}

class _RazorPayExampleState extends State<RazorPayExample> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print("Payment Success: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print("Payment Error: ${response.code}, ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet response
    print("External Wallet: ${response.walletName}");
  }

  void _openCheckout() async {
    var options = {
      'key': 'rzp_test_kwWw6Ov1srLeLI',
      'amount': (1 * 100), // Amount in paise (1 = 100 paise)
      'name': 'UNIQLO',
      'description': 'Razorpay example',
      'prefill': {'contact': '8140853151', 'email': 'example@email.com'},
      'external': {
        'wallets': ['paytm', 'googlepay', 'phonepay']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(headerTitle: Strings.razorPayExampleTitle),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _openCheckout();
            // BlocProvider.of<RazorpayBloc>(context)
            //     .add(StartPaymentEvent(500.0));
          },
          child: const Text('Make Payment'),
        ),
      ),
    );
  }
}
