import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';
import 'package:telmeeth1/screens/sign_up.dart';
import 'package:telmeeth1/widget/app_primary_button.dart';
import 'package:telmeeth1/widget/custom_textfiled.dart';
import 'package:telmeeth1/widget/label_text.dart';
import 'package:telmeeth1/widget/validators.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: SingleChildScrollView(
            child:
              Form(
                key: _formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back' , style: TextStyle(
                      fontSize: ResponsiveValues.font(context, 30),
                      height: 36 / 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                    ),
                    SizedBox(height: 6,),
                    Text('Please enter your details to log in' , 
                    style: TextStyle(
                      fontSize: ResponsiveValues.font(context, 18),
                      height: 28 / 18,
                      color: const Color(0xFF64748B),
                    ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 20,),
                    AppPrimaryLabel(text: 'User name'),
                    SizedBox(height: 10,),
                    AppTextField(controller: userNameController, hint: 'Enter the user name' , validator: validateUserName,),
                    SizedBox(height: 20,),
                    AppPrimaryLabel(text: 'Password'),
                    SizedBox(height: 10,),
                    AppTextField(controller: passwordController, hint: 'Enter password' , validator: validatePassword,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                            setState(() {
                            rememberMe = value!;
                            });
                          },
                          activeColor: const Color(0xFF2563EB),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('Remember Me',
                        style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 14),
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
                          child: Text('forgot password ?',
                            style: TextStyle(
                            fontSize: ResponsiveValues.font(context, 14),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2563EB),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 36,),
                    AppPrimaryButton(text: 'Sign In', onPressed: (){}),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?',
                        style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 14),
                        height: 20 / 14,
                        color: const Color(0xFF64748B),
                        ),
                        ),
                        SizedBox(width: 0.5,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        }, 
                        child: Text('Register now' ,
                        style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 14),
                        height: 20 / 14,
                        color: const Color(0xFF64748B),
                        ),
                        ))
                      ],
                    ),
                  ],
                ))
          ),
        )),
    );
  }
}