import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_plan_app/presentation/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController dtNascController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    String url = 'http://localhost:8080/auth/register';

    Map<String, dynamic> body = {
      'nome': nameController.text,
      'celular': phoneController.text,
      'dataNascimento': dtNascController.text,
      'cpf': cpfController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cadastro realizado'),
            content: Text('Usuário cadastrado com sucesso!'),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de cadastro'),
            content: Text('Falha ao cadastrar usuário. Tente novamente.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Travel Planner'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70),
              CustomTextField(
                hintText: 'Nome Completo',
                controller: nameController,
                keyboardType: TextInputType.text,
                obscureText: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Celular',
                controller: phoneController,
                keyboardType: TextInputType.number,
                obscureText: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Data de Nascimento',
                controller: dtNascController,
                keyboardType: TextInputType.number,
                obscureText: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'CPF',
                controller: cpfController,
                keyboardType: TextInputType.number,
                obscureText: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
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
              Container(
                margin: EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  onPressed: () {
                    _register(context);
                  },
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
