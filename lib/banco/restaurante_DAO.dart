
import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/usuario.dart';
import 'package:mimpedir/restaurante.dart';

class RestauranteDAO{

  static Future<void> Atualizar(int? cd, String? nome, String? lat, String? long, int? tipo) async{
    final db = await DatabaseHelper.getDsataBase();
    final resultado = await db.update('tb_restaurante'),
    {
      'nm_restaurante': nome,
      '_latitude_restaurante': lat,
      'longitude_restaurante': long,
      'cd_tipo': tipo
    },
      where: 'cd_restaurante = ?',
      shereArgs: [cd]
    );
  }

  static Future<Restaurante> listar(int? cd) async{
    final db = await DatabaseHelper.getDsataBase();
    final resultado = await db.query('tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [cd]
    );
    return Restaurante(
      codigo: resultado.first['cd_restaurante'] as int,
      nome: resultado.first['nm_restaurante'] as String,
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      proprietario: resultado.first['propritario_restaurante'] as String,
      tipoCulinaria: TipoDAO.listar(cd) as int
    );
  }

  static Future<void> excluir(Restaurante r ) async {
    final db = await DatabaseHelper.getDsataBase();
    final resultado = db.delete('tb_restaurante',
        where: 'cd_restaurante = ?',
        whereArgs: [r.codigo]
    );
  }
   static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDsataBase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_usuario = ?',
        whereArgs: [UsuarioDAO.usuarioLogado.codigo]
          );

    return resultado.map((mapa){
        return Restaurante(
          codigo:mapa['cd_restaurante'] as int,
          nome: mapa['nm_restaurante'] as String
        );
    }).toList();
  }

  static Future<int> cadastrarRestaurante(
      String? nome, String? latitude, String? longitude, int? tipo
      ) async{
    final db = await DatabaseHelper.getDsataBase();

    final dadosRestaurante = {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_resturante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuarioLogado.codigo
    };

    try{
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    }catch(e){
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }
}