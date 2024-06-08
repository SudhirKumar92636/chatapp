import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ChatTile extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String lastChat;
  final String lastTime;

  const ChatTile({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
  }) : super(key: key);

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35), // Adjust the value as needed
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(widget.name),
        subtitle: Text(widget.lastChat),
        trailing: Text(widget.lastTime),
      ),
    );
  }
}
