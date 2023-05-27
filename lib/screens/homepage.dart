import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumpreza/widgets/appbar.dart';
import '../common/constants.dart';

import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'Fotograf';
  String _selectedLocation = 'Kraków';

  // Na potrzeby tego przykładu, tworzę listę statycznych ogłoszeń.
  final List<Listing> featuredListings = [
    Listing(
        name: 'DJ Adam',
        location: 'Warszawa',
        rating: 4.5,
        description: 'Muzyka na każdą okazję!',
        imageUrl: 'https://picsum.photos/200/300'),
    // Dodaj więcej ogłoszeń...
  ];

  final List<Listing> latestListings = [
    Listing(
        name: 'Fotograf Anna',
        location: 'Kraków',
        rating: 4.8,
        description: 'Niezapomniane zdjęcia z twojej imprezy!',
        imageUrl: 'https://picsum.photos/id/237/200/301'),
    // Dodaj więcej ogłoszeń...
  ];

  final List<String> _categories = ['Fotograf', 'DJ', 'Catering', 'Zespoły muzyczne'];
  final List<String> _locations = ['Kraków', 'Warszawa', 'Poznań', 'Wrocław'];

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = TextButton.styleFrom(
    //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
    // );
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: CustomAppBar()),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>['Fotograf', 'DJ', 'Catering', 'Zespoły muzyczne']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _locations.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                setState(() {
                  _selectedLocation = selection;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Implementacja wyszukiwania
              },
              child: Text('Szukaj'),
            ),
          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           labelText: 'Wpisz typ usługi...',
      //           suffixIcon: Icon(Icons.search),
      //         ),
      //       ),
      //     ),
      //     DropdownButton<String>(
      //       hint: Text('Wybierz lokalizację'),
      //       items: <String>['Warszawa', 'Kraków', 'Poznań', 'Wrocław']
      //           .map((String value) {
      //         return DropdownMenuItem<String>(
      //           value: value,
      //           child: Text(value),
      //         );
      //       }).toList(),
      //       onChanged: (_) {},
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text('Kategorie usług',
      //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //     ),
      //     Wrap(
      //       spacing: 8.0,
      //       children: ['DJ', 'Fotograf', 'Catering']
      //           .map((category) => Chip(label: Text(category)))
      //           .toList(),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text('Wyróżnione ogłoszenia',
      //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //     ),
      //     Column(
      //       children: featuredListings
      //           .map((listing) => ListingWidget(listing: listing))
      //           .toList(),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text('Ostatnio dodane ogłoszenia',
      //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //     ),
      //     Column(
      //       children: latestListings
      //           .map((listing) => ListingWidget(listing: listing))
      //           .toList(),
      //     ),
      //   ],
      // ),
    );
  }
}

class Listing {
  final String name;
  final String location;
  final double rating;
  final String description;
  final String imageUrl;

  Listing({
    required this.name,
    required this.location,
    required this.rating,
    required this.description,
    required this.imageUrl,
  });
}

class ListingWidget extends StatelessWidget {
  final Listing listing;

  ListingWidget({required this.listing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(listing.imageUrl), // użyj miniatury zdjęcia
      title: Text(listing.name),
      subtitle:
          Text('${listing.description}\nLokalizacja: ${listing.location}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Text(listing.rating.toString()),
        ],
      ),
    );
  }
}