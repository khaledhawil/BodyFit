import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/pages/register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'home.dart';



// This Page Content a Sign In Method
// the user enters his name and Email and password
 // all of them will saved on   Flutter Firebase


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? password;
  String? _username;
  TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Function(String)? onChanged;
  bool isLoading = false;
  bool? obScureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
      //  backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              //color: Colors.black38,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/fit.jpg'),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        'My Fitnees',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Sign in to your account',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        //padding: EdgeInsets.all(2),
                        child: TextFormField(
                          controller: _usernameController,
                          //  controller: myController,
                          // this validator to show message when user enters no Name
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'User name please!';
                            }
                          },
                          // onChanged: (data) {
                          //   _username = data!;
                          // },
                          decoration: InputDecoration(
                              hintText: "Your Name",
                              hintStyle: TextStyle(color: Colors.black45),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        // padding: EdgeInsets.all(2),
                        child: TextFormField(
                          // this validator to show message when user enters no Email
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'Email is empty';
                            }
                          },
                          onChanged: (data) {
                            email = data;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.black45),
                              prefixIcon: Icon(Icons.email, color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: TextFormField(
                          // This obscure Text to hied the pass
                          obscureText: obScureText!,
                          // this validator to show message when user enters no Pass
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'Password is empty';
                            }
                          },
                          onChanged: (data) {
                            password = data;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black45),
                              prefixIcon: Icon(Icons.lock, color: Colors.blue),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Remember me')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: MaterialButton(
                          // this button to send and receive the date to firebase to check
                          height: 40,
                          onPressed: () async {
                            //FirebaseAuth.instance;
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: email!, password: password!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('success')));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Home(username: _usernameController.text),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('User not found try to Sign Up !'),
                                  ));
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Wrong password enter the correct pass')));
                                } else if (e.code == 'invalid-email') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'The email is bad try enter another email')));
                                }
                                print(e);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('There was an error!')));
                              }
                              isLoading = false;
                              setState(() {});
                            } else {}
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Forget the Password?',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "if you do not have an account !",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "register");
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
