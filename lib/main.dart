import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Card Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Information'),
        centerTitle: true,
      ),
      body: const ResponsiveCardGrid(),
    );
  }
}

class Country {
  final String imageUrl;
  final String countryName;
  final String population;
  final String language;
  final String area;

  Country({
    required this.imageUrl,
    required this.countryName,
    required this.population,
    required this.language,
    required this.area,
  });
}

final List<Country> countryList = [
  Country(
    imageUrl: 'https://flagcdn.com/w320/us.png',
    countryName: 'United States',
    population: '331 million',
    language: 'English',
    area: '9,833,520 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/gb.png',
    countryName: 'United Kingdom',
    population: '67 million',
    language: 'English',
    area: '243,610 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/de.png',
    countryName: 'Germany',
    population: '83 million',
    language: 'German',
    area: '357,022 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/fr.png',
    countryName: 'France',
    population: '65 million',
    language: 'French',
    area: '551,695 sq km',
  ),
  Country(
    imageUrl: 'https://flagpedia.net/data/flags/w1160/bd.webp',
    countryName: 'Bangladesh',
    population: '170 million',
    language: 'Bangla',
    area: '147,570 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/ca.png',
    countryName: 'Canada',
    population: '38 million',
    language: 'English, French',
    area: '9,984,670 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/jp.png',
    countryName: 'Japan',
    population: '125 million',
    language: 'Japanese',
    area: '377,975 sq km',
  ),
  Country(
    imageUrl: 'https://flagcdn.com/w320/au.png',
    countryName: 'Australia',
    population: '25 million',
    language: 'English',
    area: '7,692,024 sq km',
  ),
];

class ResponsiveCardGrid extends StatelessWidget {
  const ResponsiveCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    if (width >= 1024) {
      crossAxisCount = 4;
    } else if (width >= 768) {
      crossAxisCount = 3;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: countryList.length,
        itemBuilder: (context, index) {
          return CountryCard(country: countryList[index]);
        },
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final Country country;
  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              country.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 100,
                  child: Center(child: Icon(Icons.broken_image)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.countryName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blueAccent),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.language, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text('Language: ${country.language}',
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.people, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text('Population: ${country.population}',
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.map, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text('Area: ${country.area}',
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
