import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/joke.dart';
import '../widgets/jokecard.dart';

class JokeListScreen extends StatelessWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$type Jokes"),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No jokes'));
          } else {
            return ListView(
              children:
                  snapshot.data!.map((joke) => JokeCard(joke: joke)).toList(),
            );
          }
        },
      ),
    );
  }
}
