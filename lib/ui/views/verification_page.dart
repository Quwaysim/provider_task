import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/auth_provider.dart';
import 'package:provider_task/utils/colors.dart';
import 'package:provider_task/utils/text_styles.dart';

import '../shared/custom_button.dart';

// ignore: must_be_immutable
class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthProvider>(context);
    var h = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: vm.isBusy,
      color: Colors.blueGrey,
      progressIndicator: CircularProgressIndicator(color: Colors.blueGrey[900]),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: h * 0.1),
                Text(
                  'One Time Password',
                  style: AppTextStyles.Headline1,
                ),
                SizedBox(height: h * 0.05),
                Text(
                  'Please enter the code sent to your email address',
                  style: AppTextStyles.defaultTextStyle14,
                ),
                SizedBox(height: h * 0.02),
                Form(
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    cursorColor: AppColors.primaryColor,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pastedTextStyle: AppTextStyles.textfieldHint.copyWith(
                      fontSize: 24,
                    ),
                    pinTheme: PinTheme(
                      selectedColor: AppColors.primaryColor,
                      selectedFillColor: AppColors.primaryColor,
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.primaryColor,
                      disabledColor: Colors.grey,
                      inactiveColor: AppColors.textfieldBorderColor,
                      inactiveFillColor: AppColors.textfieldBorderColor,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: AppColors.primaryColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    showCursor: false,
                    onCompleted: (value) {},
                    // onTap: () {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                SizedBox(height: h * 0.03),
                CustomButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .verifyAccount(_otpController.text, context);
                  },
                  label: 'Proceed',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
