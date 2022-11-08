import 'package:conferencia_carreta_diso/services/sqlConfig.dart';
import 'package:sql_conn/sql_conn.dart';

class SQLServer {
  var connection = SqlConn.connect(
      ip: ip(),
      port: "1433",
      databaseName: "conferencia",
      username: "sa",
      password: senha());

  Future<void> cadastraConferencia(
      conferente, separador, erro, turno, comentario) async {
    try {
      await connection;
      String periodo = 'Manha';
      if (turno == 1) {
        periodo = 'Tarde';
      }

      var now = new DateTime.now();
      String data = "${now.day}-${now.month}-${now.year}";
      String query =
          "INSERT INTO dados_conferencia VALUES ('$conferente','$separador', $erro, '$periodo', '$comentario', '$data')";
      var res = await SqlConn.writeData(query);
    } catch(e) {
      print('ierro sql');
      print(e);
    }
    }
  }