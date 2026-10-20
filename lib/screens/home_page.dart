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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDestination = 0;

  void _selectDestination(int index) {
    setState(() => _selectedDestination = index);
    Navigator.of(context).pop();
  }

  void _showNewActivityMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Nouvelle activité')),
      );
  }

  void _showActivityMessage(String title) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(title)));
  }

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
              _DrawerDestination(
                selected: _selectedDestination == 0,
                leading: Icon(Icons.home_outlined),
                title: 'Accueil',
                onTap: () => _selectDestination(0),
              ),
              _DrawerDestination(
                selected: _selectedDestination == 1,
                leading: Icon(Icons.palette_outlined),
                title: 'Activités',
                onTap: () => _selectDestination(1),
              ),
              _DrawerDestination(
                selected: _selectedDestination == 2,
                leading: Icon(Icons.info_outline),
                title: 'À propos',
                onTap: () => _selectDestination(2),
              ),
            ],
          ),
        ),
      ),
      body: _selectedDestination == 2
          ? _buildAboutPage(context)
          : _buildActivitiesPage(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNewActivityMessage,
        tooltip: 'Nouvelle activité',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildActivitiesPage(BuildContext context) {
    final heading = _selectedDestination == 0
        ? 'Activités à la garderie'
        : 'Toutes les activités';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
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
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  elevation: 1,
                  child: ListTile(
                    key: ValueKey(activity.id),
                    onTap: () => _showActivityMessage(activity.titre),
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
    );
  }

  Widget _buildAboutPage(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.child_care,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'À propos de Ma Garderie',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Une application pour découvrir les activités '
              'éducatives et ludiques de la garderie.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerDestination extends StatelessWidget {
  const _DrawerDestination({
    required this.selected,
    required this.leading,
    required this.title,
    required this.onTap,
  });

  final bool selected;
  final Widget leading;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      leading: leading,
      title: Text(title),
      onTap: onTap,
    );
  }
}
