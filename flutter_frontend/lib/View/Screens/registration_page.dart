import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../View-Model/utils/app_colors.dart';
import '../../View-Model/utils/validator.dart';
import '../Components/function_button.dart';
import '../Components/google_fonts.dart';
import '../Components/link_button.dart';
import '../Components/password_field.dart';
import '../Components/text_field.dart';

class RegistrationPage extends HookConsumerWidget {
  final double width;
  const RegistrationPage({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = useTextEditingController();
    FocusNode emailFocus = useFocusNode();
    TextEditingController passController = useTextEditingController();
    FocusNode passFocus = useFocusNode();
    TextEditingController confirmPassController = useTextEditingController();
    FocusNode confirmPassFocus = useFocusNode();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              elevation: 5,
              shadowColor: isDark ? Colors.white : Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 15.0,
                  children: [
                    SizedBox(),
                    Icon(
                      Icons.lock,
                      size: 50.0,
                    ),
                    UseFont(
                      text: 'Enter your username and password to Register',
                      myFont: 'Open Sans',
                      size: 20.0,
                    ),
                    MyTextField(
                      label: 'Email',
                      placeHolder: '12345@gmail.com',
                      controller: emailController,
                      icon: Icon(Icons.email),
                      fieldValidator: Validators.emailValidator,
                      focusNode: emailFocus,
                      width: width,
                    ),
                    PasswordField(
                      label: 'Password',
                      placeHolder: 'Enter your password',
                      controller: passController,
                      hidePassword: Icon(Icons.visibility_off),
                      showPassword: Icon(Icons.visibility),
                      fieldValidator: Validators.passwordValidator,
                      focusNode: passFocus,
                      width: width,
                    ),
                    PasswordField(
                      label: 'Confirm Password',
                      placeHolder: 'Confirm your password',
                      controller: confirmPassController,
                      hidePassword: Icon(Icons.visibility_off),
                      showPassword: Icon(Icons.visibility),
                      fieldValidator: (value) =>
                          Validators.confirmPasswordValidator(
                              value, passController.text),
                      focusNode: confirmPassFocus,
                      width: width,
                    ),
                    FunctionButton(
                      text: 'Register',
                      onPressed: () {},
                      btnColor: AppColors.deepBlue,
                      width: width,
                    ),
                    SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          Text('Already have an account? Click here to'),
                          LinkButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              text: 'Login'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
