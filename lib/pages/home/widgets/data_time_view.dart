import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  late List<Event> events;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse(
       "https://newsapi.org/v2/everything"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        events = responseData.map((data) => Event.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Schedule'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            title: Text(event.title),
            subtitle: Text(event.publishedAt.toString()),

          );
        },
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime publishedAt;

  Event({
    required this.title,
    required this.publishedAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}