import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/student/controllers/auth_controller.dart';
import 'package:telmeeth/core/api/student/model/response/api_response.dart';
import 'package:telmeeth/core/api/student/model/response/auth.dart';
import 'package:telmeeth/features/landing/view/pages/parent/home_parent.dart';
import 'package:telmeeth/features/landing/view/pages/student/home_student.dart';
import '../../../../../core/constants/responsive.dart';
import '../../../../../core/widgets/student/app_primary_button.dart';
import '../../../../../core/widgets/student/custom_textfiled.dart';
import '../../../../../core/widgets/student/label_text.dart';
import '../../../../../core/widgets/student/validators.dart';
import 'package:telmeeth/features/landing/view/pages/teacher/home_teacher.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
void initState() {
  super.initState();
  loadRememberMe();
}

void loadRememberMe() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    rememberMe = prefs.getBool('remember_me') ?? false;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: context.w(7.2),
                      height: context.h(3.9) / context.h(3.2),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: context.h(0.6)),
                  Text(
                    'Please enter your details to log in',
                    style: TextStyle(
                      fontSize: context.w(4.3),
                      height: context.h(3) / context.h(1.9),
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  SizedBox(height: context.h(3.2)),
                  AppPrimaryLabel(text: 'User name'),
                  SizedBox(height: context.h(1)),
                  AppTextField(
                    controller: userNameController,
                    hint: 'Enter the user name',
                    validator: validateUserName,
                  ),
                  SizedBox(height: context.h(2)),
                  AppPrimaryLabel(text: 'Password'),
                  SizedBox(height: context.h(1)),
                  AppTextField(
                    controller: passwordController,
                    hint: 'Enter password',
                    validator: validatePassword,
                  ),
                  SizedBox(height: context.h(2)),
                  Row(
                    children: [
                      SizedBox(
                        height: context.h(2.1),
                        width: context.w(5),
                        child: Checkbox(
                          value: rememberMe,
                          onChanged: (value) async{
                            setState(() {
                              rememberMe = value!;
                            });
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('remember_me', rememberMe);
                          },
                          activeColor: const Color(0xFF2563EB),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      SizedBox(width: context.w(1.9)),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: context.w(3.4),
                          color: const Color(0xFF334155),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'forgot password ?',
                          style: TextStyle(
                            fontSize: context.w(3.4),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(3.9)),
                  AppPrimaryButton(text: 'Sign In', onPressed: () {
                    login();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void login() async {
    AuthController authController =
    Provider.of<AuthController>(context, listen: false);

    ApiResponse<User> apiResponse = await authController.login(
        username: userNameController.text, password: passwordController.text);

    print("Status Code: ${apiResponse.statusCode}");
    print("Message: ${apiResponse.message}");
    print("User Type: ${apiResponse.data?.type}");
    print('USERNAME SENT: ${userNameController.text}');
    print('PASSWORD SENT: ${passwordController.text}');


    if (apiResponse.statusCode == 200 && apiResponse.data != null) {
      final userType = apiResponse.data?.role;

      if (userType == "student") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeStudent()),
        );
      } else if (userType == "teacher") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeTeacher()),
        );
      } else if (userType == "parent") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeParent()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Unknown user role")),
        );
      }

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(apiResponse.message ?? "Login failed")),
      );
    }
  }
}

