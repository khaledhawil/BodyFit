//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';


const primaryColor= Color(0xff2B475E);
class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);
  static String id = "register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email;
  String? password;
  Function(String)? onChanged;
  bool? obScureText = true ;
  bool isLoading = false ;
  //String id = 'registerPage';
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
       backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            //color: Colors.black38,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child:Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 10,),
                  Center(child: Text('Sign Up' ,style: TextStyle(color:Colors.blue,fontSize: 30.0,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                      Center(child: Text('Create your Account' ,style: TextStyle(fontSize: 20.0))),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (data)
                          {
                            if(data!.isEmpty){
                              return 'Email is empty';
                            }
                          },
                          onChanged: (data){
                            email = data;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.black45),
                              prefixIcon: Icon(Icons.email,color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child:  TextFormField(
                          obscureText: obScureText!,
                          validator: (data)
                          {
                            if(data!.isEmpty){
                              return 'Password is empty' ;
                            }
                          },
                          onChanged: (data){
                            password = data ;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black45),
                              prefixIcon: Icon(Icons.lock
                                  ,color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: 300,
                        child:MaterialButton(
                          height: 40,

                          onPressed: () async {
                            //FirebaseAuth.instance;
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                UserCredential user = await   FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: email!,
                                    password: password!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('success')));
                                Navigator.pop(context);
                              }
                              on FirebaseAuthException catch(e){
                                if (e.code == 'weak-password'){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('weak-password'), ));
                                }else if (e.code == 'email-already-in-use'){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('email already exists')));
                                }else if (e.code == 'invalid-email'){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('The email is bad try enter another email')));
                                }
                                print(e);
                              }
                              catch (e){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('There was an error!')));
                              }
                              isLoading = false;
                              setState(() {

                              });
                            }else{

                            }
                          },
                          child: Text("Sign up",style: TextStyle(fontSize: 17,color: Colors.white),),
                        ),
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("if you have an account !",style: TextStyle(color: Colors.black),),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Sign in",style: TextStyle(color: Colors.blue),
                          ),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              )

          ),
        ),
      ),
    );
  }
}