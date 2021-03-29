import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rest_api/models/transactions.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionsDB {
  String dbName;

  TransactionsDB({this.dbName});

  Future<Database> openDatabases() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocations = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocations);
    return db;
  }

  Future<int> insertData(Transactions statement) async {
    var db = await this.openDatabases();
    var stores = intMapStoreFactory.store('expense');
    var keyId = stores.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyId;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabases();
    var stores = intMapStoreFactory.store('expense');
    var snapshot = await stores.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List transactionList = List<Transactions>();
    for (var record in snapshot) {
      print(record["amount"].runtimeType);
      if (record["amount"].runtimeType == String) {
        transactionList.add(Transactions(
            title: record["title"],
            amount: double.parse(record["amount"]),
            date: DateTime.parse(record["date"])));
      } else {
        transactionList.add(Transactions(
            title: record["title"],
            amount: record["amount"],
            date: DateTime.parse(record["date"])));
      }
    }
    return transactionList;
  }

  Future<void> deleteData() async{
   final store = intMapStoreFactory.store('expense');
   var db = await this.openDatabases();
   await store.delete(db);
   db.close();
  }
}
