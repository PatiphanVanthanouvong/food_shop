import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/authentication/login/login_screen.dart';
import 'package:s_shop_lao/themes/component/hide_keyboard.dart';
import '../../../../../themes/component/button/button.dart';
import '../../../../../themes/component/input_field.dart';
import '../auth_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    size: ButtonSize.medium,
                    text: 'Register',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Call the register function from AuthViewModel
                        authViewModel.register(_usernameController.text,
                            _passwordController.text, "Billion");
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

                // Already have an account? Login Button
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    size: ButtonSize.medium,
                    text: 'Already have an account? Login',
                    type: ButtonType.outline,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
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
