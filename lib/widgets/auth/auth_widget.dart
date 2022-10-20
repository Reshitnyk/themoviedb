import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/button_style.dart';
import '../main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account'),
      ),
      body: ListView(children: [
        _HeaderWidget(),
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
            'In order to use editing and rating capabilyties of TMDb, as well as get personal recomendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Register'),
            style: AppButtonStyle.linkButton,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "If you signed up but didn't get your verification email.",
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Verify e-mail'),
            style: AppButtonStyle.linkButton,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/main_screen');

      print('open app');
    } else {
      errorText = 'Неправильний пароль чи логін';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Color(0xFF212529));
    final colorBorder = Color(0xFF01B4E4);
    final decorationTextField = InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: colorBorder)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            '$errorText',
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          SizedBox(
            height: 20,
          )
        ],
        Text(
          'Username',
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: decorationTextField,
        ),
        Text(
          'Password',
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: decorationTextField,
          obscureText: true,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                  backgroundColor: MaterialStateProperty.all(colorBorder),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            ),
            SizedBox(
              width: 30,
              height: 0,
            ),
            TextButton(
              onPressed: _resetPassword,
              child: Text('Reset password'),
              style: AppButtonStyle.linkButton,
            ),
          ],
        ),
      ],
    );
  }
}
