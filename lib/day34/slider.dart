import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:weather/weather.dart';

class SliderEx extends StatelessWidget {
  const SliderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slider Example'),
        ),
        body: const Center(
          child: MySlider(),
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Slider Value: $_sliderValue'),
        Slider(
          value: _sliderValue,
          min: 0.0,
          max: 100.0,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      ],
    );
  }
}

///////////////////////////

class SliderEx2 extends StatelessWidget {
  const SliderEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Mixer'),
        ),
        body: const Center(
          child: ColorMixer(),
        ),
      ),
    );
  }
}

class ColorMixer extends StatefulWidget {
  const ColorMixer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  double _redValue = 0.0;
  double _greenValue = 0.0;
  double _blueValue = 0.0;

  Color get mixedColor => Color.fromRGBO(
      _redValue.toInt(), _greenValue.toInt(), _blueValue.toInt(), 1.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: mixedColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(height: 20),
        Text('Red: ${_redValue.toInt()}'),
        Slider(
          value: _redValue,
          min: 0.0,
          max: 255.0,
          onChanged: (value) {
            setState(() {
              _redValue = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Green: ${_greenValue.toInt()}'),
        Slider(
          value: _greenValue,
          min: 0.0,
          max: 255.0,
          onChanged: (value) {
            setState(() {
              _greenValue = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Blue: ${_blueValue.toInt()}'),
        Slider(
          value: _blueValue,
          min: 0.0,
          max: 255.0,
          onChanged: (value) {
            setState(() {
              _blueValue = value;
            });
          },
        ),
      ],
    );
  }
}

//////////////////////////////

class SliderEx3 extends StatelessWidget {
  const SliderEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player'),
        ),
        body: const Center(
          child: MusicPlayer(),
        ),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double _volume = 50.0;
  double _balance = 0.0;
  double _equalizer = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Volume: ${_volume.toInt()}'),
        Slider(
          value: _volume,
          min: 0.0,
          max: 100.0,
          onChanged: (value) {
            setState(() {
              _volume = value;
            });
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.headset, size: 30),
            const SizedBox(width: 20),
            const Text('Balance'),
            Slider(
              value: _balance,
              min: -100.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  _balance = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Equalizer: ${_equalizer.toInt()}'),
        Slider(
          value: _equalizer,
          min: -50.0,
          max: 50.0,
          onChanged: (value) {
            setState(() {
              _equalizer = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement play button functionality
            // You can add logic to play music based on the settings
          },
          child: const Text('Play'),
        ),
      ],
    );
  }
}

////////////////////////////

class SliderEx4 extends StatelessWidget {
  const SliderEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Step Tracker'),
        ),
        body: const Center(
          child: StepTracker(),
        ),
      ),
    );
  }
}

class StepTracker extends StatefulWidget {
  const StepTracker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepTrackerState createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> {
  int _dailySteps = 0;
  // ignore: prefer_final_fields
  int _goalSteps = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Daily Steps: $_dailySteps'),
        Slider(
          value: _dailySteps.toDouble(),
          min: 0.0,
          max: _goalSteps.toDouble(),
          onChanged: (value) {
            setState(() {
              _dailySteps = value.toInt();
            });
          },
        ),
        const SizedBox(height: 20),
        Text('Goal: $_goalSteps steps'),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: _dailySteps / _goalSteps,
          backgroundColor: Colors.grey,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement reset button functionality
            setState(() {
              _dailySteps = 0;
            });
          },
          child: const Text('Reset'),
        ),
      ],
    );
  }
}

///////////////////////

class SliderEx5 extends StatelessWidget {
  const SliderEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Simulator'),
        ),
        body: const Center(
          child: WeatherSimulator(),
        ),
      ),
    );
  }
}

class WeatherSimulator extends StatefulWidget {
  const WeatherSimulator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherSimulatorState createState() => _WeatherSimulatorState();
}

class _WeatherSimulatorState extends State<WeatherSimulator> {
  double _temperature = 20.0; // in Celsius
  double _humidity = 50.0; // percentage
  double _windSpeed = 0.0; // in km/h

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: Text(
              '🌦️',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text('Temperature: ${_temperature.toInt()}°C'),
        Slider(
          value: _temperature,
          min: -20.0,
          max: 40.0,
          onChanged: (value) {
            setState(() {
              _temperature = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Humidity: ${_humidity.toInt()}%'),
        Slider(
          value: _humidity,
          min: 0.0,
          max: 100.0,
          onChanged: (value) {
            setState(() {
              _humidity = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Wind Speed: ${_windSpeed.toInt()} km/h'),
        Slider(
          value: _windSpeed,
          min: 0.0,
          max: 50.0,
          onChanged: (value) {
            setState(() {
              _windSpeed = value;
            });
          },
        ),
      ],
    );
  }
}

//////////////////////////////

class SliderEx6 extends StatelessWidget {
  const SliderEx6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Filter Editor'),
        ),
        body: const Center(
          child: PhotoFilterEditor(),
        ),
      ),
    );
  }
}

class PhotoFilterEditor extends StatefulWidget {
  const PhotoFilterEditor({super.key});

  @override
  _PhotoFilterEditorState createState() => _PhotoFilterEditorState();
}

class _PhotoFilterEditorState extends State<PhotoFilterEditor> {
  double _brightness = 0.0;
  double _contrast = 1.0;
  double _saturation = 1.0;
  double _blur = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/sample_photo.jpg'), // Replace with your photo
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: Text(
                  'Live Preview',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text('Brightness: ${_brightness.toInt()}'),
        Slider(
          value: _brightness,
          min: -1.0,
          max: 1.0,
          onChanged: (value) {
            setState(() {
              _brightness = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Contrast: ${_contrast.toStringAsFixed(2)}'),
        Slider(
          value: _contrast,
          min: 0.0,
          max: 2.0,
          onChanged: (value) {
            setState(() {
              _contrast = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Saturation: ${_saturation.toStringAsFixed(2)}'),
        Slider(
          value: _saturation,
          min: 0.0,
          max: 2.0,
          onChanged: (value) {
            setState(() {
              _saturation = value;
            });
          },
        ),
        const SizedBox(height: 10),
        Text('Blur: ${_blur.toInt()}'),
        Slider(
          value: _blur,
          min: 0.0,
          max: 10.0,
          onChanged: (value) {
            setState(() {
              _blur = value;
            });
          },
        ),
      ],
    );
  }
}

////////////////////////////

class SliderEx7 extends StatelessWidget {
  const SliderEx7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gradient Generator'),
        ),
        body: const Center(
          child: GradientGenerator(),
        ),
      ),
    );
  }
}

class GradientGenerator extends StatefulWidget {
  const GradientGenerator({super.key});

  @override
  _GradientGeneratorState createState() => _GradientGeneratorState();
}

class _GradientGeneratorState extends State<GradientGenerator> {
  List<ColorStop> colorStops = [
    ColorStop(Colors.red, 0.0),
    ColorStop(Colors.green, 0.5),
    ColorStop(Colors.blue, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorStops.map((stop) => stop.color).toList(),
              stops: colorStops.map((stop) => stop.position).toList(),
            ),
          ),
          child: const Center(
            child: Text(
              'Gradient Preview',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Color Stops'),
        for (int i = 0; i < colorStops.length; i++)
          ColorStopSlider(
            colorStop: colorStops[i],
            onChanged: (newStop) {
              setState(() {
                colorStops[i] = newStop;
              });
            },
          ),
      ],
    );
  }
}

class ColorStop {
  Color color;
  double position;

  ColorStop(this.color, this.position);
}

class ColorStopSlider extends StatefulWidget {
  final ColorStop colorStop;
  final ValueChanged<ColorStop> onChanged;

  ColorStopSlider(
      {super.key, required this.colorStop, required this.onChanged});

  @override
  _ColorStopSliderState createState() => _ColorStopSliderState();
}

class _ColorStopSliderState extends State<ColorStopSlider> {
  late ColorStop _colorStop;

  @override
  void initState() {
    super.initState();
    _colorStop = widget.colorStop;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Slider(
                  value: _colorStop.position,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _colorStop = ColorStop(_colorStop.color, value);
                      widget.onChanged(_colorStop);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: _colorStop.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

/////////////////////////////////

class SliderEx8 extends StatelessWidget {
  const SliderEx8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('3D Model Viewer'),
        ),
        body: const Center(
          child: ModelViewer(),
        ),
      ),
    );
  }
}

class ModelViewer extends StatefulWidget {
  const ModelViewer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ModelViewerState createState() => _ModelViewerState();
}

class _ModelViewerState extends State<ModelViewer> {
  double _rotateX = 0.0;
  double _rotateY = 0.0;
  double _rotateZ = 0.0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.world.add(Object(
                  scale: Vector3(_scale, _scale, _scale),
                  fileName: 'assets/Cube.obj',
                ));
              },
            ),
          ),
          const SizedBox(height: 20),
          Text('Rotate X: ${_rotateX.toInt()}'),
          Slider(
            value: _rotateX,
            min: -180.0,
            max: 180.0,
            onChanged: (value) {
              setState(() {
                _rotateX = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Text('Rotate Y: ${_rotateY.toInt()}'),
          Slider(
            value: _rotateY,
            min: -180.0,
            max: 180.0,
            onChanged: (value) {
              setState(() {
                _rotateY = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Text('Rotate Z: ${_rotateZ.toInt()}'),
          Slider(
            value: _rotateZ,
            min: -180.0,
            max: 180.0,
            onChanged: (value) {
              setState(() {
                _rotateZ = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Text('Scale: ${_scale.toStringAsFixed(2)}'),
          Slider(
            value: _scale,
            min: 0.5,
            max: 2.0,
            onChanged: (value) {
              setState(() {
                _scale = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

//////////////////////////////

// class SliderEx9 extends StatelessWidget {
//   const SliderEx9({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Interactive Bar Chart'),
//         ),
//         body: const Center(
//           child: ChartWidget(),
//         ),
//       ),
//     );
//   }
// }

// class ChartWidget extends StatefulWidget {
//   const ChartWidget({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChartWidgetState createState() => _ChartWidgetState();
// }

// class _ChartWidgetState extends State<ChartWidget> {
//   double _sliderValue = 5.0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // ignore: sized_box_for_whitespace
//         Container(
//           height: 300,
//           width: 300,
//           child: BarChart(
//             BarChartData(
//               titlesData: const FlTitlesData(show: false),
//               barGroups: [
//                 BarChartGroupData(x: 0, barRods: [
//                   BarChartRodData(toY: _sliderValue, color: Colors.blue),
//                 ]),
//               ],
//               borderData: FlBorderData(show: false),
//               gridData: const FlGridData(show: false),
//               groupsSpace: 4,
//               barTouchData: BarTouchData(
//                 touchTooltipData: BarTouchTooltipData(
//                   tooltipBgColor: Colors.blueAccent,
//                 ),
//                 touchCallback: (barTouchResponse, details) {
//                   // Your touch callback logic here
//                 },
//                 handleBuiltInTouches: true,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Text('Adjust Bar Height'),
//         Slider(
//           value: _sliderValue,
//           min: 1.0,
//           max: 10.0,
//           onChanged: (value) {
//             setState(() {
//               _sliderValue = value;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }

//////////////////////////////

class SliderEx10 extends StatelessWidget {
  const SliderEx10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: const Center(
          child: WeatherApp(),
        ),
      ),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final WeatherFactory _weatherFactory = WeatherFactory(
      "8c27f57dd20ecaf39a50660a7ad900d0",
      language: Language.ENGLISH);
  double _sliderValue = 0.0;
  Weather? _currentWeather;

  @override
  void initState() {
    super.initState();
    _updateWeather();
  }

  Future<void> _updateWeather() async {
    DateTime dateTime =
        DateTime.now().add(Duration(hours: _sliderValue.toInt()));
    Weather weather =
        await _weatherFactory.currentWeatherByLocation(40.7128, -74.0060);
    setState(() {
      _currentWeather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: _currentWeather != null
              ? Column(
                  children: [
                    Text(
                      'Weather at ${_currentWeather!.areaName}, ${_currentWeather!.country}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Temperature: ${_currentWeather!.temperature?.celsius.toString()}°C',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Condition: ${_currentWeather!.weatherMain}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
        const SizedBox(height: 20.0),
        const Text('Select Time of Day'),
        Slider(
          value: _sliderValue,
          min: 0.0,
          max: 24.0,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
          onChangeEnd: (value) {
            _updateWeather();
          },
        ),
      ],
    );
  }
}
