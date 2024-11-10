import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv_new_app/Screens/video_screen.dart';
import 'package:iptv_new_app/components/channel_card.dart';
import 'package:iptv_new_app/models/unknown_channel_model.dart';

class UnknownChannelScreen extends StatefulWidget {
  const UnknownChannelScreen({super.key});

  @override
  State<UnknownChannelScreen> createState() => _UnknownChannelScreenState();
}

class _UnknownChannelScreenState extends State<UnknownChannelScreen> {
  List<UnknownChannelModel> unknownChannelList =
      []; // initialize with your channel data

  @override
  void initState() {
    super.initState();
    loadChannelData();
  }

  Future<void> loadChannelData() async {
    // Load and parse the json file
    final String jsonContent = await rootBundle
        .loadString('assets/data/channelStream(NM).json'); // path

    //parse
    final List<dynamic> jsonData = json.decode(jsonContent);
    final List<UnknownChannelModel> channels = jsonData
        .map((dynamic json) => UnknownChannelModel.fromJson(json))
        .toList();

    setState(() {
      unknownChannelList = channels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unknown Channels'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: unknownChannelList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoApp(channelUrl: unknownChannelList[index].url),
                    ));
              },
              child: ChannelCard(
                  channelUrl: unknownChannelList[index].url,
                  channelLogo:
                      'https://www.gstatic.com/webp/gallery/1.webp',
                  channelName: unknownChannelList[index].url),
            );
          },
        ),
      ),
    );
  }
}
