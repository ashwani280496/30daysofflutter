import 'package:flutter/material.dart';
import 'package:flutter_catelog/Helper/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isButtonPressed = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isButtonPressed = true;
      });

      // await Future.delayed(Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.home);
      // setState(() {
      //   isButtonPressed = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_illustration.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome $name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Username', labelText: 'Username'),
                      onChanged: (newText) {
                        setState(() {
                          name = newText;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cant be empty";
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password', labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cant be empty";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(isButtonPressed ? 25 : 8),
                      color: Colors.purple,
                      child: InkWell(
                        onTap: () {
                          moveToHome();
                        },
                        child: AnimatedContainer(
                            height: 50,
                            width: isButtonPressed ? 50 : 150,
                            alignment: Alignment.center,
                            duration: Duration(seconds: 1),
                            child: isButtonPressed
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
