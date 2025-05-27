import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    _counter = 999;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        actions: [Icon(Icons.clear), Text('Delete')],
        leading: Text('Leading'),
        leadingWidth: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Slider(value: 0.5, onChanged: (value) => _incrementCounter),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(color: Colors.red, width: 100, child: Text('r')),

            //     const Text('Hello Row'),
            //     const Text('Counter Row '),
            //     Container(color: Colors.green, width: 100, child: Text('r')),
            //   ],
            // ),
            // const Text('Hello '),

            // const Text('Counter: '),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: GestureDetector(
                onTap: _incrementCounter,
                child: Image.network(
                  fit: BoxFit.contain,
                  width: 400,
                  height: 600,
                  "https://flutterdz.fr/wp-content/uploads/2024/07/Formation-Flutter-5-576x1024.png",
                ),
              ),
            ),
            Positioned(top: 70, left: 150, child: Text('Hello there')),
            Text('$_counter', style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              // onTap: _incrementCounter,
              onLongPress: _incrementCounter,
              onDoubleTap: _incrementCounter,
              child: Text('Increment', style: TextStyle(fontSize: 40, color: Colors.blue)),
            ),
            IconButton(onPressed: _incrementCounter, icon: Icon(Icons.add)),
            FilledButton(onPressed: _incrementCounter, child: Text('FilledButton', style: GoogleFonts.getFont('Lato'))),
            TextButton(onPressed: _incrementCounter, child: Text('TextButton')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.chat),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
