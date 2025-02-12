import 'package:app_vet/providers/pet_provider.dart';
import 'package:app_vet/services/pet_service.dart';
import 'package:flutter/material.dart';
import 'package:app_vet/ui/custom_text_input.dart';
import 'package:provider/provider.dart';
import 'package:app_vet/models/Pet.dart';

class PetInsertForm extends StatefulWidget {
  const PetInsertForm({super.key});

  @override
  State<PetInsertForm> createState() => _PetInsertFormState();
}

class _PetInsertFormState extends State<PetInsertForm> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _addPet(BuildContext context) async {
    final petProvider = Provider.of<PetProvider>(context, listen: false);
    final petService = Provider.of<PetService>(context, listen: false);

    _formKey.currentState!.save(); // activa el método onSaved
    final nuevaMascota = Pet(
      id: "", // Firebase asignará un ID automáticamente
      chip: petProvider.chip,
      tipo: petProvider.tipo,
      raza: petProvider.raza,
      nombre: petProvider.nombre,
      peso: petProvider.peso,
      idPropietario: petProvider.idPropietario,
      fechaNacimiento: petProvider.fechaNacimiento,
      observaciones: petProvider.observaciones,
    );
    try {
      await petService
          .createPet(nuevaMascota); // Llama al servicio para subir a Firebase
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mascota guardada exitosamente")),
      );
      Navigator.pop(context); // Regresa a la pantalla anterior
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al guardar la mascota: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context, listen: false);

    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextInput(
                      controller: TextEditingController(),
                      label: "Propietario",
                      hint: "Introduce el propietario",
                      onSaved: (value) =>
                          petProvider.setIdPropietario(value ?? ""),
                      validator: (value) => null),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                    controller: TextEditingController(),
                    label: "Chip",
                    hint: "Ingrese el Chip",
                    onChanged: (value) => petProvider.setChip(value),
                    onSaved: (value) => petProvider.setChip(value ?? ""),
                    validator: (value) =>
                        value!.isEmpty ? "El chip es obligatorio" : null,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                    controller: TextEditingController(),
                    label: "Tipo",
                    hint: "Ingresa el tipo de animal",
                    onChanged: (value) => petProvider.setTipo(value),
                    onSaved: (value) => petProvider.setTipo(value ?? ""),
                    validator: (value) =>
                        value!.isEmpty ? "El tipo es obligatorio" : null,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                    controller: TextEditingController(),
                    label: "Raza",
                    hint: "Ingresa la raza",
                    onChanged: (value) => petProvider.setRaza(value),
                    onSaved: (value) => petProvider.setRaza(value ?? ""),
                    validator: (value) =>
                        value!.isEmpty ? "La raza es obligatorio" : null,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                    controller: TextEditingController(),
                    label: "Nombre",
                    hint: "Ingrese el nombre de la mascota",
                    onSaved: (value) => petProvider.setNombre(value ?? ""),
                    validator: (value) =>
                        value!.isEmpty ? "El nombre es obligatorio" : null,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                      controller: TextEditingController(),
                      label: "Peso",
                      keyboardType: TextInputType.number,
                      hint: "Peso de la mascota",
                      onSaved: (value) => petProvider.setPeso(value ?? ""),
                      validator: (value) => null),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextInput(
                      controller: TextEditingController(),
                      label: "Observaciones",
                      hint: "Introduce las observaciones",
                      onSaved: (value) =>
                          petProvider.setObservaciones(value ?? ""),
                      validator: (value) => null),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addPet(context);
                        }
                      },
                      child: Text("Guardar Mascota"))
                ],
              ))),
    );
  }
}
