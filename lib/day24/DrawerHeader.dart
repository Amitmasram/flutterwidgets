import 'package:flutter/material.dart';

class DrawerHeaderEx extends StatelessWidget {
  const DrawerHeaderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Creative Drawer Header'),
        ),
        drawer: Drawer(
          child: DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                    radius: 30,
                  ),
                ),
                const Positioned(
                  top: 10,
                  left: 80,
                  child: Text(
                    'Flutter Enthusiast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 80,
                  child: Text(
                    'Awesome Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'flutter.dev@example.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on social icon
                    },
                    child: const Icon(
                      Icons.code,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}

///////////////////-------------------------///////////

class DrawerHeaderEx2 extends StatelessWidget {
  const DrawerHeaderEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Customized DrawerTheme'),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[900], // Dark background color
            textTheme: Theme.of(context).textTheme.copyWith(
                  // ignore: deprecated_member_use
                  headline6: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  // ignore: deprecated_member_use
                  subtitle2: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14.0,
                  ),
                ),
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.indigo],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/profile_picture.jpg'),
                        radius: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'john.doe@example.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    // Handle home tap
                  },
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    // Handle profile tap
                  },
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    // Handle settings tap
                  },
                ),
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
