import 'package:flutter/foundation.dart';
import 'package:rest_api/databases/transactions_db.dart';
import '../models/transactions.dart';
class TransactionProviders with ChangeNotifier {
 List<Transactions> transactions = [
   // Transactions("ຫນັງສື", 50, DateTime.now()),
   // Transactions("book", 100, DateTime.now()),
   // Transactions("car", 1000, DateTime.now()),
   // Transactions("house", 5000, DateTime.now()),
 ];

 List<Transactions> getTransactions(){
   return transactions;
 }

 Future<void>initData() async{
   var db = TransactionsDB(dbName:"transactions.db");
   transactions = await db.loadAllData();
   notifyListeners();
 }
 void addTransactions(Transactions statement) async {
   var db = TransactionsDB(dbName:"transactions.db");
   await db.insertData(statement);

   // transactions.insert(0, statement);
   transactions = await db.loadAllData();
   notifyListeners();
 }

 void deleteTransaction() async {
   var db = TransactionsDB(dbName: "transactions.db");
   await db.deleteData();
   notifyListeners();
 }

}