import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/buttons.dart';
import 'package:ielts/widgets/text_fied_primary.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // controllers
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.loginScreenPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 47),
              child: Text(
                'رمز عبور جدید خود را وارد کنید .',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.iranSansXBold,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(24, 32, 24, 16.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(56),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isKeyboardOpen ? 60 : 120,
                    left: 32,
                    right: 32,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldPrimary(
                          hintText: 'رمز عبور جدید',
                          controller: newPassword,
                          isPassword: true,
                        ),

                        const SizedBox(height: 24),

                        TextFieldPrimary(
                          hintText: 'تکرار رمز عبور',
                          controller: repeatPassword,
                          isPassword: true,
                        ),
                        const SizedBox(height: 24),

                        ButtonPrimary(title: 'ورود', onPressed: () {}),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'لغو',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontFamily.iranSansXMedium,
                              color: AppColors.forgetPasswordPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.5),
              child: Container(
                width: 180,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.loginScreenLineColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldVerificationCode extends StatelessWidget {
  const TextFieldVerificationCode({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontFamily.iranSansXMedium,
          ),
          keyboardType: TextInputType.phone,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    AppColors.textFieldBorderBottomVerificationCodeScreenColor,
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    AppColors.textFieldBorderBottomVerificationCodeScreenColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
