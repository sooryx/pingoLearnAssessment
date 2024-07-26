import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn/Constants/customthemes.dart';
import 'package:pingolearn/Services/AuthServices/authservices.dart';
import 'package:pingolearn/Widgets/custom_textfield.dart';

class Signupscreen extends StatelessWidget {
   Signupscreen({super.key});


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.deepgreyColor.withOpacity(0.3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Comments",
          style: Theme
              .of(context)
              .textTheme
              .displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.dg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CustomTextField(
              controller: _nameController,
              hintText: "Name",

            ),
            SizedBox(height: 30.h,),
            CustomTextField(
              controller: _emailController,
              hintText: "Email",

            ),
            SizedBox(height: 30.h,),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                AuthService().registerWithEmailPassword(

                    context: context,
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text);
              },
              child: Container(

                  height: 60.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: CustomColors.primaryColor),
                  child: Center(
                      child: Text("Signup", style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),))
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ", style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),),
                InkWell(
                  onTap: () {
                     Navigator.pushNamed(context, "/signin");
                  },
                  child: Text("Signin", style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor),),
                ),
              ],
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }

}
