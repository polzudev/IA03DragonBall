import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final transformations = character['transformations'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(character['name'] ?? ''),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                character['image'] ?? '',
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (a, b, c) =>
                    const Icon(Icons.person, size: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character['name'] ?? '',
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _infoRow('Raça', character['race']),
                  _infoRow('Gènere', character['gender']),
                  _infoRow('Ki', character['ki']),
                  _infoRow('Ki màxim', character['maxKi']),
                  _infoRow('Afiliació', character['affiliation']),
                  const SizedBox(height: 12),
                  Text(
                    character['description'] ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  if (transformations.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      'Transformacions',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: transformations.length,
                        itemBuilder: (context, i) {
                          final t = transformations[i];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    t['image'] ?? '',
                                    width: 70,
                                    height: 90,
                                    fit: BoxFit.cover,
                                    errorBuilder: (a, b, c) =>
                                        const Icon(Icons.person, size: 70),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    t['name'] ?? '',
                                    style: const TextStyle(fontSize: 11),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value ?? '-')),
        ],
      ),
    );
  }
}
