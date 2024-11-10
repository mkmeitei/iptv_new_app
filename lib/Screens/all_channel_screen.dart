import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptv_new_app/Screens/video_screen.dart';
import 'package:iptv_new_app/components/channel_card.dart';
import 'package:iptv_new_app/models/channel_stream_model.dart';

class AllChannelScreen extends StatefulWidget {
  const AllChannelScreen({super.key});

  @override
  State<AllChannelScreen> createState() => _AllChannelScreenState();
}

class _AllChannelScreenState extends State<AllChannelScreen> {
  List<ChannelStreamModel> channelList =
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
      channelList = channels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All channels'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: channelList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoApp(channelUrl: channelList[index].url),
                    ));
              },
              child: ChannelCard(
                  channelName: channelList[index].name,
                  channelLogo: channelList[index].logo,
                  channelUrl: channelList[index].url),
            );
          },
        ),
      ),
    );
  }
}
