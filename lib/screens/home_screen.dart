import 'package:flutter/material.dart';
import 'package:flutter_seminar/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  
  List<String> students = ["Albert M. Catorsi", "Juan dela Cruz", "Paul Eric Pancho", "John Doe"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/dnsc-logo-no-bg.png"
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "DAVAO DEL NORTE STATE COLLEGE",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        color: const Color(0xff005d00)
                      )
                    ),
                    Text(
                      "INTEGRATED ACADEMIC INFORMATION MANAGEMENT SYSTEM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 8,
                        color: const Color(0xff005d00)
                      )
                    ),
                    const SizedBox(height: 24,),
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: const Color(0xff005d00)
                        ),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        }, 
                        child: const Text("Logout", style: TextStyle(color: Colors.white),)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                leading: CircleAvatar(
                  child: Text(students[index][0]),
                ),
                title: Text(students[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}