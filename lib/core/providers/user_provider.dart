import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider_task/core/services/api_service.dart';
import 'package:provider_task/ui/views/user_profile.dart';
import 'package:provider_task/utils/colors.dart';
import 'package:provider_task/utils/constants.dart';
import 'package:provider_task/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._sharedPref);
  final _api = ApiService();
  SharedPreferences _sharedPref;
  final log = Logger();
  String? _firstName;
  String? _lastName;
  String? _country;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get country => _country;

  bool _isBusy = false;

  bool get isBusy => _isBusy;

  isLoading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  getUserProfile(BuildContext context) async {
    isLoading(true);
    final token = _sharedPref.getString(authTokenKey);
    final response = await _api.getUserProfile(token: token!);
    if (response != String) {
      isLoading(false);
      if (response.statusCode == 200) {
        _firstName = response.data['first_name'];
        _lastName = response.data['last_name'];
        _country = response.data['profile']['country'];
        _showSnackBar(
          text: 'User profile successfully fetched',
          context: context,
          type: SnackBarType.success,
        );
      } else {
        log.e('Status: ${response.statusCode} Error ${response.data}');
        _showSnackBar(
          text: 'Something went wrong',
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
    isLoading(false);
  }

  updateUserDetails(BuildContext context) async {
    if (firstNameController.text == '' ||
        lastNameController.text == '' ||
        countryController.text == '') {
      _showSnackBar(
        text: 'Please fill all fields.',
        context: context,
        type: SnackBarType.failure,
      );
      return;
    }
    isLoading(true);
    final token = _sharedPref.getString(authTokenKey);
    final response = await _api.updateUserProfile(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      country: countryController.text,
      token: token!,
    );

    if (response != String) {
      isLoading(false);
      if (response.statusCode == 200) {
        log.i('Success ${response.data}');
        _showSnackBar(
          text: 'User profile updated',
          context: context,
          type: SnackBarType.success,
        );
        //TODO - endpoint has issues, navigate anyways, change values with Provider

        // Navigator.push(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.fade,
        //     duration: const Duration(milliseconds: 500),
        //     reverseDuration: const Duration(milliseconds: 500),
        //     child: const UserProfilePage(),
        //   ),
        // );
      } else {
        log.e('Status: ${response.statusCode} Error ${response.data}');

        //TODO - logically shouldn't be here --- MOCK -- endpoint has issues
        //changing values with Provider
        _firstName = firstNameController.text;
        _lastName = lastNameController.text;
        _country = countryController.text;
        notifyListeners();
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 500),
            child: const UserProfilePage(),
          ),
        );
        _showSnackBar(
          text: 'Unable to update. Something went wrong',
          context: context,
          type: SnackBarType.failure,
        );
        notifyListeners();
      }
    } else {
      isLoading(false);
      _showSnackBar(
        text: response.toString(),
        context: context,
        type: SnackBarType.failure,
      );
    }
    isLoading(false);
  }

  _showSnackBar(
      {required String text,
      required BuildContext context,
      required SnackBarType type}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
        backgroundColor: type == SnackBarType.success
            ? AppColors.greenColor
            : AppColors.redColor,
      ),
    );
  }
}
