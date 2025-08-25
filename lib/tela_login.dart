import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text("Tela de Login")),
          body: const Center(
            child: Text("Tela de Login"),
          ),
        );
      }
    }