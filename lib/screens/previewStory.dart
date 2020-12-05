import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/story_view.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/stories.dart';
import 'package:travellingNepal/services/stories.dart';

class PreviewStories extends StatefulWidget {
  @override
  _PreviewStoriesState createState() => _PreviewStoriesState();
}

class _PreviewStoriesState extends State<PreviewStories> {
  final storyController = StoryController();

  List<Stories> stories;
  String uploadedBy;
  String location;
  String coordinate;

  @override
  void initState() {
    getAllStories();
    super.initState();
  }

  void getAllStories() async {
    List<Stories> stories = await StoriesService.fetchAllStories();

    setState(() {
      this.stories = stories;
    });
  }

  dynamic getStoryItems() {
    var myStories = stories.map((story) {
      return StoryItem.pageImage(
        url: 'http://travellingnepal.al-ayan.com/public/' + story.imagePath,
        imageFit: BoxFit.contain,
        caption: story.caption,
        controller: storyController,
      );
    });

    return myStories;
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: stories != null
              ? StoryView(
                  storyItems: [
                    StoryItem.text(
                      title: "Travelling Nepal \n Once is not enough",
                      backgroundColor: primaryColor,
                    ),
                    ...getStoryItems()
                  ],
                  onStoryShow: (storyItem) {
                    //TODO: add extra image info in banner
                  },
                  onComplete: () {
                    Navigator.of(context).pop();
                  },
                  onVerticalSwipeComplete: (v) {
                    if (v == Direction.down) {
                      Navigator.pop(context);
                    }
                  },
                  progressPosition: ProgressPosition.bottom,
                  repeat: false,
                  controller: storyController,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
