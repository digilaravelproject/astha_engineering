import 'package:safecheck_techno/core/utils/logger.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  // late Razorpay _razorpay;

  void initialize() {
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    AppLogger.info('Razorpay initialized');
  }

  void openCheckout({required double amount, required String name, required String description, required String contact, required String email}) {
    AppLogger.info('Opening Razorpay checkout for amount: \$amount');
    /*
    var options = {
      'key': 'rzp_live_YOUR_KEY',
      'amount': amount * 100, // in paise
      'name': name,
      'description': description,
      'prefill': {
        'contact': contact,
        'email': email
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      AppLogger.error('Error starting razorpay: $e');
    }
    */
  }

  void dispose() {
    // _razorpay.clear();
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   AppLogger.info('Payment Success: ${response.paymentId}');
  // }
  
  // void _handlePaymentError(PaymentFailureResponse response) {
  //   AppLogger.error('Payment Error: ${response.code} - ${response.message}');
  // }
  
  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   AppLogger.info('External Wallet Selected: ${response.walletName}');
  // }
}
