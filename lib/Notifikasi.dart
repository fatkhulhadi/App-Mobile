import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NotificationItem(
            title: 'New Message',
            message: 'Tersisa 1 Kamar Lagi.',
            date: '2 hours ago',
          ),
          NotificationItem(
            title: 'Event Reminder',
            message: 'Hot Deals Promo.',
            date: 'Yesterday',
          ),
          // NotificationItem(
          //   title: 'Friend Request',
          //   message: 'You have a new friend request from Jane Doe.',
          //   date: '3 days ago',
          // ),
          // Add more NotificationItems as needed
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String date;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(message),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onTap: () {
          // Add navigation or further action when the notification is tapped
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: NotificationScreen(),
    ),
  );
}
