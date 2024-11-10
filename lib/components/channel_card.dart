import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard(
      {super.key,
      required this.channelName,
      required this.channelLogo,
      required this.channelUrl});

  final String channelName;
  final String channelLogo;
  final String channelUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(channelLogo),
            const SizedBox(height: 10,),
            Text(
              channelName,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
