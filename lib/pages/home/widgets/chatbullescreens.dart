import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
   final String message;
   final bool isComming;
   final String time;
   final String status;
   final String imagesUrl;
   
  
  const ChatBubble({super.key,
    required this.message,
    required this.isComming, 
    required this.time,
    required this.status,
    required this.imagesUrl});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: MediaQuery.sizeOf(context).width/1.3
          ),

          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(10)
              )
          ),
          child: Text(widget.message),


        ),
        const SizedBox(height: 10,),
        widget.isComming ? Text(widget.time):const Row(
          children: [
            
          ],
        )
      ],
    );
  }
}
