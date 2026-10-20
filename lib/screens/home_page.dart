import 'package:flutter/material.dart';

class GarderieActivity {
  const GarderieActivity({
    required this.id,
    required this.titre,
    required this.description,
    required this.icone,
  });

  final int id;
  final String titre;
  final String description;
  final String icone;
}

const activities = [
  GarderieActivity(
    id: 1,
    titre: 'Dessin et coloriage',
    description: 'Développement de la créativité',
    icone: '🎨',
  ),
  GarderieActivity(
    id: 2,
    titre: 'Jeux éducatifs',
    description: 'Apprentissage par le jeu',
    icone: '🧩',
  ),
  GarderieActivity(
    id: 3,
    titre: 'Musique et chansons',
    description: 'Éveil musical des enfants',
    icone: '🎵',
  ),
  GarderieActivity(
    id: 4,
    titre: 'Lecture de contes',
    description: 'Découverte des histoires',
    icone: '📚',
  ),
  GarderieActivity(
    id: 5,
    titre: 'Activités sportives',
    description: 'Développement de la motricité',
    icone: '⚽',
  ),
];

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activités à la garderie',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Des moments pour apprendre et grandir ensemble.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: activities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Card(
                    elevation: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        child: Text(
                          activity.icone,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      title: Text(
                        activity.titre,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(activity.description),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
