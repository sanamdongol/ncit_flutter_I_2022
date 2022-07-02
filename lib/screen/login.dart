import 'package:dayone/screen/dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 8.0, right: 8.0),
            child: Column(
              children: [
                TextFormField(
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
                  decoration: InputDecoration(hintText: 'Enter full name'),
                ),
                TextFormField(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DashboardPage("From Login page"),
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
    );
  }
}
