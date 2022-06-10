import 'package:flutter/material.dart';
import 'animatedbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beard&Care',
      theme: ThemeData(
        primaryColor: Colors.amber,
        //colorScheme: ColorScheme(primary: ,secondary: ,error: ,background: ,brightness: ,onPrimary: ,onSecondary: ,onSurface: ,onError: ),
      ),
      initialRoute: ChooseScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        ChooseScreen.id: (context) => ChooseScreen()
      },
      home: const LoginScreen(),
    );
  }
}

class ChooseScreen extends StatefulWidget {
  static String id = 'Choose';
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  bool isPressed = false;
  bool isPressed1 = false;
  void buttonPressed() {
    setState(() {
      isPressed = true;
    });
  }

  void buttonPressed1() {
    setState(() {
      if (isPressed1 == false) {
        isPressed1 = true;
      } else if (isPressed1 == true) {
        isPressed1 = false;
      }
    });
  }

  void redirectPerson() {
    if (isPressed == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    setState(() {
      isPressed = false;
    });
  }

  void redirectBarber() {
    if (isPressed1 == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    setState(() {
      isPressed1 = false;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeuBotton(
                onTap: buttonPressed,
                onTap1: buttonPressed1,
                redirectP: redirectPerson,
                redirectB: redirectBarber,
                isPressed: isPressed,
                isPressed1: isPressed1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// definition of the widget Login screen
class LoginScreen extends StatefulWidget {
  static String id = 'Login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Login screen
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/beardL.png',
                height: 300,
              ),
              SizedBox(
                height: 5,
              ),
              userTextField(),
              SizedBox(
                height: 6,
              ),
              passwordTextField(),
              SizedBox(
                height: 20,
              ),
              bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Example@gmail.com',
            labelText: 'Email',
          ),
/*              onChanged: (value){
              },*/
        ),
      );
    });
  }

  Widget passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: const TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Password',
            labelText: 'Password',
          ),
/*              onChanged: (value){
              },*/
        ),
      );
    });
  }

  Widget bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 17),
          child: Text('Log in'),
        ),
      );
    });
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
          return Card(
              child: ListTile(
                  title: Text(items[index]),
                  subtitle: Text("Galarga"),
                  leading: Image(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  trailing: Icon(Icons.chat)));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add('raul');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
