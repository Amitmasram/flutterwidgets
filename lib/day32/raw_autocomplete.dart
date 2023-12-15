import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class RawAutocompleteEx extends StatelessWidget {
  const RawAutocompleteEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Autocomplete Example'),
        ),
        body: const AutocompleteExample(),
      ),
    );
  }
}

class AutocompleteExample extends StatefulWidget {
  const AutocompleteExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AutocompleteExampleState createState() => _AutocompleteExampleState();
}

class _AutocompleteExampleState extends State<AutocompleteExample> {
  late AutoCompleteTextField<String> searchTextField;
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Lemon',
    'Orange',
    'Peach',
    'Pear',
    'Plum',
    'Strawberry',
    'Watermelon',
  ];

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchTextField = AutoCompleteTextField<String>(
            key: key,
            clearOnSubmit: false,
            suggestions: suggestions,
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
              hintText: 'Search fruits...',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            itemFilter: (item, query) {
              return item.toLowerCase().startsWith(query.toLowerCase());
            },
            itemSorter: (a, b) {
              return a.compareTo(b);
            },
            itemSubmitted: (item) {
              setState(() {
                selectedValue = item;
              });
            },
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16.0),
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          Text('Selected Value: $selectedValue'),
        ],
      ),
    );
  }
}
