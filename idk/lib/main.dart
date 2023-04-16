import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:idk/encriptacion/Texts/my_custom_text.dart';
import 'package:idk/encriptacion/encriptacion.dart';
import 'package:idk/providers/encriptacion.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordsProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter TextField Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String value = '';
  TextEditingController password = TextEditingController();
  final myTexts = texts;
  var key = "null";
  String? des, en;

  void onPressedButton2() {
    // Acción del segundo botón
    print('Has pulsado : ${myTexts["Desen"]!}');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PasswordsProvider>(context);

    void onPressedButton1() {
      setState(() {
        provider.getHash(encrypt(password.text.trim()));
      });
      print('Has pulsado : ${myTexts["En"]!}');
      print(provider.hash);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TextField Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
                controller: password,
                onSubmitted: (value) {
                  provider.getPassword(value);
                }),
            ElevatedButton(
              onPressed: onPressedButton1,
              child: Text(myTexts["En"]!),
            ),
            ElevatedButton(
              onPressed: onPressedButton2,
              child: Text(myTexts["Desen"]!),
            ),
            Text(
              '${myTexts["Pass"]!} : ${key}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
