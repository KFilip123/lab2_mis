import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeCard extends StatelessWidget {
  final Joke joke;

  JokeCard({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(joke.setup, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(joke.punchline),
      ),
    );
  }
}
