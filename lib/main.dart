import 'package:flutter/material.dart';
import 'package:mt_box/providers/register_provider.dart';
import 'package:mt_box/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MTBox());
}

class MTBox extends StatelessWidget {
  const MTBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const RegisterScreen(),
      ),
    );
  }
}
