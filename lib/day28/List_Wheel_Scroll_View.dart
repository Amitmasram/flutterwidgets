import 'package:flutter/material.dart';

class ListWheelScrollViewEx extends StatelessWidget {
  const ListWheelScrollViewEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListWheelScrollView Example'),
        ),
        body: const MyListWheelScrollView(),
      ),
    );
  }
}

class MyListWheelScrollView extends StatelessWidget {
  const MyListWheelScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 50, // Height of each item
      diameterRatio:
          2.0, // Controls the size of the visible portion of the list
      children: List<Widget>.generate(
        10,
        (index) => ListTile(
          title: Center(
            child: Text('Item $index'),
          ),
        ),
      ),
      onSelectedItemChanged: (int index) {
        // Handle the selection change
        print('Selected item: $index');
      },
    );
  }
}

///////////////////////////
///import 'package:flutter/material.dart';

class ListWheelScrollViewEx2 extends StatelessWidget {
  const ListWheelScrollViewEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Picker'),
        ),
        body: const MyColorPicker(),
      ),
    );
  }
}

class MyColorPicker extends StatefulWidget {
  const MyColorPicker({super.key});

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  int selectedColorIndex = 0;

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        itemExtent: 80,
        diameterRatio: 2.5,
        perspective: 0.01,
        offAxisFraction: -0.4,
        physics: const FixedExtentScrollPhysics(),
        children: List<Widget>.generate(
          colors.length,
          (index) => _buildColorItem(index),
        ),
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedColorIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildColorItem(int index) {
    final color = colors[index];
    final isSelected = index == selectedColorIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.white, width: 4) : null,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
//////////////////////////

class ListWheelScrollViewEx3 extends StatelessWidget {
  const ListWheelScrollViewEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card Carousel'),
        ),
        body: const MyCardCarousel(),
      ),
    );
  }
}

class MyCardCarousel extends StatefulWidget {
  const MyCardCarousel({super.key});

  @override
  _MyCardCarouselState createState() => _MyCardCarouselState();
}

class _MyCardCarouselState extends State<MyCardCarousel> {
  int selectedCardIndex = 0;

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      title: 'Mountain View',
      imageUrl: 'https://placekitten.com/200/300',
    ),
    CarouselItem(
      title: 'Beach Sunset',
      imageUrl: 'https://placekitten.com/201/301',
    ),
    CarouselItem(
      title: 'City Lights',
      imageUrl: 'https://placekitten.com/202/302',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        itemExtent: 250,
        diameterRatio: 2.5,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        children: List<Widget>.generate(
          carouselItems.length,
          (index) => _buildCarouselItem(index),
        ),
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedCardIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    final item = carouselItems[index];
    final isSelected = index == selectedCardIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Description of the card goes here.',
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem {
  final String title;
  final String imageUrl;

  CarouselItem({
    required this.title,
    required this.imageUrl,
  });
}

///////////////////////////////////////

class ListWheelScrollViewEx4 extends StatelessWidget {
  const ListWheelScrollViewEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date Selector'),
        ),
        body: const MyDateSelector(),
      ),
    );
  }
}

class MyDateSelector extends StatefulWidget {
  const MyDateSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDateSelectorState createState() => _MyDateSelectorState();
}

class _MyDateSelectorState extends State<MyDateSelector> {
  int selectedDateIndex = 0;

  final List<DateTime> dates = List.generate(
    14,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        itemExtent: 80,
        diameterRatio: 2.5,
        perspective: 0.002,
        physics: const FixedExtentScrollPhysics(),
        children: List<Widget>.generate(
          dates.length,
          (index) => _buildDateItem(index),
        ),
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedDateIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildDateItem(int index) {
    final date = dates[index];
    final isSelected = index == selectedDateIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_getDayOfWeek(date.weekday)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${date.day}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _getDayOfWeek(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.sunday:
        return 'Sun';
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      default:
        return '';
    }
  }
}

/////////////////////////////////

class ListWheelScrollViewEx5 extends StatelessWidget {
  const ListWheelScrollViewEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: const MyWeatherApp(),
      ),
    );
  }
}

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  int selectedCityIndex = 0;

  final List<WeatherInfo> weatherData = [
    WeatherInfo(city: 'New York', temperature: 25, condition: 'Sunny'),
    WeatherInfo(city: 'London', temperature: 18, condition: 'Cloudy'),
    WeatherInfo(city: 'Tokyo', temperature: 30, condition: 'Rainy'),
    // Add more cities and weather data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        itemExtent: 200,
        diameterRatio: 2.0,
        perspective: 0.002,
        physics: const FixedExtentScrollPhysics(),
        children: List<Widget>.generate(
          weatherData.length,
          (index) => _buildWeatherCard(index),
        ),
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedCityIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildWeatherCard(int index) {
    final weather = weatherData[index];
    final isSelected = index == selectedCityIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weather.city,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.temperature}°C',
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            weather.condition,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          // Add more weather information as needed
        ],
      ),
    );
  }
}

class WeatherInfo {
  final String city;
  final int temperature;
  final String condition;

  WeatherInfo({
    required this.city,
    required this.temperature,
    required this.condition,
  });
}
