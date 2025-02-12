import 'package:flutter/material.dart';
import 'package:app_vet/models/Pet.dart';
import 'package:app_vet/services/pet_service.dart';
import 'package:provider/provider.dart';

class EjemploCrudPets extends StatefulWidget {
  const EjemploCrudPets({super.key});

  @override
  State<EjemploCrudPets> createState() => _EjemploCrudPetsState();
}

class _EjemploCrudPetsState extends State<EjemploCrudPets> {
  List<Pet> pets = [];

  @override
  Widget build(BuildContext context) {
    final petService = Provider.of<PetService>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<void>(
                  future: petService.fetchPets(),
                  //future: _obtenerMascotas(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: petService.pets.length,
                        itemBuilder: (context, index) {
                          final pet = petService.pets[index];
                          return ListTile(
                            title: Text(pet.nombre),
                            subtitle: Text(pet.raza),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => {petService.deletePet("")},
                                ),
                              ],
                            ),
                          );
                        });
                  })),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/petinsert');
              },
              child: Text("Añadir Mascota")),
        ],
      ),
    );
  }
}
