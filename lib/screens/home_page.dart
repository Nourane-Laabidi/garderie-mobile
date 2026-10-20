import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.child_care, size: 48),
                      SizedBox(height: 8),
                      Text(
                        'Ma Garderie',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Accueil'),
              ),
              const ListTile(
                leading: Icon(Icons.palette_outlined),
                title: Text('Activités'),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('À propos'),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.toys_outlined, size: 64, color: Colors.deepOrange),
              SizedBox(height: 16),
              Text(
                'Activités à la garderie',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Les activités proposées apparaîtront ici.'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Nouvelle activité',
        child: const Icon(Icons.add),
      ),
    );
  }
}
