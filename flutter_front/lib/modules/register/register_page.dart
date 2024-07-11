import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/widgets/custom_text.dart';
import 'package:flutter_front/modules/register/register_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;
import '../home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController controller = globals.registerController;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  CustomText('Registrar'),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Nome",
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
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Observer(
                  builder: (_) => TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirmar Senha",
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
                        icon: Icon(controller.hideConfirmPassword ? CarbonIcons.view_off : CarbonIcons.view),
                        onPressed: () => controller.hideConfirmPassword = !controller.hideConfirmPassword,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    obscureText: !controller.hideConfirmPassword,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  final registered = await register(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  if (context.mounted) {
                    if (registered) {
                      globals.toastController.show(
                        context,
                        "Sucesso!",
                        Colors.green,
                        CarbonIcons.checkmark_outline,
                        const Duration(seconds: 2),
                      );
                    } else {
                      globals.toastController.show(
                        context,
                        "Falha!",
                        Colors.red,
                        CarbonIcons.checkmark_outline,
                        const Duration(seconds: 2),
                      );
                    }
                  }
                },
                child: CustomText(
                  'Enviar',
                  size: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> register(String name, String email, String password) async {
    final bool registerSuccess = await controller.register(name, email, password);
    if (mounted) {
      if (registerSuccess) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
    return registerSuccess;
  }
}
