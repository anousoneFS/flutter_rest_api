import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/models/lek_laos_info.dart';
import 'package:rest_api/pages/covid19.dart';
import 'package:rest_api/pages/covid19_1.dart';
import 'package:rest_api/pages/home_data.dart';
import 'package:rest_api/pages/home_data1.dart';
import 'package:rest_api/pages/home_page.dart';
import 'package:rest_api/providers/transaction_providers.dart';
import 'pages/lek_laos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TransactionProviders();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FinalCovid(),
      ),
    );
  }
}
