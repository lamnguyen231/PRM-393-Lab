import 'package:flutter/material.dart';

void main() {
  // Entry point for DartPad, Android Studio, VS Code, and Flutter CLI runs.
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp gives the lab screen a theme, navigation shell, and app title.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 6 - Responsive Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE50914),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF111217),
      ),
      home: const GenreScreen(),
    );
  }
}

// Simple model used by the UI. No backend is needed for this lab demo.
class Movie {
  const Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });

  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;
}

// Sample movie data keeps the lab fully runnable from one file.
const List<Movie> allMovies = [
  Movie(
    title: 'Starlight Chase',
    year: 2025,
    genres: ['Action', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/starlight/500/700',
    rating: 4.8,
  ),
  Movie(
    title: 'The Last Letter',
    year: 2022,
    genres: ['Drama', 'Romance'],
    posterUrl: 'https://picsum.photos/seed/letter/500/700',
    rating: 4.4,
  ),
  Movie(
    title: 'Laugh Track Heroes',
    year: 2021,
    genres: ['Comedy', 'Family'],
    posterUrl: 'https://picsum.photos/seed/laugh/500/700',
    rating: 4.1,
  ),
  Movie(
    title: 'Midnight Cipher',
    year: 2024,
    genres: ['Thriller', 'Mystery'],
    posterUrl: 'https://picsum.photos/seed/cipher/500/700',
    rating: 4.7,
  ),
  Movie(
    title: 'Wild Horizon',
    year: 2020,
    genres: ['Adventure', 'Action'],
    posterUrl: 'https://picsum.photos/seed/horizon/500/700',
    rating: 4.3,
  ),
  Movie(
    title: 'Kitchen Galaxy',
    year: 2023,
    genres: ['Comedy', 'Sci-Fi'],
    posterUrl: 'https://picsum.photos/seed/kitchen/500/700',
    rating: 4.5,
  ),
];

const List<String> movieGenres = [
  'Action',
  'Adventure',
  'Comedy',
  'Drama',
  'Family',
  'Mystery',
  'Romance',
  'Sci-Fi',
  'Thriller',
];

const List<String> sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  String selectedSort = 'A-Z';
  final Set<String> selectedGenres = {};
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery reads the full device/window width for page-level decisions.
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isWideScreen = screenSize.width >= 800;
    final List<Movie> visibleMovies = _visibleMovies();

    return Scaffold(
      body: SafeArea(
        // SafeArea keeps content away from notches, system bars, and cutouts.
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 32 : 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lab 6.1: Hero heading changes spacing and layout on wider screens.
              _HeroHeading(
                isWideScreen: isWideScreen,
                movieCount: visibleMovies.length,
              ),
              const SizedBox(height: 18),

              // Lab 6.2: Search, responsive genre chips, selected badge, and sort.
              _SearchAndFilterPanel(
                searchController: searchController,
                searchQuery: searchQuery,
                selectedGenres: selectedGenres,
                selectedSort: selectedSort,
                onSearchChanged: (value) {
                  setState(() => searchQuery = value);
                },
                onGenreTapped: _toggleGenre,
                onSortChanged: (value) {
                  if (value != null) {
                    setState(() => selectedSort = value);
                  }
                },
                onClearFilters: _clearFilters,
              ),
              const SizedBox(height: 16),

              // Expanded gives the movie list all remaining vertical space.
              Expanded(
                // Lab 6.3: LayoutBuilder adapts to the actual available width.
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (visibleMovies.isEmpty) {
                      return const _EmptyState();
                    }

                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: MovieCard(movie: visibleMovies[index]),
                          );
                        },
                      );
                    }

                    return GridView.builder(
                      itemCount: visibleMovies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 220,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                      itemBuilder: (context, index) {
                        return MovieCard(movie: visibleMovies[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Movie> _visibleMovies() {
    final String query = searchQuery.trim().toLowerCase();

    final List<Movie> movies = allMovies.where((movie) {
      // Search is case-insensitive and checks the movie title.
      final bool matchesSearch = movie.title.toLowerCase().contains(query);

      // If any genre is selected, the movie must contain at least one of them.
      final bool matchesGenre =
          selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));

      return matchesSearch && matchesGenre;
    }).toList();

    movies.sort((a, b) {
      switch (selectedSort) {
        case 'Z-A':
          return b.title.compareTo(a.title);
        case 'Year':
          return b.year.compareTo(a.year);
        case 'Rating':
          return b.rating.compareTo(a.rating);
        case 'A-Z':
        default:
          return a.title.compareTo(b.title);
      }
    });

    return movies;
  }

  void _toggleGenre(String genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    });
  }

  void _clearFilters() {
    searchController.value = TextEditingValue.empty;

    setState(() {
      searchQuery = '';
      selectedGenres.clear();
      selectedSort = 'A-Z';
    });
  }
}

class _HeroHeading extends StatelessWidget {
  const _HeroHeading({required this.isWideScreen, required this.movieCount});

  final bool isWideScreen;
  final int movieCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWideScreen ? 28 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF2B1014), Color(0xFF181C2A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: Flex(
        direction: isWideScreen ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find a Movie',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Search, filter, and sort genres with a responsive Flutter layout.',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.72)),
              ),
            ],
          ),
          SizedBox(height: isWideScreen ? 0 : 16, width: isWideScreen ? 24 : 0),
          Chip(
            avatar: const Icon(Icons.movie_filter, size: 18),
            label: Text('$movieCount movies shown'),
            backgroundColor: Colors.white.withValues(alpha: 0.12),
            side: const BorderSide(color: Colors.white24),
          ),
        ],
      ),
    );
  }
}

class _SearchAndFilterPanel extends StatelessWidget {
  const _SearchAndFilterPanel({
    required this.searchController,
    required this.searchQuery,
    required this.selectedGenres,
    required this.selectedSort,
    required this.onSearchChanged,
    required this.onGenreTapped,
    required this.onSortChanged,
    required this.onClearFilters,
  });

  final TextEditingController searchController;
  final String searchQuery;
  final Set<String> selectedGenres;
  final String selectedSort;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onGenreTapped;
  final ValueChanged<String?> onSortChanged;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    final bool hasFilters =
        searchQuery.isNotEmpty ||
        selectedGenres.isNotEmpty ||
        selectedSort != 'A-Z';

    return Card(
      elevation: 0,
      color: const Color(0xFF1A1D26),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              // Controller keeps the typed search text stable across rebuilds.
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by movie title...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.black.withValues(alpha: 0.22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: onSearchChanged,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Text(
                  'Genres',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 8),
                // Bonus badge: shows how many genres are currently selected.
                if (selectedGenres.isNotEmpty)
                  Badge.count(count: selectedGenres.length),
                const Spacer(),
                if (hasFilters)
                  TextButton.icon(
                    onPressed: onClearFilters,
                    icon: const Icon(Icons.close, size: 18),
                    label: const Text('Clear filters'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final genre in movieGenres)
                  FilterChip(
                    label: Text(genre),
                    selected: selectedGenres.contains(genre),
                    onSelected: (_) => onGenreTapped(genre),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(Icons.sort, size: 20),
                const SizedBox(width: 8),
                const Text('Sort by'),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: selectedSort,
                  items: [
                    for (final option in sortOptions)
                      DropdownMenuItem(value: option, child: Text(option)),
                  ],
                  onChanged: onSortChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Inner LayoutBuilder changes poster size based on card width.
        final bool compactCard = constraints.maxWidth < 520;
        final double posterWidth = compactCard ? 104 : 138;

        return Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          color: const Color(0xFF202431),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: const BorderSide(color: Colors.white10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.posterUrl,
                    width: posterWidth,
                    height: compactCard ? 148 : 178,
                    fit: BoxFit.cover,
                    // Error builder keeps the demo readable if the network fails.
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: posterWidth,
                        height: compactCard ? 148 : 178,
                        color: Colors.white10,
                        alignment: Alignment.center,
                        child: const Icon(Icons.movie, size: 42),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${movie.year}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.68),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final genre in movie.genres)
                            Chip(
                              label: Text(genre),
                              visualDensity: VisualDensity.compact,
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.08,
                              ),
                              side: BorderSide.none,
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating.toStringAsFixed(1),
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off,
            size: 54,
            color: Colors.white.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'No movies found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Try a different title or genre.',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.64)),
          ),
        ],
      ),
    );
  }
}
