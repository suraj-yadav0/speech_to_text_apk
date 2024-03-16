import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Speech To Text"),
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 120,),
              const Text("Click on Mic to Record !"),
           const SizedBox(height: 20,),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  child: Icon(Icons.mic),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
