import 'package:flutter/material.dart';
import 'package:lab2_flutter/services/favourites_provider.dart';
import 'package:provider/provider.dart';

// class FavoriteJokesView extends StatelessWidget {
//   const FavoriteJokesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = Provider.of<FavoritesProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Favorite Jokes',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: favoritesProvider.favorites.isEmpty
//           ? Center(
//               child: Text(
//                 'No favorite jokes yet.',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(10.0),
//               itemCount: favoritesProvider.favorites.length,
//               itemBuilder: (context, index) {
//                 final joke = favoritesProvider.favorites[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                   elevation: 4,
//                   child: ListTile(
//                     title: Text(
//                       joke.setup,
//                       style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }



import '../widgets/joke_card.dart';

class FavoriteJokesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Jokes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? Center(
              child: Text(
                'No favorite jokes yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                return JokeCard(joke: favoritesProvider.favorites[index]);
              },
            ),
    );
  }
}