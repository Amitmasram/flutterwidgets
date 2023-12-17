import 'package:flutter/material.dart';

class SimpleDialogEx extends StatelessWidget {
  const SimpleDialogEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the simple dialog when the button is pressed
            _showDialog(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  // Function to show the SimpleDialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose an option'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                // Handle option 1
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Handle option 2
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Option 2'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Handle option 3
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Option 3'),
            ),
          ],
        );
      },
    );
  }
}

///////////////////////////////

class SimpleDialogEx2 extends StatelessWidget {
  const SimpleDialogEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagex(),
    );
  }
}

class MyHomePagex extends StatelessWidget {
  const MyHomePagex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the custom dialog when the button is pressed
            _showCustomDialog(context);
          },
          child: const Text('Show Custom Dialog'),
        ),
      ),
    );
  }

  // Function to show the custom dialog
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Controllers for text input
        TextEditingController nameController = TextEditingController();
        TextEditingController emailController = TextEditingController();

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Custom Input Dialog',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Process the input (for demonstration, just print the values)
                    print('Name: ${nameController.text}');
                    print('Email: ${emailController.text}');

                    // Close the dialog
                    Navigator.pop(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

///////////////////////////

class SimpleDialogEx3 extends StatelessWidget {
  const SimpleDialogEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePaged(),
    );
  }
}

class MyHomePaged extends StatelessWidget {
  const MyHomePaged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the confirmation dialog when the button is pressed
            _showConfirmationDialog(context);
          },
          child: const Text('Show Confirmation Dialog'),
        ),
      ),
    );
  }

  // Function to show the confirmation dialog
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to perform this action?'),
          actions: [
            TextButton(
              onPressed: () {
                // Perform the action (for demonstration, just print a message)
                print('Action Confirmed');

                // Close the dialog
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // Cancel the action
                print('Action Canceled');

                // Close the dialog
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

///////////////////////////////////////

class SimpleDialogEx4 extends StatelessWidget {
  const SimpleDialogEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagea(),
    );
  }
}

class MyHomePagea extends StatelessWidget {
  const MyHomePagea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the complex input dialog when the button is pressed
            _showComplexInputDialog(context);
          },
          child: const Text('Add New Task'),
        ),
      ),
    );
  }

  // Function to show the complex input dialog
  void _showComplexInputDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add New Task',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      selectedDate = pickedDate;
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text(
                        'Due Date: ${selectedDate.toLocal()}'.split(' ')[0],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform validation (for demonstration, just print values)
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      print('Task Title: ${titleController.text}');
                      print('Task Description: ${descriptionController.text}');
                      print('Due Date: $selectedDate');

                      // Close the dialog
                      Navigator.pop(context);
                    } else {
                      // Display an error message for incomplete input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

///////////////////////////////////////

class Character {
  String name;
  String hairColor;
  String eyeColor;

  Character(
      {required this.name, required this.hairColor, required this.eyeColor});
}

class SimpleDialogEx5 extends StatelessWidget {
  const SimpleDialogEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePages(),
    );
  }
}

class MyHomePages extends StatelessWidget {
  const MyHomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the cool customization dialog when the button is pressed
            _showCoolCustomizationDialog(context);
          },
          child: const Text('Customize Character'),
        ),
      ),
    );
  }

  // Function to show the cool customization dialog
  void _showCoolCustomizationDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController hairColorController = TextEditingController();
    TextEditingController eyeColorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Character Customization',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: 'Character Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: hairColorController,
                  decoration: const InputDecoration(labelText: 'Hair Color'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: eyeColorController,
                  decoration: const InputDecoration(labelText: 'Eye Color'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform validation (for demonstration, just print values)
                    if (nameController.text.isNotEmpty &&
                        hairColorController.text.isNotEmpty &&
                        eyeColorController.text.isNotEmpty) {
                      Character customizedCharacter = Character(
                        name: nameController.text,
                        hairColor: hairColorController.text,
                        eyeColor: eyeColorController.text,
                      );

                      // Display the customized character details
                      _showCustomizedCharacterDetails(
                          context, customizedCharacter);

                      // Close the customization dialog
                      Navigator.pop(context);
                    } else {
                      // Display an error message for incomplete input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Create Character'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show the customized character details
  void _showCustomizedCharacterDetails(
      BuildContext context, Character character) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Customized Character Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${character.name}'),
              Text('Hair Color: ${character.hairColor}'),
              Text('Eye Color: ${character.eyeColor}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the details dialog
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

////////////////////////////////////

// class Character {
//   String name;
//   String hairColor;
//   String eyeColor;

//   Character({required this.name, required this.hairColor, required this.eyeColor});
// }

class SimpleDialogEx6 extends StatelessWidget {
  const SimpleDialogEx6({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagen(),
    );
  }
}

class MyHomePagen extends StatelessWidget {
  const MyHomePagen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the cool customization dialog when the button is pressed
            _showCoolCustomizationDialog(context);
          },
          child: const Text('Customize Character'),
        ),
      ),
    );
  }

  // Function to show the cool customization dialog
  void _showCoolCustomizationDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController hairColorController = TextEditingController();
    TextEditingController eyeColorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Character Customization',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: 'Character Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: hairColorController,
                  decoration: const InputDecoration(labelText: 'Hair Color'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: eyeColorController,
                  decoration: const InputDecoration(labelText: 'Eye Color'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Close the customization dialog
                    Navigator.pop(context);

                    // Perform validation (for demonstration, just print values)
                    if (nameController.text.isNotEmpty &&
                        hairColorController.text.isNotEmpty &&
                        eyeColorController.text.isNotEmpty) {
                      Character customizedCharacter = Character(
                        name: nameController.text,
                        hairColor: hairColorController.text,
                        eyeColor: eyeColorController.text,
                      );

                      // Display the customized character details
                      _showCustomizedCharacterDetails(
                          context, customizedCharacter);
                    } else {
                      // Display an error message for incomplete input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Create Character'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show the customized character details
  void _showCustomizedCharacterDetails(
      BuildContext context, Character character) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Customized Character Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${character.name}'),
              Text('Hair Color: ${character.hairColor}'),
              Text('Eye Color: ${character.eyeColor}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the details dialog
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
