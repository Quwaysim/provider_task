import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/auth_provider.dart';
import 'package:provider_task/ui/shared/custom_textfield.dart';
import 'package:provider_task/ui/shared/custom_button.dart';
import 'package:provider_task/utils/text_styles.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    final vm = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: vm.isBusy,
      color: Colors.blueGrey,
      progressIndicator: CircularProgressIndicator(color: Colors.blueGrey[900]),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.1),
                Text(
                  'Welcome, please register to continue',
                  style: AppTextStyles.Headline1,
                ),
                SizedBox(height: h * 0.05),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .createAccount(emailController.text, context);
                  },
                  label: 'Create Account',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
