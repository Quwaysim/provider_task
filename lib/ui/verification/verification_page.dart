import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/ui/registration/registration_page_vm.dart';
import 'package:provider_task/utils/colors.dart';
import 'package:provider_task/utils/text_styles.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please enter the code sent to your\nemail address',
                style: AppTextStyles.defaultTextStyle14,
              ),
              const SizedBox(height: 16),
              Form(
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
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
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: AppColors.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  showCursor: false,
                  onCompleted: (value) {},
                  onTap: () {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              // UIHelper.customVerticalSpace(75.w),
              ElevatedButton(
                onPressed: () {
                  Provider.of<RegistrationModel>(context, listen: false)
                      .verifyAccount(_otpController.text, context);
                },
                child: const Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
