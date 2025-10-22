import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import 'package:mimpedir/tela_editar_restaurante.dart';
import 'package:mimpedir/restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome>{
  List<Restaurante> restaurantes = [];

  @override
void initState(){
  super.initState();
  carregarRestaurantes();
}


  Future<void> carregarRestaurantes() async{
    final lista = await RestauranteDAO.listarTodos();
        setState(() {
          restaurantes = lista;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Restaurantes'),
        actions: [
          TextButton(
              onPressed: () async{
                final t = Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
                if(t == false || t == null){
                   setState(() {
                     carregarRestaurantes();
                   });
                }
          },
          child: Icon(Icons.add)
          )
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index){
            final r = restaurantes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit,color: Colors.blue),
                      onPressed: () async{
                        TelaEditarRestaurante.restaurante = await RestauranteDAO.listar(r.codigo);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditarRestaurante()));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                          title: Text('ATENÇÂO!'),
                          content: Text('Confirmar exclusão?'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                           },child: Text('cancelar')),
                            TextButton(onPressed: (){
                              RestauranteDAO.excluir(r);
                              setState(() {
                                carregarRestaurantes();
                              });
                              Navigator.pop(context);
                              },child: Text('sim')),
                              ],
                            )
                          );
                        },
                      ),
                    ],
                  ),
                ),
          );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            final t = Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
            if(t == false || t == null){
              setState(() {
                carregarRestaurantes();
              });
            }
          },
          child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar')
          ],
      ),
    );
  }
}

