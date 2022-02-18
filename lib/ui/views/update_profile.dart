import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/user_provider.dart';
import 'package:provider_task/ui/shared/custom_textfield.dart';
import 'package:provider_task/utils/text_styles.dart';
import '../shared/custom_button.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserProvider>(context);
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
              children: [
                SizedBox(height: h * 0.1),
                Text(
                  'Update your profile',
                  style: AppTextStyles.Headline1,
                ),
                SizedBox(height: h * 0.05),
                CustomTextField(
                  keyboardType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  controller: vm.firstNameController,
                  labelText: 'First name',
                  hintText: 'Enter your first name',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  keyboardType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  controller: vm.lastNameController,
                  labelText: 'Last name',
                  hintText: 'Enter your last name',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  controller: vm.countryController,
                  labelText: 'Country',
                  hintText: 'Enter your country ISO code',
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .updateUserDetails(
                      context,
                    );
                  },
                  label: 'Update Profile',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
