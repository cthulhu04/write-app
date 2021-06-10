import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_app/config/config.dart';
import 'package:write_app/controllers/document_controller.dart';
import 'package:write_app/route.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DocumentController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Write app',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: Config.register,
    );
  }
}
