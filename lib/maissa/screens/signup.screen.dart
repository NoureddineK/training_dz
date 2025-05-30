import 'package:flutter/material.dart';
import 'package:training_dz/maissa/main.dart';
import 'package:training_dz/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'maissa');
  final _emailController = TextEditingController(text: 'maissa@gmail.com');
  final _passwordController = TextEditingController(text: 'Maissa@67');
  final _confirmPasswordController = TextEditingController(text: 'Maissa@67');
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    const descTitle = 'Create an account, it\'s free';

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('InvestAI'),
            Image.network(
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              'https://static.vecteezy.com/system/resources/previews/047/656/219/non_2x/abstract-logo-design-for-any-corporate-brand-business-company-vector.jpg',
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(descTitle, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 39, 128, 176), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty || !value.contains('@')) {
                        return 'Entrez un email valide';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 39, 128, 176), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mot de passe obligatoire';
                      }
                      final passwordRegex = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\W).{8,}$';
                      if (!RegExp(passwordRegex).hasMatch(value)) {
                        return 'le format du mot de passe est incorrect';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                      ),
                      labelText: 'mot de passe',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 39, 128, 176), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mot de passe obligatoire';
                      }
                      final passwordRegex = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\W).{8,}$';
                      if (!RegExp(passwordRegex).hasMatch(value)) {
                        return 'le format du mot de passe est incorrect';
                      }
                      if (value != _passwordController.text) {
                        return 'La confirmation est incorrecte';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                      ),
                      labelText: 'Confirmation du mot de passe',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 39, 128, 176), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    },
                    child: const Text('sign up', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Text('Already have an account? LOGIN'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
