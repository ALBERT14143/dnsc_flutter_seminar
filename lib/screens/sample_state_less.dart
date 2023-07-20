import 'package:flutter/material.dart';

class SampleStateless extends StatelessWidget {
  const SampleStateless({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xff005d00),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(32),
                shape: const CircleBorder()
              ),
              onPressed: (){
          
              }, 
              child: Text("Red", style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff005d00),
                padding: const EdgeInsets.all(32),
                shape: const CircleBorder()
              ),
              onPressed: (){
          
              }, 
              child: Text("Green", style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.all(32),
                shape: const CircleBorder()
              ),
              onPressed: (){
          
              }, 
              child: Text("Orange", style: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.bold))
            ),
          )
        ],
      ),
    );
  }
}