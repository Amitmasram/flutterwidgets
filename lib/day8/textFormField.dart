import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({Key? key}) : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  // Step 1: Create a TextEditingController
  TextEditingController _controller = TextEditingController();

  // Step 2: Create a FocusNode
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // Dispose the controllers and focus nodes when the widget is disposed
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Step 3: Use TextFormField with properties
                TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Enter your text',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onChanged: (value) {
                    print('Input changed: $value');
                  },
                  onFieldSubmitted: (value) {
                    print('Field submitted: $value');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  enabled: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  cursorColor: Colors.blue,
                  cursorWidth: 2.0,
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Step 4: Access the text using the controller
                    print('Text entered: ${_controller.text}');
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
