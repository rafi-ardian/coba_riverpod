import 'package:coba_riverpod/providers/fetch_characters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondPage extends ConsumerWidget {
  SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Characters List')),
      body: ref
          .watch(characterProvider)
          .maybeWhen(
            orElse: () => Center(child: Text('Something went wrong')),
            initial: () => Center(child: Text('Initial State')),
            fetching: () => Center(child: CircularProgressIndicator()),
            fetched:
                (characters) => ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return ListTile(
                      title: Text(character.name),
                      subtitle: Text(character.status),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                    );
                  },
                ),
            failed: (error) => Center(child: Text('Error: $error')),
          ),
    );
  }
}
