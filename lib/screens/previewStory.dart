import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';

class PreviewStories extends StatefulWidget {
  @override
  _PreviewStoriesState createState() => _PreviewStoriesState();
}

class _PreviewStoriesState extends State<PreviewStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoryView(
          storyItems: [
            StoryItem.text(
              title:
                  "I guess you'd love to see more of our food. That's great.",
              backgroundColor: Colors.blue,
            ),
            StoryItem.text(
              title: "Nice!\n\nTap to continue.",
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                fontFamily: 'Dancing',
                fontSize: 40,
              ),
            ),
            StoryItem.pageImage(
              url: "http://aakritsubedi.com.np/images/profile_new.jpg",
              caption: "Still sampling",
              controller: storyController,
            ),
            StoryItem.pageImage(
                url: "http://aakritsubedi.com.np/images/profile_new.jpg",
                caption: "Working with gifs",
                controller: storyController),
            StoryItem.pageImage(
              url: "http://aakritsubedi.com.np/images/profile_new.jpg",
              caption: "Hello, from the other side",
              controller: storyController,
            ),
            StoryItem.pageImage(
              url: "http://aakritsubedi.com.np/images/profile_new.jpg",
              caption: "Hello, from the other side2",
              controller: storyController,
            ),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            print("Completed a cycle");
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
        ),
      ),
    );
  }
}
