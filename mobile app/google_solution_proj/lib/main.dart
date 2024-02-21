import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_solution_proj/controller/google_sign_in_provider.dart';
import 'package:google_solution_proj/controller/login_provider.dart';
import 'package:google_solution_proj/controller/signup/signup_provider.dart';
import 'package:google_solution_proj/view/pdf/pdf_view.dart';
import 'package:google_solution_proj/view/sign%20in/sign%20in_view.dart';
import 'package:google_solution_proj/view/sign%20up/sign_up_view.dart';
import 'package:google_solution_proj/view/sign%20up/widgets/stepper_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCEU2PGHbW3CXns1D_cH9CaIjsyIJcuDyk",
      projectId: "solutionproj-66a37",
      messagingSenderId: "1062444444444",
      appId: "1:1062444444444:web:3232323232323232323232",
    ),
  );
  runApp(MultiProvider(providers: [
    ListenableProvider(create: (context) => LoginProvider()),
    ListenableProvider(create: (context) => SignupProvider()),
    ListenableProvider(create: (context) => GoogleSignInProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignUpView(),
      theme: ThemeData(fontFamily: GoogleFonts.poppins().toString()),
      debugShowCheckedModeBanner: false,
    );
  }
}
