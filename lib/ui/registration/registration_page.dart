import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/core/models/provider.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegistrationModel>(context);
    return ModalProgressHUD(
      inAsyncCall: vm.isBusy,
      color: Colors.blueGrey,
      progressIndicator: CircularProgressIndicator(color: Colors.blueGrey[900]),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'Email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<RegistrationModel>(context, listen: false)
                      .createAccount(emailController.text, context);
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
