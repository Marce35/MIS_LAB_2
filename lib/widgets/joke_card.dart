import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/joke.dart';
import '../services/favourites_provider.dart';

// class JokeCard extends StatelessWidget {
//   final Joke joke;

//   const JokeCard({super.key, required this.joke});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//       elevation: 6,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               joke.setup,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal[800],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               joke.punchline,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class JokeCard extends StatelessWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure proper spacing
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    joke.setup,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    joke.punchline,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                favoritesProvider.isFavorite(joke) ? Icons.star : Icons.star_border,
                color: favoritesProvider.isFavorite(joke) ? Colors.yellow : Colors.grey,
              ),
              onPressed: () {
                if (favoritesProvider.isFavorite(joke)) {
                  favoritesProvider.removeFavorite(joke);
                } else {
                  favoritesProvider.addFavorite(joke);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


