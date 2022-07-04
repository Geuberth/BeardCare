import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beardcare/models/User.dart';

class Barber {
  String name;
  String description;
  int qualification = 0;

  Barber(this.name, this.description, this.qualification);
}

class BarberListPage extends StatefulWidget {
  const BarberListPage({Key? key}) : super(key: key);

  @override
  State<BarberListPage> createState() => _BarberListPageState();
}

class _BarberListPageState extends State<BarberListPage> {
  List<Barber> barbers = [
    Barber('Jhon', 'The new instinct', 5),
    Barber('Raul', 'Kiss my ass', 4),
    Barber('Ramiro', 'Gunpowder', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Consumer<User>(
            builder: (context, user, _) => Text(
                  'Barber List for ${user.username}',
                  style: const TextStyle(color: Colors.amber),
                )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: barbers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  semanticContainer: true,
                  child: InkWell(
                    splashColor: Colors.amber.withAlpha(90),
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                height: 80,
                                width: 70,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1655071516487-03bb9267b1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80')),
                            const SizedBox(
                              width: 15,
                              height: 80,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  barbers[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  barbers[index].description,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            (barbers[index].qualification > 0)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                            (barbers[index].qualification > 1)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                            (barbers[index].qualification > 2)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                            (barbers[index].qualification > 3)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                            (barbers[index].qualification > 4)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          BottomNavigationBar(
              backgroundColor: Colors.black87,
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  label: 'Shop',
                ),
              ]),
        ],
      ),
    );
  }
}
