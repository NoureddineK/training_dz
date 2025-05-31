import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Signup App', theme: ThemeData(primarySwatch: Colors.green), home: SignupScreen());
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _acceptConditions = false;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Nom'),
                      validator: (value) => value!.isEmpty ? 'Veuillez entrer votre nom' : null,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) => value!.contains('@') ? null : 'Email invalide',
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) => value!.length < 6 ? 'Minimum 6 caractères' : null,
                    ),
                    CheckboxListTile(
                      title: Text('Accepter les conditions'),
                      value: _acceptConditions,
                      onChanged: (val) {
                        setState(() {
                          _acceptConditions = val!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && _acceptConditions) {
                          setState(() {
                            _submitted = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(name: _nameController.text)),
                          );
                        }
                      },
                      child: Text('Envoyer'),
                    ),
                  ],
                ),
              ),
              if (_submitted)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Résumé des données :', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Nom: ${_nameController.text}'),
                      Text('Email: ${_emailController.text}'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(child: Text('Bienvenue, $name !', style: TextStyle(fontSize: 24))),
    );
  }
}
