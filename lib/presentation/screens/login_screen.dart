import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_plan_app/presentation/screens/home_screen.dart';
import 'package:travel_plan_app/presentation/screens/register_screen.dart';
import 'package:travel_plan_app/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> _login() async {
      String url = 'URL_DO_SEU_BACKEND_LOGIN';

      Map<String, String> body = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro de login'),
              content: Text('Credenciais inválidas. Tente novamente.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    void _register() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Planner'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              hintText: 'E-mail',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'Senha',
              controller: passwordController,
              obscureText: true,
              onChanged: (value) {},
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child:
                    Text('Cadastre-se', style: TextStyle(color: Colors.black)),
                onPressed: _register,
              ),
            )
          ],
        ),
      ),
    );
  }
}
