import 'package:app_login/app_asset.dart';
import 'package:app_login/sucess_register.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordCheckController = TextEditingController();

    String? verifyPassword() {
      if (passwordController.text != passwordCheckController.text) {
        return "As senhas não coincidem";
      } else if (nomeController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          passwordCheckController.text.isEmpty) {
        return "Todos os campos devem estar preenchidos";
      } else {
        return null;
      }
    }

    void createUser() async {
      final emailClient = Provider((_) => emailController.text);
      Map<String, dynamic> headers = {
        "accept": 'Application/json',
      };

      Map<String, dynamic> body = {
        'nome': nomeController.text,
        'email': emailController.text,
        'senha': passwordController.text
      };

      Response response;
      Dio dio = Dio();

      response = await dio.post(
        "http://192.168.1.200/api/usuario",
        data: body,
        options: Options(headers: headers),
      );
      print(
        response.data.toString(),
      );
    }

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 75, 14, 136),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 120.0,
                            width: 120.0,
                            child: Image.asset(linkedin),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 120.0,
                            width: 120.0,
                            child: Image.asset(add),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 120.0,
                            width: 120.0,
                            child: Image.asset(github),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "or use your email for registration",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      hintText: "Nome",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: TextFormField(
                    controller: passwordCheckController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Confirm Password",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      if (verifyPassword() == null) {
                        createUser();
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const SucessRegister();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: const Center(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 14, 136),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "To keep connected wih us please\nlogin with your personal info",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 25, decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
