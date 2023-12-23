import 'package:flutter/material.dart';

class VerticalDividerEx extends StatelessWidget {
  const VerticalDividerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('VerticalDivider Example'),
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Left Content'),
              VerticalDivider(
                width: 20, // specify the thickness of the vertical line
                color: Colors.blue, // specify the color of the vertical line
              ),
              Text('Right Content'),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////

class VerticalDividerEx2 extends StatelessWidget {
  const VerticalDividerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isSidebarOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
      if (_isSidebarOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool UI with VerticalDivider'),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarOpen ? 200 : 60,
            child: const Sidebar(),
          ),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
          ),
          const Expanded(
            child: Content(),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sidebar Content',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////

class VerticalDividerEx3 extends StatelessWidget {
  const VerticalDividerEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  bool _isSidebarOpen = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarOpen ? 250 : 0,
            child: const Sidebars(),
          ),
          VerticalDivider(
            width: 1,
            color: Colors.grey[300],
          ),
          const Expanded(
            child: ChatScreen(),
          ),
        ],
      ),
    );
  }
}

class Sidebars extends StatelessWidget {
  const Sidebars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            title: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Online',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(
            height: 10,
            color: Colors.white.withOpacity(0.7),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            title: Text(
              'Jane Smith',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Away',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Add more contacts as needed
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Chats',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ChatTile(
                  sender: 'John Doe',
                  message: 'Hey, how are you?',
                  time: '2:30 PM',
                  isUnread: true,
                ),
                ChatTile(
                  sender: 'Jane Smith',
                  message: 'Let\'s catch up later!',
                  time: '1:45 PM',
                  isUnread: false,
                ),
                // Add more chat tiles as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isUnread;

  ChatTile({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: const CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'New',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

//////////////////////////////////////

class VerticalDividerEx5 extends StatelessWidget {
  const VerticalDividerEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FinanceDashboard(),
    );
  }
}

class FinanceDashboard extends StatefulWidget {
  const FinanceDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FinanceDashboardState createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  bool _isSidebarOpen = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarOpen ? 250 : 0,
            child: const Sidebart(),
          ),
          VerticalDivider(
            width: 1,
            color: Colors.grey[300],
          ),
          const Expanded(
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}

class Sidebart extends StatelessWidget {
  const Sidebart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            title: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Financial Analyst',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(
            height: 10,
            color: Colors.white.withOpacity(0.7),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
            title: Text(
              'Jane Smith',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Investment Advisor',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Add more contacts as needed
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Financial Overview',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Assets',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$2,345,678',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1,
                color: Colors.grey[300],
              ),
              const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    TransactionList(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: DetailedView(),
          ),
        ],
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TransactionTile(
          title: 'Stock Purchase',
          amount: '-\$5,000',
          date: 'Dec 15, 2023',
        ),
        TransactionTile(
          title: 'Dividend Income',
          amount: '+\$1,200',
          date: 'Dec 14, 2023',
        ),
        // Add more transaction tiles as needed
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DetailedView extends StatelessWidget {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detailed View',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Add charts, graphs, or additional detailed content here
          Placeholder(
            color: Colors.blue,
            fallbackWidth: double.infinity,
            fallbackHeight: 200,
          ),
        ],
      ),
    );
  }
}
