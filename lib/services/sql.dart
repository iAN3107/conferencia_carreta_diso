import 'package:conferencia_carreta_diso/services/sqlConfig.dart';
import 'package:sql_conn/sql_conn.dart';

class SQLServer {
  var connection = SqlConn.connect(
      ip: "192.168.10.219",
      //ip: "192.168.15.13",
      port: "1433",
      databaseName: "conferencia",
      username: "sa",
      password: retornaSenhaPrivada().return_senha());

  Future cadastraConferencia() async {

  }
}