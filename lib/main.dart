import 'package:app_vet/screens/screens.dart';
import 'package:app_vet/providers/providers.dart';
import 'package:app_vet/services/pet_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*void main() {
  runApp(const MyApp());
}*/

void main() {
  runApp(
    MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => AuthService()), // Proveedor del servicio de autenticación
        ChangeNotifierProvider(create: (_) => PetService()),
        ChangeNotifierProvider(create: (_) => PetProvider()) //
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Vet',
      initialRoute: '/ejemplo',
      routes: {
        '/login': (context) => LoginScreen(),
        '/pets': (context) => PetsScreen(),
        '/vaccination': (context) => VaccinationScreen(),
        '/ejemplo': (context) => EjemploCrudPets(),
        '/petinsert': (context) => PetInsertForm()
      },
    );
  }
}

/*
  home: AuthWrapper()
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return authService.isLoggedIn ? HomeScreen() : LoginScreen();
  }
}
*/
