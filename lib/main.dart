import 'package:flutter/material.dart';
import 'package:loginscreen/components/textfield.dart'; // Ensure this is correctly imported
import 'package:loginscreen/listview.dart'; // Ensure this is correctly imported

bool isObscure = true;
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,  // Form key should be set here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 90,
                child: Image.asset(
                  'icons/user.png',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              buildTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                controller: emailController,
              ),
              buildTextFormField(
                hintText: "Password",
                keyboardType: TextInputType.text,
                obscureText: isObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Please enter at least 6 characters";
                  }
                  return null;
                },
                controller: passwordController,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("Form is valid, navigating to ListViewExample");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListViewExample(),
                      ),
                    );
                  } else {
                    print("Form is not valid");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: const Size(150, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Not a Member?',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up Now',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
