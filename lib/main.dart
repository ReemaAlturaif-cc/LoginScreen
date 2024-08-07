import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

bool isSecured = true;

Map<String, User> users = {
  "Reema00@gmail.com": User(email: 'Reema00@gmail.com', password: '12345'),
  "LLoo1@gmail.com": User(email: 'LLoo1@gmail.com', password: '12345'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 109, 160, 152),
        centerTitle: true,
        title: const Text(
          "Login Screen",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/loginPic.webp',
              width: 400,
              height: 230,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailContrller,
                    decoration: const InputDecoration(
                        label: Text('Enter Email'),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordContrller,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                        label: Text('Enter Password'),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isSecured = !isSecured;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      User user = users[emailContrller.text]!;

                      if (user.email == emailContrller.text &&
                          user.password == passwordContrller.text) {
                        print("successfully logged in");
                      } else {
                        print('wrong password or email');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(
                        15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 53, 71, 69),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(width: 5),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
