import 'package:app_vet/services/auth_service.dart';
import 'package:app_vet/ui/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:app_vet/ui/ui.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(imagen: "fondo_app_vet.png"),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(texto_logo: "Clínica Veterinaria"),
              SizedBox(
                height: 20,
              ),
              CustomTextInput(
                  label: "Usuario",
                  hint: "Introduce usuario",
                  filled: true,
                  controller: _userController),
              ElevatedButton(
                  onPressed: () {
                    if (_userController.text.length != 0) {
                      print("Usuario ingresado: ${_userController.text}");
                      Navigator.pushNamed(context, '/pets');
                    }
                  },
                  child: Text("ENTRAR"))
            ],
          ),
        ))
      ],
    ));
  }
}
