// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ThoughtsMessages {
  final String id;
  final String senderName;
  final String message;

  ThoughtsMessages(this.id, this.senderName, this.message);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderName': senderName,
      'message': message,
    };
  }

  factory ThoughtsMessages.fromMap(Map<String, dynamic> map) {
    return ThoughtsMessages(
      map['id'] as String,
      map['senderName'] as String,
      map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThoughtsMessages.fromJson(String source) =>
      ThoughtsMessages.fromMap(json.decode(source) as Map<String, dynamic>);
}
