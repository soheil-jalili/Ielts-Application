import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';
import 'package:ielts/widgets/text_field_primary.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phoneNumberController = TextEditingController();

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
                'شماره تماس خود را وارد کنید .',
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
                          controller: phoneNumberController,
                          hintText: 'شماره موبایل',
                          isPhoneNumber: true,
                        ),

                        SizedBox(height: 24),

                        ButtonPrimary(title: 'ارسال کد', onPressed: () {}),
                        SizedBox(height: 24),

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

            HorizentalLine(),
          ],
        ),
      ),
    );
  }
}
