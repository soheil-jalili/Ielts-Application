import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  // controllers
  final TextEditingController textFieldCode1 = TextEditingController();
  final TextEditingController textFieldCode2 = TextEditingController();
  final TextEditingController textFieldCode3 = TextEditingController();
  final TextEditingController textFieldCode4 = TextEditingController();

  // Focus Nodes
  final FocusNode textFieldFocusNode1 = FocusNode();
  final FocusNode textFieldFocusNode2 = FocusNode();
  final FocusNode textFieldFocusNode3 = FocusNode();
  final FocusNode textFieldFocusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldFocusNode1);
    });
  }

  @override
  void dispose() {
    textFieldCode1.dispose();
    textFieldCode2.dispose();
    textFieldCode3.dispose();
    textFieldCode4.dispose();
    textFieldFocusNode1.dispose();
    textFieldFocusNode2.dispose();
    textFieldFocusNode3.dispose();
    textFieldFocusNode4.dispose();
    super.dispose();
  }

  void _nextField(
    String value,
    FocusNode? nextFocus,
    FocusNode? previousFocus,
  ) {
    if (value.length == 1 && nextFocus != null) {
      nextFocus.requestFocus();
    } else if (value.isEmpty && previousFocus != null) {
      previousFocus.requestFocus();
    }
  }

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
                'کد ارسال شده را وارد کنید .',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.iranSansXBold,
                  fontSize: 24,
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Expanded(
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
                          Row(
                            children: [
                              TextFieldVerificationCode(
                                controller: textFieldCode1,
                                focusNode: textFieldFocusNode1,
                                onChanged: (value) => _nextField(
                                  value,
                                  textFieldFocusNode2,
                                  null,
                                ),
                              ),
                              const SizedBox(width: 24),
                              TextFieldVerificationCode(
                                controller: textFieldCode2,
                                focusNode: textFieldFocusNode2,
                                onChanged: (value) => _nextField(
                                  value,
                                  textFieldFocusNode3,
                                  textFieldFocusNode1,
                                ),
                              ),
                              const SizedBox(width: 24),
                              TextFieldVerificationCode(
                                controller: textFieldCode3,
                                focusNode: textFieldFocusNode3,
                                onChanged: (value) => _nextField(
                                  value,
                                  textFieldFocusNode4,
                                  textFieldFocusNode2,
                                ),
                              ),
                              const SizedBox(width: 24),
                              TextFieldVerificationCode(
                                controller: textFieldCode4,
                                focusNode: textFieldFocusNode4,
                                onChanged: (value) => _nextField(
                                  value,
                                  null,
                                  textFieldFocusNode3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ButtonPrimary(
                            title: 'بازیابی رمز عبور',
                            onPressed: () {
                              String result =
                                  '${textFieldCode1.text}${textFieldCode2.text}${textFieldCode3.text}${textFieldCode4.text}';
                              debugPrint(result);
                            },
                          ),
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
            ),
            HorizentalLine(),
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
