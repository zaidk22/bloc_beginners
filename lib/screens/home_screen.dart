import 'package:bloc_beginner/screens/product_screen.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: TextButton(
        child: Text("Products"),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(),));
        },
      ),
    );
  }
}
