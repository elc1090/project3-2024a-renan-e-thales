import 'dart:developer';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/widgets/custom_text.dart';
import 'package:flutter_front/modules/home/home_page.dart';
import 'package:flutter_front/modules/login/login_controller.dart';
import 'package:flutter_front/modules/register/register_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = globals.loginController;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLogado = false;

  redirect() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
    globals.toastController.show(context, "Bem-vindo, ${controller.user!.nome}!", Colors.green, CarbonIcons.checkmark_outline, const Duration(seconds: 3));
  }

  getLocalUser() async {
    isLogado = await controller.getLocalUser();
    if (isLogado) {
      redirect();
    }
  }

  @override
  void initState() {
    getLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width : 400,
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
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
            mainAxisSize: MainAxisSize.min,
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
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Observer(
                  builder: (_) => TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(controller.hidePassword ? CarbonIcons.view_off : CarbonIcons.view),
                        onPressed: () => controller.hidePassword = !controller.hidePassword,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    obscureText: !controller.hidePassword,
                    onEditingComplete: () async => await _login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => controller.loading
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async => await _login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                        child: CustomText(
                          "Entrar",
                          size: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    'Não possui uma conta? ',
                    size: 12,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage())),
                    style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                    child: CustomText(
                      'registrar',
                      color: Colors.blue,
                      size: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(String email, String password) async {
    controller.loading = true;
    final user = await globals.dataManager.getUser(email, password);
    if (user != null) {
      controller.user = user;
      globals.user = user;
    }
    controller.loading = false;
    if (controller.logado && mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      globals.toastController.show(context, "Bem-vindo, ${controller.user!.nome}!", Colors.green, CarbonIcons.checkmark_outline, const Duration(seconds: 3));
    } else {
      if (mounted) {
        globals.toastController.show(context, "Login falhou", Colors.red, CarbonIcons.warning, const Duration(seconds: 3));
      }
    }
  }
}
