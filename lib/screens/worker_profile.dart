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
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
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
    return SafeArea(
      child: Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Danny Peluquero',
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      height: 150,
                      width: 255,
                      child: const Text(
                          'Agregar la descripcion recibida en el worker_form',
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'CrimsonText')),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.5)),
                            child: const Text(
                                'Agregar los precios referenciados del worker_screen_form'))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Cotizar',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'CrimsonText',
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Pagar',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'CrimsonText',
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
