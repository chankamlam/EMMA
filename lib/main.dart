import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.grey[850]!,
          ),
      home: const MyHomePage(title: 'Life Claim'),
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
  // set of files picked up
  final Set<PlatformFile> _files = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("POLICY NUMBER"),
                    const SizedBox(height: 10.0),
                    TextField(
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      enabled: false,
                      controller: TextEditingController(text: "PN-01-07-1997"),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CUSTOMER NAME"),
                    SizedBox(height: 10.0),
                    TextField(
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      // textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    )
                  ],
                ),
                const SizedBox(height: 30.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("DOCUMENT FILES"),
                    const SizedBox(height: 10.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _files.map((file) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 4.0),
                            child: Text(
                              file.name,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  // fontStyle: FontStyle.italic,
                                  color: Colors.blue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      ///////////////////////////
                      // pick up files
                      FilePicker.platform
                          .pickFiles(allowMultiple: true)
                          .then((result) {
                        setState(() {
                          if (result != null) {
                            result.files.toList().forEach((f) {
                              _files.add(f);
                            });
                          }
                        });
                      });
                      ///////////////////////////
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      /////////////////////////
                      /// validate form value

                      /// upload form to API through HTTP

                      /////////////////////////
                    },
                    child: const Icon(Icons.done),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
