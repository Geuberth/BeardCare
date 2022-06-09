import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Beard&Care'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(child:ListTile(
              title: Text(items[index]),
              subtitle: Text("Galarga"),
              leading: Image(image: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
              trailing: Icon(Icons.chat)));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState((){
            items.add('raul');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
