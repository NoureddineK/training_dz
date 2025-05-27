import 'package:flutter/material.dart';
import 'package:training_dz/tayeb_work/screens/dashboard.screen.dart';
// import 'package:flutter_login/flutter_login.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late bool isVisible;
  late bool isChecked;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "email@email.com");
  final _nameController = TextEditingController(text: "tayeb");
  final _passwordController = TextEditingController(text: "1254639782");

  @override
  void initState() {
    isVisible = false;
    isChecked = false;
    super.initState();
  }

  void updateVisibility() => setState(() {
    isVisible = !isVisible;
  });

  void updateCheck() => setState(() {
    isChecked = !isChecked;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/login_image.JPG"), fit: BoxFit.cover, opacity: 0.5),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 9, 39, 0),
                  ),
                ),
              ),

              SizedBox(height: 100),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter you full name.";
                          }
                          if (value.length < 3) {
                            return "Must be at least 3 letters";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "John Doe",
                          labelText: "Name",
                          icon: Icon(Icons.person_4_outlined),
                          iconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 3, 134, 241)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter you Email.";
                          }
                          // if (!value.contains("@") == true) {
                          //   return "Please enter a valid Email";
                          // }
                          if (RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                              ).hasMatch(value) ==
                              false) {
                            return "Please enter a valid Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "example@email.com",
                          labelText: "Email",
                          icon: Icon(Icons.email_outlined),
                          iconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 3, 134, 241)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password.";
                          }
                          if (value.length < 8) {
                            return "Must be at least 8 characters";
                          }

                          // if (!RegExp(r'^(?=.*?[A-Z])$').hasMatch(value)) {
                          //   return "Must contain at least one upper case";
                          // }
                          // if (!RegExp(r'^(?=.*?[a-z])$').hasMatch(value)) {
                          //   return "Must contain at least one lower case";
                          // }
                          // if (!RegExp(r'^(?=.*?[0-9])$').hasMatch(value)) {
                          //   return "Must contain at least one digit";
                          // }
                          // if (!RegExp(r'^(?=.*?[!@#\$&*~])$').hasMatch(value)) {
                          //   return "Must contain at least one special character";
                          // }
                          return null;
                        },
                        obscureText: !isVisible,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: IconButton(
                              hoverColor: Colors.amber[1],
                              onPressed: updateVisibility,
                              icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "*********",
                          labelText: "Password",
                          icon: Icon(Icons.lock_outlined),
                          iconColor: Colors.black,

                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 3, 134, 241)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.black,
                          value: isChecked,
                          onChanged: (bool? value) {
                            updateCheck();
                          },
                          fillColor: WidgetStatePropertyAll(const Color.fromARGB(255, 252, 250, 250)),
                        ),

                        Text(
                          "I agree to terms and conditions.",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),

              ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 7, 106, 187))),
                onPressed: () {
                  if (_formKey.currentState!.validate() && isChecked) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(title: "Dashboard", name: _nameController.text),
                      ),
                    );
                  }
                },
                label: Text("Submit", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                icon: Icon(Icons.login_sharp, color: Colors.white, weight: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
