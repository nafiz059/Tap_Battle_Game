import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redscore = 50;
  int bluescore = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
              child: Text(
            "Tap Battle Game",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redscore,
                  child: InkWell(
                    onTap: redscoreupdate,
                    child: Container(
                      // height: double.infinity,
                      width: double.infinity,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  flex: bluescore,
                  child: InkWell(
                    onTap: bluescoreupdate,
                    child: Container(
                      width: double.infinity,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            redscore >= 100 || bluescore >= 100
                ? Container(
                    color: Colors.purple.withOpacity(0.7),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${redscore >= 100 ? "Red" : "Blue"} Won!",
                            style: const TextStyle(fontSize: 50.0),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bluescore = 50;
                                redscore = 50;
                              });
                            },
                            child: const Text("Reset Game!"),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void bluescoreupdate() {
    setState(() {
      bluescore += 1;
      redscore -= 1;
    });
  }

  void redscoreupdate() {
    setState(() {
      redscore += 1;
      bluescore -= 1;
    });
  }
}
