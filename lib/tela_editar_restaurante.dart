import 'package:flutter/material.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';
class TelaEditarRestaurante extends StatelessWidget{
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEditarRestaurante();
  }

  class TelaEditarRestaurante extends State<TelaEditarRestaurante>{

    final TextEditingController cdController = TextEditingController();
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController latitudeContoller = TextEditingController();
    final TextEditingController longitudeController = TextEditingController();
    String? culinariaSelecionada;
    List<Tipo> tipoCulinaria = [];
    int? tipoCulinaria;
    int? codigo = TelaEditarRestaurante.restaurante.codigo as int;

    void initState(){
      super.initState();
      carregarTipos();
      cdController.text = TelaEditarRestaurante.restaurante.codigo.toString()!;
      nomeController.text = TelaEditarRestaurante.restaurante.nome!;
      latitudeContoller.text = TelaEditarRestaurante.restaurante.latitude;
      longitudeController.text = TelaEditarRestaurante.restaurante.longitude;
      tipoCulinariaController.text = TelaEditarRestaurante.restaurante.tipoCulinaria?.codigo!;
      culinariaSelecionada.text = TelaEditarRestaurante.restaurante.culinaria?.descricao;
    }
    Future<void> carregarTipos() async{

  }
  }

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
           Text('CÒDIGO'),
           TextFormField(
             decoration: const InputDecoration(hintText: 'CÒDIGO'),
             validator:(String? value){},
             controller: cdController,
             enabled: false,
           ),
           TextFormField(
             decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
             validator:(String? value) {},
           ),
           SizedBox(height: 10),
           Text("Tipo de comida: "),
           DropdownButtonFormField<String>(
              value: culinariaSelecionada,
               items: tipoCulinaria.map((tipo)
                  return DropdownMenuItem<String>(
                 value: tipo.descricao,
                 child: Text('"${tipo.descricao}')
               );

                 DropdownMenuItem(value: "Japonesa", child: Text("Japonesa")),
                 DropdownMenuItem(value: "Italiana", child: Text("Italiana")),
                 DropdownMenuItem(value: "Brasileira", child: Text("Brasileira")),
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