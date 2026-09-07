import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/core/constants/app_enums.dart';
import 'package:flutter_application_socialhub/core/theme/app_color.dart';
import 'package:flutter_application_socialhub/core/theme/app_text_style.dart';
import 'package:flutter_application_socialhub/core/utils/app_regexp.dart';
import 'package:flutter_application_socialhub/core/widgets/app_button.dart';
import 'package:flutter_application_socialhub/core/widgets/app_icon_button.dart';
import 'package:flutter_application_socialhub/core/widgets/app_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecurePassword = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'please enter your email';
    }

    if (!AppRegexp.emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your password';
    }

    if (!AppRegexp.passwordRegex.hasMatch(value)) {
      return 'Password must contain uppercase, lowercase, number and special character';
    }
    return null;
  }

  void onLoginPressed() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final email = emailController.text.trim();
    final password = passwordController.text;
    debugPrint('Email:$email');
    debugPrint('Password:$password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIconButton(icon: Icons.arrow_back_ios_new),

                  const SizedBox(height: 50),

                  Text('Welcome Back!', style: AppTextStyle.heading),
                  const SizedBox(height: 8),
                  Text(
                    'Login to continue to SocialHub',
                    style: AppTextStyle.bodySecondary,
                  ),
                  SizedBox(height: 40),
                  Text('Email', style: AppTextStyle.body),
                  const SizedBox(height: 8),
                  AppTextField(
                    validator: validateEmail,
                    controller: emailController,
                    hintText: 'Enter Your email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 20),
                  Text('Password', style: AppTextStyle.body),
                  SizedBox(height: 8),
                  AppTextField(
                    validator: validPassword,
                    controller: passwordController,
                    hintText: 'Enter Your password',
                    onChanged: (value) {},
                    obscureText: obsecurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePassword = !obsecurePassword;
                        });
                      },
                      icon: obsecurePassword
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyle.bodySecondary.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  AppButton(
                    text: 'Login',
                    onPressed: onLoginPressed,
                    type: AppButtonType.primary,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('or continue with'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 35),
                  AppButton(
                    type: AppButtonType.outlined,
                    text: 'Google',
                    icon: Icon(Icons.g_mobiledata, size: 28),
                  ),
                  const SizedBox(height: 35),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppTextStyle.bodySecondary,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: AppTextStyle.bodySecondary.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
