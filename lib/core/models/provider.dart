import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider_task/core/services/api_service.dart';
import 'package:provider_task/ui/verification/verification_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider_task/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationModel extends ChangeNotifier {
  final _api = ApiService();

  final log = Logger();

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  isLoading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  createAccount(String email, BuildContext context) async {
    final _sharedPref = await SharedPreferences.getInstance();
    if (!email.contains('@') || email == '') {
      _showSnackBar(
        text: 'Please enter a valid email',
        context: context,
        type: SnackBarType.failure,
      );
      return;
    }
    isLoading(true);
    final response = await _api.register(email: email);
    if (response != String) {
      isLoading(false);
      if (response.statusCode == 200) {
        log.i('Success ${response.data}');
        _sharedPref.setString(emailKey, email);
        _showSnackBar(
          text:
              response.data['detail'] ?? 'Please check your mail for your OTP',
          context: context,
          type: SnackBarType.success,
        );
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 500),
            child: VerificationPage(),
          ),
        );
      } else {
        log.e('Status: ${response.statusCode} Error ${response.data}');
        _showSnackBar(
          text: response.data ?? 'Something went wrong',
          context: context,
          type: SnackBarType.failure,
        );
      }
    } else {
      isLoading(false);
      _showSnackBar(
        text: response.toString(),
        context: context,
        type: SnackBarType.failure,
      );
    }

    //just to be safe
    isLoading(false);
  }

  verifyAccount(String otp, BuildContext context) async {
    if (otp == '') {
      _showSnackBar(
        text: 'Please enter the OTP',
        context: context,
        type: SnackBarType.failure,
      );
      return;
    }
    isLoading(true);
  }

  _showSnackBar(
      {required String text,
      required BuildContext context,
      required SnackBarType type}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
        backgroundColor:
            type == SnackBarType.success ? Colors.green : Colors.red,
      ),
    );
  }
}

enum SnackBarType {
  success,
  failure,
}
