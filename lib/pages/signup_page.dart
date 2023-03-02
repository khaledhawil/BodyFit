//import 'package:first_day_flutter/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  bool isPassword=true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(40
                  ),
                ),
                Center(child: Text('Sign Up' ,style: TextStyle(color:Colors.blue,fontSize: 30.0,fontWeight: FontWeight.bold),)),
                SizedBox(height: 20,),
                Center(child: Text('Create your Account' ,style: TextStyle(fontSize: 20.0))),
                SizedBox(height: 20,),
                Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFormField(
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  onFieldSubmitted: (value){
                    print(value);
                  },onChanged: (value){
                  print(value);
                },
                  validator: (String? value) {
                    if (value!.isEmpty) return "E-mail must be not empty";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)
                  ),
                ),
                SizedBox(height: 20,),
                Text('Password',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    onFieldSubmitted: (value){
                      print(value);
                    },onChanged: (value){
                  print(value);
                },
                    validator: (String? value) {
                      if (value!.isEmpty) return "password must be not empty";
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconData!=null?IconButton(onPressed: (){
                        setState(() {
                          isPassword=!isPassword;
                        });
                      }, icon: Icon(Icons.remove_red_eye)):null,

                    )
                ), SizedBox(height: 20,),
                SizedBox(height: 5,),
                Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    onFieldSubmitted: (value){
                      print(value);
                    },onChanged: (value){
                  print(value);
                },
                    validator: (String? value) {
                      if (value!.isEmpty) return "password must be not empty";
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconData!=null?IconButton(onPressed: (){
                        setState(() {
                          isPassword=!isPassword;
                        });
                      }, icon: Icon(Icons.remove_red_eye)):null,

                    )
                ), SizedBox(height: 20,),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                  ),

                  width: double.infinity,
                  child: MaterialButton(
                    onPressed:(){
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                    print('Sign Up');

                  } ,child: Text('Sign Up',style: TextStyle(color: Colors.white),),),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(alignment: Alignment.center,
                        child: Text('Already Have An Account?',style: TextStyle(color: Colors.black),)), SizedBox(height: 15,),
                    Container(
                        alignment: Alignment.center,
                        child: TextButton(onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        }
                       , child: Text('Login'))),
                  ],
                )
              ],





            ),
          ),
        ),
      ),
    );
  }
}
