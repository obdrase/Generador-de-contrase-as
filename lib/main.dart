import 'package:flutter/material.dart';
import 'package:contrasenas/views/widgets/Inicio.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Generador de contraseñas Aleatorias",
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
            ),
          ),
          centerTitle: true, 
          backgroundColor: Colors.blue,
        ),
        body: Inicio(), 
      ),
    );
  }
}