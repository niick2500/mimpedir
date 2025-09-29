import 'package:flutter/material.dart';

class TelaEditarRestaurante extends StatelessWidget{
  TelaEditarRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("Editar Restaurante")),
     body: Padding(padding: const EdgeInsets.all(30),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Informações do Restaurante: "),
           SizedBox(height: 40),
           TextFormField(
             decoration: const InputDecoration(hintText: 'Código do Restaurante'),
             validator:(String? value) {},
           ),
           TextFormField(
             decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
             validator:(String? value) {},
           ),
           SizedBox(height: 10),
           Text("Tipo de comida: "),
           DropdownButtonFormField(
               items: [
                 DropdownMenuItem(value: "Japonesa", child: Text("Japonesa")),
                 DropdownMenuItem(value: "Italiana", child: Text("Italiana")),
                 DropdownMenuItem(value: "Brasileira", child: Text("Brasileira")),
               ],
               onChanged: (value){}),
           TextFormField(
             decoration: const InputDecoration(hintText: 'Latitude'),
             validator:(String? value) {},
           ),
           TextFormField(
             decoration: const InputDecoration(hintText: 'Longitude'),
             validator:(String? value) {},
           ),
           SizedBox(height: 50),
           ElevatedButton(onPressed: (){}, child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.save),
               Text("Salvar Alterações")
             ],
           ))
         ],
       ),
     ),
   );
  }
}