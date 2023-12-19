import 'package:flutter/material.dart';

class SwitchListTileEx extends StatelessWidget {
  const SwitchListTileEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Switch List Tile Example'),
        ),
        body: const SwitchListTileExample(),
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchListTileExampleState createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SwitchListTile(
        title: const Text('Enable Feature'),
        subtitle:
            const Text('Toggle the switch to enable or disable the feature'),
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}

//////////////////////////////

class SwitchListTileEx2 extends StatelessWidget {
  const SwitchListTileEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Switch List Tile UI'),
        ),
        body: const ComplexSwitchListTileUI(),
      ),
    );
  }
}

class ComplexSwitchListTileUI extends StatefulWidget {
  const ComplexSwitchListTileUI({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComplexSwitchListTileUIState createState() =>
      _ComplexSwitchListTileUIState();
}

class _ComplexSwitchListTileUIState extends State<ComplexSwitchListTileUI> {
  bool _enableFeature1 = false;
  bool _enableFeature2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Enable Feature 1'),
            value: _enableFeature1,
            onChanged: (value) {
              setState(() {
                _enableFeature1 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Enable Feature 2'),
            value: _enableFeature2,
            onChanged: (value) {
              setState(() {
                _enableFeature2 = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Advanced Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('Customization Options'),
            subtitle: const Text('Configure colors, fonts, and more'),
            leading: const Icon(Icons.palette),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to customization screen
              // Implement your navigation logic here
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification preferences'),
            leading: const Icon(Icons.notifications),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to notifications screen
              // Implement your navigation logic here
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Learn more about the app'),
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to about screen
              // Implement your navigation logic here
            },
          ),
        ],
      ),
    );
  }
}

//////////////////////

class SwitchListTileEx3 extends StatelessWidget {
  const SwitchListTileEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Switch UI'),
        ),
        body: const ComplexSwitchUI(),
      ),
    );
  }
}

class ComplexSwitchUI extends StatefulWidget {
  const ComplexSwitchUI({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComplexSwitchUIState createState() => _ComplexSwitchUIState();
}

class _ComplexSwitchUIState extends State<ComplexSwitchUI> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _gestureControl = false;
  bool _dataSavingMode = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a better viewing experience',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Notifications',
            subtitle: 'Receive notifications for important updates',
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Advanced Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildSwitchListTile(
            title: 'Gesture Control',
            subtitle: 'Enable gestures for enhanced control',
            value: _gestureControl,
            onChanged: (value) {
              setState(() {
                _gestureControl = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Data Saving Mode',
            subtitle: 'Reduce data usage for slower connections',
            value: _dataSavingMode,
            onChanged: (value) {
              setState(() {
                _dataSavingMode = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}

//////////////////////////

class SwitchListTileEx4 extends StatelessWidget {
  const SwitchListTileEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Settings'),
        ),
        // ignore: prefer_const_constructors
        body: AdvancedSettingsUI(),
      ),
    );
  }
}

class AdvancedSettingsUI extends StatefulWidget {
  const AdvancedSettingsUI({super.key});

  @override
  _AdvancedSettingsUIState createState() => _AdvancedSettingsUIState();
}

class _AdvancedSettingsUIState extends State<AdvancedSettingsUI> {
  bool _darkMode = false;
  bool _enableAnalytics = true;
  bool _receiveNewsletter = false;
  bool _highPerformanceMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Display Settings'),
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a comfortable viewing experience',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'High Performance Mode',
            subtitle: 'Boost performance at the cost of battery life',
            value: _highPerformanceMode,
            onChanged: (value) {
              setState(() {
                _highPerformanceMode = value;
              });
            },
          ),
          _buildSectionHeader('User Preferences'),
          _buildSwitchListTile(
            title: 'Enable Analytics',
            subtitle: 'Help us improve the app by sending anonymous usage data',
            value: _enableAnalytics,
            onChanged: (value) {
              setState(() {
                _enableAnalytics = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Receive Newsletter',
            subtitle: 'Stay updated with the latest news and features',
            value: _receiveNewsletter,
            onChanged: (value) {
              setState(() {
                _receiveNewsletter = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement save settings logic here
                // This could include saving values to shared preferences or sending them to a server
                // For now, we'll just print the values
                print('Dark Mode: $_darkMode');
                print('Enable Analytics: $_enableAnalytics');
                print('Receive Newsletter: $_receiveNewsletter');
                print('High Performance Mode: $_highPerformanceMode');
              },
              child: const Text('Save Settings'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

///////////////////////////

class SwitchListTileEx5 extends StatelessWidget {
  const SwitchListTileEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Settings'),
        ),
        body: const CustomSettingsPage(),
      ),
    );
  }
}

class CustomSettingsPage extends StatefulWidget {
  const CustomSettingsPage({super.key});

  @override
  _CustomSettingsPageState createState() => _CustomSettingsPageState();
}

class _CustomSettingsPageState extends State<CustomSettingsPage> {
  bool _darkMode = false;
  bool _enableNotifications = true;
  bool _autoDownload = false;
  double _volumeLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'App Settings',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a sleek appearance',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Enable Notifications',
            subtitle: 'Receive important updates and notifications',
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Auto Download Content',
            subtitle: 'Automatically download media for offline use',
            value: _autoDownload,
            onChanged: (value) {
              setState(() {
                _autoDownload = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Audio Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Volume Level'),
              Slider(
                value: _volumeLevel,
                onChanged: (value) {
                  setState(() {
                    _volumeLevel = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Save settings logic here
                print('Dark Mode: $_darkMode');
                print('Enable Notifications: $_enableNotifications');
                print('Auto Download: $_autoDownload');
                print('Volume Level: $_volumeLevel');
              },
              child: const Text('Save Settings'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}

/////////////////////

class SwitchListTileEx6 extends StatelessWidget {
  const SwitchListTileEx6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Settings'),
        ),
        body: const AnimatedSettingsPage(),
      ),
    );
  }
}

class AnimatedSettingsPage extends StatefulWidget {
  const AnimatedSettingsPage({super.key});

  @override
  _AnimatedSettingsPageState createState() => _AnimatedSettingsPageState();
}

class _AnimatedSettingsPageState extends State<AnimatedSettingsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _darkMode = false;
  bool _enableNotifications = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a sleek appearance',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Enable Notifications',
            subtitle: 'Receive important updates and notifications',
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          const SizedBox(height: 20),
          _buildAnimatedSection(
            title: 'Advanced Settings',
            child: Column(
              children: [
                _buildSwitchListTile(
                  title: 'Option 1',
                  subtitle: 'Description for Option 1',
                  value: false,
                  onChanged: (value) {},
                ),
                _buildSwitchListTile(
                  title: 'Option 2',
                  subtitle: 'Description for Option 2',
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        _animate();
      },
    );
  }

  Widget _buildAnimatedSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _animate();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(_controller.isDismissed
                  ? Icons.arrow_drop_down
                  : Icons.arrow_drop_up),
            ],
          ),
        ),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
          child: child,
        ),
      ],
    );
  }

  void _animate() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//////////////////////////////

class SwitchListTileEx7 extends StatelessWidget {
  const SwitchListTileEx7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Settings'),
        ),
        body: const AnimatedSettingsPagex(),
      ),
    );
  }
}

class AnimatedSettingsPagex extends StatefulWidget {
  const AnimatedSettingsPagex({super.key});

  @override
  _AnimatedSettingsPagexState createState() => _AnimatedSettingsPagexState();
}

class _AnimatedSettingsPagexState extends State<AnimatedSettingsPagex>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _darkMode = false;
  bool _enableNotifications = true;
  bool _advancedSettingsVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a sleek appearance',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Enable Notifications',
            subtitle: 'Receive important updates and notifications',
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                _advancedSettingsVisible = !_advancedSettingsVisible;
              });
              _animate();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Advanced Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(
                  _advancedSettingsVisible
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: CurvedAnimation(
              parent: _controller,
              curve: Curves.fastOutSlowIn,
            ),
            child: Column(
              children: [
                _buildSwitchListTile(
                  title: 'Option 1',
                  subtitle: 'Description for Option 1',
                  value: false,
                  onChanged: (value) {},
                ),
                _buildSwitchListTile(
                  title: 'Option 2',
                  subtitle: 'Description for Option 2',
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        // If the user toggles a basic setting, hide the advanced settings
        if (_advancedSettingsVisible) {
          _animate();
        }
      },
    );
  }

  void _animate() {
    if (_advancedSettingsVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

///////////////////////////////////

class SwitchListTileEx8 extends StatelessWidget {
  const SwitchListTileEx8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Settings'),
        ),
        body: const CoolSettingsPage(),
      ),
    );
  }
}

class CoolSettingsPage extends StatefulWidget {
  const CoolSettingsPage({super.key});

  @override
  _CoolSettingsPageState createState() => _CoolSettingsPageState();
}

class _CoolSettingsPageState extends State<CoolSettingsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _enableDarkMode = false;
  bool _enableNotifications = true;
  bool _enableVibration = false;
  double _volumeLevel = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Appearance'),
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a sleek look',
            value: _enableDarkMode,
            onChanged: (value) {
              setState(() {
                _enableDarkMode = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildSectionHeader('Notifications'),
          _buildSwitchListTile(
            title: 'Enable Notifications',
            subtitle: 'Receive important updates and alerts',
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Vibration',
            subtitle: 'Enable vibration for notifications',
            value: _enableVibration,
            onChanged: (value) {
              setState(() {
                _enableVibration = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildSectionHeader('Sound Settings'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Volume Level'),
              Slider(
                value: _volumeLevel,
                onChanged: (value) {
                  setState(() {
                    _volumeLevel = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAnimatedSection(
            title: 'Advanced Settings',
            child: Column(
              children: [
                _buildSwitchListTile(
                  title: 'Experimental Feature',
                  subtitle: 'Try out our latest features',
                  value: false,
                  onChanged: (value) {},
                ),
                _buildSwitchListTile(
                  title: 'Developer Options',
                  subtitle: 'Unlock advanced settings for developers',
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        _animate();
      },
    );
  }

  Widget _buildAnimatedSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _controller.isDismissed
                  ? _controller.forward()
                  : _controller.reverse();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: const Icon(Icons.expand_more),
              ),
            ],
          ),
        ),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
          child: child,
        ),
      ],
    );
  }

  void _animate() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//////////////////////////////////////

class SwitchListTileEx10 extends StatelessWidget {
  const SwitchListTileEx10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Beautiful Settings'),
        ),
        body: BeautifulSettingsPage(),
      ),
    );
  }
}

class BeautifulSettingsPage extends StatefulWidget {
  const BeautifulSettingsPage({super.key});

  @override
  _BeautifulSettingsPageState createState() => _BeautifulSettingsPageState();
}

class _BeautifulSettingsPageState extends State<BeautifulSettingsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  bool _enableFeature1 = false;
  bool _enableFeature2 = true;
  bool _enableFeature3 = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        _buildTabView(),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: const [
          Tab(text: 'General'),
          Tab(text: 'Appearance'),
          Tab(text: 'Advanced'),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildGeneralSettings(),
          _buildAppearanceSettings(),
          _buildAdvancedSettings(),
        ],
      ),
    );
  }

  Widget _buildGeneralSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSwitchListTile(
            title: 'Enable Feature 1',
            subtitle: 'Toggle to enable or disable Feature 1',
            value: _enableFeature1,
            onChanged: (value) {
              setState(() {
                _enableFeature1 = value;
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Enable Feature 2',
            subtitle: 'Toggle to enable or disable Feature 2',
            value: _enableFeature2,
            onChanged: (value) {
              setState(() {
                _enableFeature2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppearanceSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable dark mode for a sleek appearance',
            value: _enableFeature2,
            onChanged: (value) {
              setState(() {
                _enableFeature2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSwitchListTile(
            title: 'Enable Feature 3',
            subtitle: 'Toggle to enable or disable Feature 3',
            value: _enableFeature3,
            onChanged: (value) {
              setState(() {
                _enableFeature3 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SizeTransition(
      sizeFactor: _animationController,
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
