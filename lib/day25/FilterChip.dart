import 'package:flutter/material.dart';

class FilterChipEx extends StatelessWidget {
  const FilterChipEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFilterChipExample(),
    );
  }
}

class MyFilterChipExample extends StatefulWidget {
  const MyFilterChipExample({super.key});

  @override
  _MyFilterChipExampleState createState() => _MyFilterChipExampleState();
}

class _MyFilterChipExampleState extends State<MyFilterChipExample> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilterChip Example'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            children: List<Widget>.generate(
              5,
              (int index) {
                return FilterChip(
                  label: Text('Filter $index'),
                  selected: selectedFilters.contains('Filter $index'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedFilters.add('Filter $index');
                      } else {
                        selectedFilters.remove('Filter $index');
                      }
                    });
                  },
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 16),
          Text('Selected Filters: ${selectedFilters.join(', ')}'),
        ],
      ),
    );
  }
}

////////////////----------------------------//////////////////////

class Movie {
  final String title;
  final String genre;

  Movie({required this.title, required this.genre});
}

class FilterChipEx2 extends StatelessWidget {
  const FilterChipEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyMovieFilterApp(),
    );
  }
}

class MyMovieFilterApp extends StatefulWidget {
  const MyMovieFilterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyMovieFilterAppState createState() => _MyMovieFilterAppState();
}

class _MyMovieFilterAppState extends State<MyMovieFilterApp> {
  List<Movie> movies = [
    Movie(title: 'Inception', genre: 'Sci-Fi'),
    Movie(title: 'The Shawshank Redemption', genre: 'Drama'),
    Movie(title: 'The Dark Knight', genre: 'Action'),
    Movie(title: 'Forrest Gump', genre: 'Drama'),
    Movie(title: 'The Matrix', genre: 'Sci-Fi'),
    Movie(title: 'Pulp Fiction', genre: 'Crime'),
    Movie(title: 'The Godfather', genre: 'Crime'),
  ];

  List<String> selectedGenres = [];

  List<Movie> getFilteredMovies() {
    if (selectedGenres.isEmpty) {
      return movies;
    } else {
      return movies
          .where((movie) => selectedGenres.contains(movie.genre))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Filter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Filter by Genre:'),
          ),
          Wrap(
            spacing: 8.0,
            children: List<Widget>.generate(
              Set.from(movies.map((movie) => movie.genre)).length,
              (int index) {
                final genre = Set.from(movies.map((movie) => movie.genre))
                    .toList()[index];
                return FilterChip(
                  label: Text(genre),
                  selected: selectedGenres.contains(genre),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedGenres.add(genre);
                      } else {
                        selectedGenres.remove(genre);
                      }
                    });
                  },
                );
              },
            ).toList(),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredMovies().length,
              itemBuilder: (BuildContext context, int index) {
                final movie = getFilteredMovies()[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.genre),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////------------------------/////////////

class FilterChipEx3 extends StatelessWidget {
  const FilterChipEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyInterestFilterApp(),
    );
  }
}

class MyInterestFilterApp extends StatefulWidget {
  const MyInterestFilterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyInterestFilterAppState createState() => _MyInterestFilterAppState();
}

class _MyInterestFilterAppState extends State<MyInterestFilterApp> {
  List<String> interests = [
    'Travel',
    'Food',
    'Music',
    'Sports',
    'Art',
    'Technology',
    'Fitness',
    'Movies',
    'Reading',
  ];

  Set<String> selectedInterests = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Filter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Your Interests:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: interests.map((interest) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: selectedInterests.contains(interest)
                        ? Colors.blueAccent
                        : const Color.fromARGB(255, 236, 36, 36),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: FilterChip(
                    label: Text(
                      interest,
                      style: TextStyle(
                        color: selectedInterests.contains(interest)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    selected: selectedInterests.contains(interest),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedInterests.add(interest);
                        } else {
                          selectedInterests.remove(interest);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selected Interests:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              selectedInterests.isNotEmpty
                  ? selectedInterests.join(', ')
                  : 'None selected',
              style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////------------------------------------//////////////////

class Product {
  final String name;
  final String category;
  final IconData icon;

  Product({required this.name, required this.category, required this.icon});
}

class FilterChipEx4 extends StatelessWidget {
  const FilterChipEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyProductFilterApp(),
    );
  }
}

class MyProductFilterApp extends StatefulWidget {
  const MyProductFilterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyProductFilterAppState createState() => _MyProductFilterAppState();
}

class _MyProductFilterAppState extends State<MyProductFilterApp> {
  List<Product> products = [
    Product(name: 'Laptop', category: 'Electronics', icon: Icons.laptop),
    Product(name: 'Headphones', category: 'Electronics', icon: Icons.headset),
    Product(
        name: 'Running Shoes', category: 'Fashion', icon: Icons.directions_run),
    Product(name: 'Backpack', category: 'Fashion', icon: Icons.backpack),
    Product(
        name: 'Coffee Maker', category: 'Appliances', icon: Icons.local_cafe),
    Product(name: 'Toaster', category: 'Appliances', icon: Icons.kitchen),
  ];

  List<Product> filteredProducts = [];

  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
  }

  void filterProducts() {
    setState(() {
      if (selectedCategories.isEmpty) {
        filteredProducts = List.from(products);
      } else {
        filteredProducts = products
            .where((product) => selectedCategories.contains(product.category))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Filter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(products),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Categories:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: products.map((product) {
                return FilterChip(
                  label: Row(
                    children: [
                      Icon(product.icon),
                      const SizedBox(width: 8),
                      Text(product.category),
                    ],
                  ),
                  selected: selectedCategories.contains(product.category),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(product.category);
                      } else {
                        selectedCategories.remove(product.category);
                      }
                      filterProducts();
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Filtered Products:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = filteredProducts[index];
                  return ListTile(
                    leading: Icon(product.icon),
                    title: Text(product.name),
                    subtitle: Text(product.category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return buildSearchResults(suggestions);
  }

  Widget buildSearchResults(List<Product> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final product = results[index];
        return ListTile(
          leading: Icon(product.icon),
          title: Text(product.name),
          subtitle: Text(product.category),
        );
      },
    );
  }
}

//////////////////////-----------------------------------------------//////////////////////

class FilterChipEx5 extends StatelessWidget {
  const FilterChipEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyColorFilterApp(),
    );
  }
}

class MyColorFilterApp extends StatefulWidget {
  const MyColorFilterApp({super.key});

  @override
  _MyColorFilterAppState createState() => _MyColorFilterAppState();
}

class _MyColorFilterAppState extends State<MyColorFilterApp> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  Set<Color> selectedColors = Set<Color>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Filter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Colors:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: colors.map((color) {
                return FilterChip(
                  label: const Text(''),
                  avatar: CircleAvatar(
                    backgroundColor: color,
                    radius: 15,
                  ),
                  selected: selectedColors.contains(color),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedColors.add(color);
                      } else {
                        selectedColors.remove(color);
                      }
                    });
                  },
                  selectedColor: Colors.white.withOpacity(0.3),
                  pressElevation: 5.0,
                  showCheckmark: false,
                  backgroundColor: Colors.transparent,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.grey),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selected Colors:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: selectedColors
                  .map((color) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 15,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
