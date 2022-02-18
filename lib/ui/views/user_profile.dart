import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/user_provider.dart';
import 'package:provider_task/ui/views/update_profile.dart';
import 'package:provider_task/utils/text_styles.dart';

import '../../utils/colors.dart';
import '../shared/custom_button.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Consumer<UserProvider>(
      builder: (context, provider, child) => ModalProgressHUD(
        inAsyncCall: provider.isBusy,
        color: Colors.blueGrey,
        progressIndicator:
            CircularProgressIndicator(color: Colors.blueGrey[900]),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(height: h * 0.1),
                  Text(
                    'User Profile',
                    style: AppTextStyles.Headline1,
                  ),
                  SizedBox(height: h * 0.05),
                  Row(
                    children: [
                      const Text('First Name:'),
                      const SizedBox(width: 10),
                      Text(
                        provider.firstName ?? '',
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    children: [
                      const Text('Last Name:'),
                      const SizedBox(width: 10),
                      Text(
                        provider.lastName ?? '...',
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    children: [
                      const Text('Country:'),
                      const SizedBox(width: 10),
                      Text(
                        provider.country ?? '',
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.05),
                  CustomButton(
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .getUserProfile(context);
                    },
                    label: 'Get User Profile',
                  ),
                  SizedBox(height: h * 0.03),
                  CustomButton(
                    outlineColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          reverseDuration: const Duration(milliseconds: 500),
                          child: const UpdateProfilePage(),
                        ),
                      );
                    },
                    label: 'Update Profile',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
