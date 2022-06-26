import 'package:dayone/screen/forgot_password.dart';
import 'package:dayone/screen/login.dart';
import 'package:dayone/screen/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = RichText(
      text: TextSpan(
        text: 'Welcome to ',
        style: TextStyle(color: Colors.black87, fontSize: 25),
        children: const <TextSpan>[
          TextSpan(text: 'Referly', style: TextStyle(color: Colors.deepOrange)),
        ],
      ),
    );

    Widget secondTitle =
        Text('Enter you registered email address of phone number to login ');

    Widget nameSection = Text('Email or phone number');
    Widget enterEmailSection = const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter email',
      ),
    );

    Widget passwordSection = Text('Enter your password');

    Widget enterPasswordSection = const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter password',
      ),
    );

    Widget forgotPassword = Align(
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
              ),
            );
          },
          child: Text('Forgot Password?')),
      alignment: Alignment.centerRight,
    );

    Widget loginButton = Center(
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        ),
        child: Text('Login'),
      ),
    );

    /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),*/

    Widget bottomSection = RichText(
      text: TextSpan(
        text: 'Don\'t have an accout?',
        style: TextStyle(color: Colors.black87, fontSize: 15),
        children: const <TextSpan>[
          TextSpan(text: 'Sign Up', style: TextStyle(color: Colors.deepOrange)),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        titleSection,
                        SizedBox(height: 15),
                        secondTitle,
                        SizedBox(height: 25),
                        nameSection,
                        SizedBox(height: 10),
                        enterEmailSection,
                        SizedBox(height: 10),
                        passwordSection,
                        SizedBox(height: 10),
                        enterPasswordSection,
                        SizedBox(height: 10),
                        forgotPassword,
                        SizedBox(height: 10),
                        loginButton,
                        SizedBox(height: 90),
                        Center(child: bottomSection)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
