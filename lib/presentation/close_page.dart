import 'package:flutter/material.dart';

class Close extends StatefulWidget {
  const Close({super.key});

  @override
  State<Close> createState() => _CloseState();
}

class _CloseState extends State<Close> {
  bool isLocked = true;
  Color bodyColor = Colors.grey[900]!;
  Color centerColor = Colors.black;
  Color endColor = Colors.black;
  String buttonText = 'Unlock';
  String imagePath = 'assets/close.png';
  double height = 200;
  String data = '';
  Duration animationDuration = const Duration(milliseconds: 300);
  Key _scaffoldKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: bodyColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              bodyColor, // Un color oscuro para la parte superior
              centerColor,
              centerColor, // Un color ligeramente más claro para el medio
              endColor
            ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Hero(
                  tag: 'zoomImage',
                  child: Image.asset(
                    imagePath,
                    height: height,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 150,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(46, 48, 52, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        _scaffoldKey = UniqueKey();
                        isLocked = !isLocked; // Cambiar el estado

                        // Cambiar las propiedades según el estado
                        if (isLocked) {
                          bodyColor = Colors.grey[900]!;
                          centerColor = Colors.black;
                          endColor = Colors.black;
                          buttonText = 'Unlock';
                          imagePath = 'assets/close.png';
                          height = 200;
                          data = '';
                        } else {
                          bodyColor = Color(0xFF1c1c1e);
                          centerColor = Color(0xFF2d2d30);
                          endColor = Color(0xFF3e3e42);
                          // O cualquier otro color que quieras usar
                          buttonText = 'Lock';
                          imagePath =
                              'assets/open.png'; // Asegúrate de tener esta imagen
                          height = 250;
                        }
                      });
                      if (!isLocked) {
                        Future.delayed(Duration(milliseconds: 500), () {
                          setState(() {
                            data = 'Model 3';
                            imagePath =
                                'assets/zoom.png'; // Esta es tu imagen normal
                          });
                          height = 300;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Unlock',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 239),
                              shape: BoxShape.circle),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(58, 60, 65, 1.0),
                                shape: BoxShape.circle),
                            child: Icon(
                              isLocked ? Icons.lock : Icons.lock_open,
                              color: Color.fromRGBO(119, 217, 231, 1.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
