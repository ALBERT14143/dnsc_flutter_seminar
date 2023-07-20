import 'package:flutter/material.dart';

class SampleStateful extends StatefulWidget{
  const SampleStateful({super.key});

  @override
  State<SampleStateful> createState() => _SampleStateful();
}

class _SampleStateful extends State<SampleStateful>{
  List<Color> colors = [const Color(0xff005d00), Colors.red, Colors.orange];
  Color? initColor;
  @override
  void initState() {
    initColor = colors[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: initColor,
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
                setState(() {
                  initColor = colors[1];
                });
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
                setState(() {
                  initColor = colors[0];
                });
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
                setState(() {
                  initColor = colors[2];
                });
              }, 
              child: Text("Orange", style: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.bold))
            ),
          )
        ],
      ),
    );
  }
}