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
      body:  Align(
        child:  Column(
        
         // mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
           const   Spacer(),
         const    Text("Click on Mic to Record !"),
        
         const    Spacer(),
        
            InkWell(
              onTap: (){},
              child: const  CircleAvatar(child: Icon(Icons.mic),
              ),
            ),
        
         const    Spacer()
            ],
        ),
      ),
    );
  }
}
