import 'package:flutter/material.dart';





/// --------------------------------------------------------------
/// [TagList]
/// 
/// A Flutter widget demonstrating the use of the Wrap widget to
/// create a flow-based layout for displaying a list of tags.
/// 
/// **Explanation:**
/// 
/// - The `TagList` class creates a Wrap widget containing a list
///   of `TagItem` widgets, allowing tags to flow in a flexible layout.
/// 
/// - The `spacing` property sets the horizontal space between
///   individual tags, enhancing visual separation.
/// 
/// - The `runSpacing` property sets the vertical space between
///   lines of tags, ensuring proper spacing in both directions.
/// 
/// **TagItem:**
/// 
/// - Each `TagItem` represents a tag and is implemented as a `Chip`
///   with a blue background, creating a visually distinct tag style.
/// 
/// - The `Chip` widget is commonly used for tag-like elements and
///   provides built-in styling for labels.
/// 
/// - The blue background and white label text enhance the visibility
///   and aesthetics of each tag.
/// 
/// **Run the App:**
/// 
/// - When you run this app, you'll observe a screen displaying a list
///   of tags using the Wrap widget.
/// 
/// - If the screen width is insufficient to display all tags in a single
///   line, the Wrap widget automatically wraps them onto the next line,
///   ensuring a flexible and responsive layout.
/// 
/// - This layout behavior is particularly useful for accommodating
///   dynamic content and varying screen sizes.
/// --------------------------------------------------------------
class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: <Widget>[
          TagItem('Flutter'),
          TagItem('Dart'),
          TagItem('Widgets'),
          TagItem('Mobile'),
          TagItem('UI'),
          TagItem('Layout'),
          TagItem('Responsive'),
          TagItem('Wrap'),
          TagItem('Flow'),
          TagItem('Example'),
        ],
      ),
    );
  }
}



/// --------------------------------------------------------------
/// [TagItem]
/// 
/// A simple Flutter widget representing a tag within the TagList.
/// 
/// **Explanation:**
/// 
/// - Each `TagItem` is implemented as a `Chip`, which is a Material
///   widget commonly used for tag-like elements.
/// 
/// - The `Chip` provides built-in styling for labels and supports
///   customization of background color, label text, and more.
/// 
/// - In this example, each tag is given a blue background and white
///   label text, creating a visually distinct and appealing appearance.
/// --------------------------------------------------------------
class TagItem extends StatelessWidget {
  final String text;

  const TagItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.blue,
      labelStyle: const TextStyle(color: Colors.white),
    );
  }
}
