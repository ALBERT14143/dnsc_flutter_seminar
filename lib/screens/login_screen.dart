import 'package:flutter/material.dart';
import 'package:flutter_seminar/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 220,
                      child: Image.asset(
                        "assets/dnsc-logo-no-bg.png"
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "DAVAO DEL NORTE STATE COLLEGE",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 24,
                        color: const Color(0xff005d00)
                      )
                    ),
                    Text(
                      "INTEGRATED ACADEMIC INFORMATION MANAGEMENT SYSTEM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 12,
                        color: const Color(0xff005d00)
                      )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        prefixIcon: Icon(Icons.person)
                      ),
                    ),
                
                    const SizedBox(height: 16),
                
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.key)
                      ),
                    ),
                
                    const SizedBox(height: 24,),
                
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xff005d00)
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      }, 
                      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18),)
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}