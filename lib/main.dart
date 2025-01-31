import 'package:flutter/material.dart';
import 'package:myapp/calculadora.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 2, 56),
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                //alignment: Alignment.center,
                //color: const Color.fromARGB(255, 255, 255, 255),
                //child: const Text('Layout superior'),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                // Changed Column to Row here
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceEvenly, // Added to space the containers
                children: [
                  Expanded(
                    child: Row(
                      //alignment: Alignment.center,
                      //color: const Color.fromARGB(255, 251, 251, 252),
                      //child: const Text('Primeira Coluna'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 216, 216),
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 3), //(x,y)
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Calculadora(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //alignment: Alignment.center,
                      //color: const Color.fromARGB(255, 255, 255, 255),
                      //child: const Text('Terceira Coluna'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                //alignment: Alignment.center,
                //color: const Color.fromARGB(255, 255, 255, 255),
                //child: const Text('Layout inferior'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
