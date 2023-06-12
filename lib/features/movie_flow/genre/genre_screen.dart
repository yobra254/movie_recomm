import 'package:flutter/material.dart';
import 'package:movie_recomm/core/constants.dart';
import 'package:movie_recomm/core/widgets/primary_button.dart';
import 'package:movie_recomm/features/movie_flow/genre/genre.dart';
import 'package:movie_recomm/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    required this.nextPage,
    required this.previousPage,
    super.key,
  });

  final VoidCallback previousPage;
  final VoidCallback nextPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horor'),
    Genre(name: 'Anime'),
    Genre(name: 'Drama'),
    Genre(name: 'Family'),
    Genre(name: 'Romance'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updateGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updateGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\s Start with genre',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: kMediumSpacing,
                  );
                },
              ),
            ),
            PrimaryButton(onPressed: widget.nextPage, text: 'Continue'),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
