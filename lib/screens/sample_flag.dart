import 'package:flutter/material.dart';

class SampleFlag extends StatelessWidget{
  const SampleFlag({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 50,
                child: Row(
                  children: [
                    Flexible(
                      flex: 50,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Flexible(
                      flex: 50,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Flexible(
                      flex: 50,
                      child: Container(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ),
              Flexible(
                flex: 50,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Flexible(
                flex:   50,
                child: Flexible(
                  flex: 50,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 50,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        flex: 50,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      Flexible(
                        flex: 50,
                        child: Container(
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}