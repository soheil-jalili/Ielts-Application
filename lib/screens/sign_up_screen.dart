import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/login_screen.dart';
import 'package:ielts/widgets/buttons.dart';
import 'package:ielts/widgets/login_with.dart';
import 'package:ielts/widgets/text_fied_primary.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: AppColors.loginScreenPrimaryColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'بازگشت',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamily.iranSansXMedium,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset(Assets.images.leftCheveron),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 47),
                child: Text(
                  'حساب کاربری خود را ایجاد کنید .',
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
                      top: isKeyboardOpen ? 20 : 127,
                      left: 32,
                      right: 32,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldPrimary(
                            controller: usernameController,
                            hintText: 'نام کاربری',
                          ),

                          SizedBox(height: 24),
                          TextFieldPrimary(
                            controller: passwordController,
                            hintText: 'رمز عبور',
                            isPassword: true,
                          ),
                          SizedBox(height: 24),
                          TextFieldPrimary(
                            controller: phoneNumberController,
                            hintText: 'شماره موبایل',
                            isPhoneNumber: true,
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                fillColor: WidgetStateProperty.resolveWith((
                                  states,
                                ) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.loginScreenPrimaryColor;
                                  }
                                  return Colors.white;
                                }),
                                side: WidgetStateBorderSide.resolveWith((
                                  states,
                                ) {
                                  return BorderSide(
                                    color: AppColors.loginScreenPrimaryColor,
                                    width: 2,
                                  );
                                }),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                              ),

                              SizedBox(width: 4),

                              Text(
                                'پذیرش قوانین و مقررات',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.iranSansXMedium,
                                  color: AppColors.loginScreenPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          ButtonPrimary(title: 'ورود', onPressed: () {}),
                          SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LoginWith(
                                image: Assets.images.google.path,
                                onTap: () {},
                              ),
                              SizedBox(width: 12),
                              LoginWith(
                                image: Assets.images.apple.path,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'حساب کاربری دارید ؟',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: FontFamily.iranSansXMedium,
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'ورود',
                                    style: TextStyle(
                                      color: AppColors.loginScreenPrimaryColor,
                                      fontSize: 16,
                                      fontFamily: FontFamily.iranSansXMedium,
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
