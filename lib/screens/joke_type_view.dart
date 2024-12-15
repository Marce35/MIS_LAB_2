import 'package:flutter/material.dart';

import '../services/api_services.dart';
import 'joke_list_view.dart';
import 'random_joke_view.dart';

class JokeTypeView extends StatelessWidget {
  final ApiService apiService = ApiService();

  JokeTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.question_answer, color: Colors.white),
          onPressed: () async {
            final joke = await ApiService.fetchRandomJoke();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RandomJokeView(joke: joke),
              ),
            );
          },
        ),
        title: const Text(
          'Joke Types',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<String>>(
        future: ApiService.fetchJokeTypes(),
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
            final jokeTypes = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    title: Text(
                      jokeTypes[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[700],
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward, color: Colors.teal),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JokeListView(type: jokeTypes[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}