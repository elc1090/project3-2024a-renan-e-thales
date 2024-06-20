import 'package:flutter/material.dart';
import 'package:flutter_front/modules/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Estoque",
                  style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: "username"),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "password"),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _login(
                  usernameController.text.trim(),
                  passwordController.text.trim(),
                ),
                child: const Text("login"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _login(String username, String password) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
