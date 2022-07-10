import 'package:dayone/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 8.0, right: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset('assets/anim/walking_outside.json'),
                  TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your name';
                      }
                      if (value.split(" ").length == 1) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        labelText: 'Name',
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    controller: userPasswordController,
                    keyboardType: TextInputType.number,
                    obscureText: _isPasswordHidden,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }

                      if (value.length < 6) {
                        return 'Password must be more than 5';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.lock),
                      hintText: 'Enter password',
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              _isPasswordHidden = !_isPasswordHidden;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /* ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('all good ready to launch'),
                          ),
                        );
                        print('Form validate success');*/
                        String userName = userNameController.text;
                        String pass = userPasswordController.text;
                        print(userName);
                        print(pass);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(
                                userNameController.text,
                                userPasswordController.text),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
