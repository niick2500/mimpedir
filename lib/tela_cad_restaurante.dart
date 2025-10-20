    import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
    import 'package:mimpedir/banco/tipo_DAO.dart';
    import 'package:mimpedir/tipo.dart';

    class TelaCadRestaurante extends StatefulWidget{
      @override
      State<StatefulWidget> createState() {
      return TelaCadRestauranteState();
      }
      }

      class TelaCadRestauranteState extends State<TelaCadRestaurante>{

      final TextEditingController nomeController = TextEditingController();
      final TextEditingController latitudeController = TextEditingController();
      final TextEditingController longitudeController = TextEditingController();
      String? culinariaSelecionada;
      List<Tipo> tiposCulinaria = [];
      int? tipoCulinaria;

      void initState(){
      super.initState();
      carregarTipos();
      }

      Future<void> carregarTipos() async{
      final lista = await TipoDAO.listarTipos();
      setState(() {
      tiposCulinaria = lista;
      });
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text("Cadastro Restaurante")),
          body: Padding(padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Informações do Restaurante: "),
                SizedBox(height: 40),
                Text("Tipo de comida: "),
              DropdownButtonFormField<String>(
                  value: culinariaSelecionada,
                  items: tiposCulinaria.map((tipo) {
                    return DropdownMenuItem<String>(
                        value: tipo.descricao,
                        child: Text("${tipo.descricao}")
                    );
                  }).toList(),
                    onChanged: (value){
                    culinariaSelecionada = value;
                    Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                        (tipo) => tipo.descricao == value,
                    );
                    tipoCulinaria = tipoSelecionado.codigo;
                    }
                    ),

                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
                  validator:(String? value) {},
                  controller: nomeController,
                ),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Latitude'),
                    validator:(String? value) {},
                  controller: latitudeController,
                ),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Longitude'),
                    validator:(String? value) {},
                  controller: longitudeController,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () async{
                      final sucesso = await RestauranteDAO.cadastrarRestaurante(
                          nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
                      String msg = 'Erro: não cadastrado. verifique os dados.';
                      Color corFundo = Colors.red;

                      if(sucesso > 0){
                        msg = '"${nomeController.text}" cadastrado com sucesso! ID: $sucesso';
                        corFundo = Colors.green;
                        }
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(msg),
                            backgroundColor: corFundo,
                            duration: Duration(seconds: 5),
                          )
                      );

                      },
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    Text("Cadrastar")
                  ],
                ))
              ],
            ),
          ),
        );
      }
    }