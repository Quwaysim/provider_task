import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/providers/user_provider.dart';
import 'package:provider_task/ui/views/update_profile.dart';

import '../../utils/colors.dart';
import '../shared/custom_button.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    provider.firstName ?? '',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    provider.lastName ?? '',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    provider.country ?? '',
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .getUserProfile(context);
                    },
                    label: 'Get User Profile',
                  ),
                  const SizedBox(height: 20),
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
