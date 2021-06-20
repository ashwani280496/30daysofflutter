import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/login_illustration.png',
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Username', labelText: 'Username'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter Password', labelText: 'Password'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print('Hi Codepur');
                      },
                      child: Text("Login"))
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
