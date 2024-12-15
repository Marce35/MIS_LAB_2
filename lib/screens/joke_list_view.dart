import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class JokeListView extends StatelessWidget {
  final String type;
  final ApiService apiService = ApiService();

  JokeListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$type Jokes',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            final jokes = snapshot.data ?? [];
            if (jokes.isEmpty) {
              return Center(
                child: Text(
                  'No jokes available for this category.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeCard(joke: jokes[index]); // Using the JokeCard widget
              },
            );
          }
        },
      ),
    );
  }
}