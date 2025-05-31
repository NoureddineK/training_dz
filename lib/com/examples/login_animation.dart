import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(home: AnimatedLoginScreen()));

class AnimatedLoginScreen extends StatefulWidget {
  const AnimatedLoginScreen({super.key});

  @override
  State<AnimatedLoginScreen> createState() => _AnimatedLoginScreenState();
}

class _AnimatedLoginScreenState extends State<AnimatedLoginScreen> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _slideController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _slideController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);

    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      // 🌄 Background Image
      Positioned.fill(
        child: Image.network('https://cdn.pixabay.com/photo/2017/05/11/18/20/cool-2304975_1280.jpg', fit: BoxFit.cover),
      ),

      // 🧤 Background Overlay
      Positioned.fill(child: Container(color: Colors.black.withValues(alpha: 0.5))),

      // 🌟 Animated Content
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        Text(
                          "Crée tes applications avec\n ✨ FlutterDz ✨",
                          style: GoogleFonts.lato(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const TextField(
                            decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(labelText: 'Mot de passe', prefixIcon: Icon(Icons.lock)),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,

                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {},
                            child: const Text("Se connecter", style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                          const SizedBox(height: 16),

                          // 🔗 Forgot / Register links
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onHover: (value) {
                                  print('OnHover: $value');
                                },
                                onPressed: () {
                                  print('OnPressed Mot de passe oublié');
                                },
                                child: const Text("Mot de passe oublié ?"),
                              ),
                              TextButton(onPressed: () {}, child: const Text("S'inscrire")),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'https://flutterdz.fr',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                decorationStyle: TextDecorationStyle.solid,
                                decoration: TextDecoration.underline,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
