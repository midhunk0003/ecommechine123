import 'package:flutter/material.dart';
import 'package:globalecomersmachinetesting/presentation/provider/loginregisterprovider/loginandregisterprovider.dart';
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen({Key? key}) : super(key: key);

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordControlletr = TextEditingController();

  TextEditingController conformPasswordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
      child: SingleChildScrollView(child: Consumer<Loginandregisterprovider>(
        builder: (context, loginandregisterprovider, child) {
          if (loginandregisterprovider.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (loginandregisterprovider.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text("${loginandregisterprovider.errorMessage}")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginandregisterprovider.registerprovider(
                          context,
                          usernameController.text,
                          emailController.text,
                          passwordControlletr.text);
                    },
                    child: Text("Retry"),
                  )
                ],
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    //username
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "user name",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "email",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //password
                    TextFormField(
                      obscureText: !isPasswordVisible,
                      controller: passwordControlletr,
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !isConfirmPasswordVisible,
                      controller: conformPasswordController,
                      decoration: InputDecoration(
                        hintText: "conform password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter conform password";
                        } else if (value != passwordControlletr.text) {
                          return "Passwords do not match";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    InkWell(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          print("validate");
                          await loginandregisterprovider.registerprovider(
                            context,
                            usernameController.text,
                            emailController.text,
                            passwordControlletr.text,
                          );
                        } else {
                          print("please validate");
                        }
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("dont have account"),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, "/loginscreen");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )),
    ));
  }
}
