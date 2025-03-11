import 'package:consulta_cep/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Anton'
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true,),
      color: Colors.amber,
      home: HomePage()
    );
  }
}