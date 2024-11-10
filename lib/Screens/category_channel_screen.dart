import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv_new_app/Screens/video_screen.dart';
import 'package:iptv_new_app/components/channel_card.dart';
import 'package:iptv_new_app/models/channel_stream_model.dart';

class CategoryChannelScreen extends StatefulWidget {
  const CategoryChannelScreen({super.key, required this.categoryID});
  final String categoryID;

  @override
  State<CategoryChannelScreen> createState() => _CategoryChannelScreenState();
}

class _CategoryChannelScreenState extends State<CategoryChannelScreen> {
  List<ChannelStreamModel> categoryChannelList =
      []; // initialize with your channel data

  @override
  void initState() {
    super.initState();
    loadChannelData();
  }

  Future<void> loadChannelData() async {
    // Load and parse the json file
    final String jsonContent =
        await rootBundle.loadString('assets/data/channelStream.json'); // path

    //parse
    final List<dynamic> jsonData = json.decode(jsonContent);
    final List<ChannelStreamModel> channels = jsonData
        .map((dynamic json) => ChannelStreamModel.fromJson(json))
        .toList();

    setState(() {
      categoryChannelList = channels
          .where((channelItem) => channelItem.categories.any((category) =>
              categoryValues.reverse[category] == widget.categoryID))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryID),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.builder(
          itemCount: categoryChannelList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoApp(channelUrl: categoryChannelList[index].url),
                    ));
              },
              child: ChannelCard(
                  channelName: categoryChannelList[index].name,
                  channelLogo: categoryChannelList[index].logo,
                  channelUrl: categoryChannelList[index].url),
            );
          },
        ),
      )),
    );
  }
}
