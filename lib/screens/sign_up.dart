import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';
import 'package:telmeeth1/screens/sign_in.dart';
import 'package:telmeeth1/widget/app_primary_button.dart';
import 'package:telmeeth1/widget/custom_textfiled.dart';
import 'package:telmeeth1/widget/label_text.dart';
import 'package:telmeeth1/widget/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
                      Text( 'Join our community', style: TextStyle(
                      fontSize: ResponsiveValues.font(context, 30),
                      height: 36 / 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                      ),
                      ),
                      SizedBox(height: 6,),
                      Text('Create a new account' , 
                      style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 18),
                        height: 28 / 18,
                        color: const Color(0xFF64748B),
                      ),
                      ),
                      SizedBox(height: 15,),
                      AppPrimaryLabel(text: 'User name'),
                      SizedBox(height: 10,),
                      AppTextField(controller: userNameController, hint: 'Enter the user name' , validator: validateUserName,),
                      SizedBox(height: 20,),
                      AppPrimaryLabel(text: 'Password'),
                      SizedBox(height: 10,),
                      AppTextField(controller: passwordController, hint: 'Enter password' , validator: validatePassword,),
                      SizedBox(height: 20,),
                      AppPrimaryLabel(text: 'Email'),
                      SizedBox(height: 10,),
                      AppTextField(controller: emailController, hint:'Enter your email', validator: validateEmail,),
                      SizedBox(height: 20,),
                      AppPrimaryLabel(text: 'PhoneNumber'),
                      SizedBox(height: 10,),
                      AppTextField(controller: phoneNumberController, hint: 'Enter your phone number', validator: validatePhoneNumber,),
                      SizedBox(height: 20,),
                      AppPrimaryLabel(text: 'Address'),
                      SizedBox(height: 10,),
                      AppTextField(controller: addressController, hint: 'Enter your address', validator: validateAddress,),
                      SizedBox(height: 36,),
                      AppPrimaryButton(text: 'Sign Up', onPressed: (){}),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                          style: TextStyle(
                          fontSize: ResponsiveValues.font(context, 14),
                          height: 20 / 14,
                          color: const Color(0xFF64748B),
                          ),
                          ),
                          SizedBox(width: 0.5,),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                          }, 
                          child: Text('Log In' ,
                          style: TextStyle(
                          fontSize: ResponsiveValues.font(context, 14),
                          height: 20 / 14,
                          color: const Color(0xFF64748B),
                          ),
                          ))
                        ],
                      ),
                    ],
                  )),
          ),
        )),
    );
  }
}