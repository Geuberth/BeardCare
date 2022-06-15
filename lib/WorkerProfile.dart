import 'package:flutter/material.dart';

class WorkerProfile extends StatefulWidget {
  static String id = 'Login';
  const WorkerProfile({Key? key}) : super(key: key);

  @override
  State<WorkerProfile> createState() => _WorkerProfile();
}

Widget buildCard({String? path, String? selectedPath}) {
  return Container(
    width: 200,
    height: 200,
    color: Colors.black87,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (path != null)
          ClipRect(
              child: Image(
            image: NetworkImage(path),
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          )),
      ],
    ),
  );
}

class _WorkerProfile extends State<WorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beard&Care',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/LoginClient');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(
                    path:
                        'https://images.unsplash.com/photo-1654789460791-74c79093c37e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                const SizedBox(
                  width: 4,
                ),
                buildCard(),
                const SizedBox(width: 4),
                buildCard(),
                const SizedBox(width: 4),
                buildCard(),
                const SizedBox(width: 4)
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text('Danny Peluquero',
                  style: TextStyle(
                      fontFamily: 'CrimsonText',
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ],
          ),
          Row(
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image(
                  image: AssetImage('Assets/LogoBeard.png'),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(border: Border.all(width: 0.5)),
                height: 150,
                width: 255,
                child: Text('Agregar la descripcion recibida en el worker_form',
                    style: TextStyle(fontSize: 16, fontFamily: 'CrimsonText')),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SafeArea(
            child: Center(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  height: 330,
                  width: 400,
                  child: Text(
                      'Agregar los precios referenciados del worker_screen_form')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Cotizar',style: TextStyle(fontSize: 18, fontFamily: 'CrimsonText',color: Colors.black87,fontWeight: FontWeight.bold),),
                ),
              ),
              InkWell(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Pagar',style: TextStyle(fontSize: 18, fontFamily: 'CrimsonText',color: Colors.black87,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
