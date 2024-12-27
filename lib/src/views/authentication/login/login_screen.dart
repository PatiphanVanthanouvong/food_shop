import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/home/home_screen.dart';
import 'package:s_shop_lao/themes/component/base_dialog.dart';
import 'package:s_shop_lao/themes/component/hide_keyboard.dart';

import '../../../../themes/component/button/button.dart';
import '../../../../themes/component/input_field.dart';
import '../auth_viewmodel.dart';
import '../register/register_screen.dart';
// import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return HideKeyboard(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [context.color.primary, context.color.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'SuperShop',
                        style: GoogleFonts.notoSansAdlam(
                            color: context.color.onPrimary,
                            fontSize: 42,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  _buildForm(context, authViewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, AuthViewModel authViewModel) {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Username Input Field
                InputField(
                  hint: 'Enter your username or email',
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),

                // Password Input Field
                InputField(
                  hint: 'Enter your password',
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),

                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle Forgot Password Logic
                      print('Forgot Password tapped');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: context.typo.body2.copyWith(
                        color: context.color.secondary,
                        fontWeight: context.typo.regular,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    size: ButtonSize.medium,
                    text: 'Login',
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        // Call the login function from AuthViewModel
                        await authViewModel.login(
                          _usernameController.text,
                          _passwordController.text,
                        );

                        final isLogin = authViewModel.isLoggedIn();

                        if (isLogin) {
                          // Navigate to HomeScreen on successful login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );

                          // Optionally show a success dialog
                          showDialog(
                            context: context,
                            builder: (context) => const BaseDialog(
                              title: "Login Successful",
                            ),
                          );
                        } else {
                          // Show failure dialog
                          showDialog(
                            context: context,
                            builder: (context) => const BaseDialog(
                              title: "Login Failed",
                              content: Text("Invalid username or password"),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: context.color.background.withOpacity(0.2),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'OR',
                      style: context.typo.body2.copyWith(
                        color: context.color.background,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Divider(
                        color: context.color.background.withOpacity(0.2),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    size: ButtonSize.medium,
                    text: 'Register',
                    type: ButtonType.outline,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
