import 'package:flutter/material.dart';

class ChatBubbleScreens extends StatefulWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imagesUrl;

  const ChatBubbleScreens({
    Key? key,
    required this.message,
    required this.isComming,
    required this.time,
    required this.status,
    required this.imagesUrl,
  }) : super(key: key);

  @override
  State<ChatBubbleScreens> createState() => _ChatBubbleScreensState();
}

class _ChatBubbleScreensState extends State<ChatBubbleScreens> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: widget.isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.3,
              minWidth: 0,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius:widget.isComming? const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(10)
              ): const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(0)
              ),
              
            ),
            child: widget.imagesUrl == "" ? Text(widget.message):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius:BorderRadius.circular(10) ,
                    child: Image.network(widget.imagesUrl)),
                const SizedBox(height: 10,),
                Text(widget.message)],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: widget.isComming?MainAxisAlignment.start:MainAxisAlignment.end,
              children: [
                widget.isComming?
               Text(widget.time,style: Theme.of(context).textTheme.labelMedium,):Row(
                  children: [
                    Text(widget.time,style: Theme.of(context).textTheme.labelMedium,),
                    const SizedBox(width: 10,),
                    Image.asset("assets/Icons/correct.png",width: 20,),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
