
import 'package:chatapp/modles/userModles.dart';

class ChatRoomModles {
  String? id;
  UserModles? sender;
  UserModles? receiver;
  List<ChatRoomModles>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimesatmp;
  String? timestamp;

  ChatRoomModles({this.id, this.sender, this.receiver, this.messages, this.unReadMessNo, this.lastMessage, this.lastMessageTimesatmp, this.timestamp});

  ChatRoomModles.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["sender"] is Map) {
      sender = json["sender"] == null ? null : UserModles.fromJson(json["sender"]);
    }
    if(json["receiver"] is Map) {
      receiver = json["receiver"] == null ? null : UserModles.fromJson(json["receiver"]);
    }
    if(json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if(json["unReadMessNo"] is int) {
      unReadMessNo = json["unReadMessNo"];
    }
    if(json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if(json["lastMessageTimesatmp"] is String) {
      lastMessageTimesatmp = json["lastMessageTimesatmp"];
    }
    if(json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if(receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if(messages != null) {
      _data["messages"] = messages;
    }
    _data["unReadMessNo"] = unReadMessNo;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimesatmp"] = lastMessageTimesatmp;
    _data["timestamp"] = timestamp;
    return _data;
  }
}


 