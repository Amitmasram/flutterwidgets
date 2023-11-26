import 'package:flutter/material.dart';

class FadeImageEx extends StatelessWidget {
  const FadeImageEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FadeInImage Example'),
        ),
        body: Center(
          child: FadeInImage(
            placeholder: const NetworkImage(
                'https://tse1.mm.bing.net/th?id=OIP.xF-Ux8hDwsdDmaR33dTa6AHaE8&pid=Api&P=0&h=180'),
            // placeholder: const AssetImage('assets/placeholder.png'),
            image: const NetworkImage(
                'https://tse3.mm.bing.net/th?id=OIP.q8eB0ZuykV_7H0UyEMNSpAHaEK&pid=Api&P=0&h=180'),
            fadeInDuration: const Duration(milliseconds: 500),
            imageErrorBuilder: (context, error, stackTrace) {
              return const Text('Error loading image');
            },
            fit: BoxFit.cover,
            alignment: Alignment.center,
            excludeFromSemantics: false,
            // You can adjust the fade-in duration for the placeholder using Opacity
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Opacity(
                opacity: 0.3, // Adjust the opacity as needed
                child: Image.asset('assets/placeholder.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}
/////////

class HeroImageEx extends StatelessWidget {
  const HeroImageEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Example'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(index: index),
                ),
              );
            },
            child: Hero(
              tag: 'imageHero$index',
              child: Image.network(
                index == 0
                    ? 'https://tse3.mm.bing.net/th?id=OIP.q8eB0ZuykV_7H0UyEMNSpAHaEK&pid=Api&P=0&h=180'
                    : 'https://tse1.mm.bing.net/th?id=OIP.xF-Ux8hDwsdDmaR33dTa6AHaE8&pid=Api&P=0&h=180',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'imageHero$index',
          child: Image.network(
            index == 0
                ? 'https://tse3.mm.bing.net/th?id=OIP.q8eB0ZuykV_7H0UyEMNSpAHaEK&pid=Api&P=0&h=400'
                : 'https://tse1.mm.bing.net/th?id=OIP.xF-Ux8hDwsdDmaR33dTa6AHaE8&pid=Api&P=0&h=400',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
