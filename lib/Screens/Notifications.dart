import 'package:flutter/material.dart';
import 'package:genie_money/Utils/utils.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [
    NotificationModel(
      title: 'New Message',
      subtitle: 'You have a new message from John Doe.',
      time: '12:30 PM',
      date: 'July 14, 2023',
      iconData: Icons.mail,
      iconColor: Colors.blue,
    ),
    NotificationModel(
      title: 'Friend Request',
      subtitle: 'You have a new friend request from Jane Smith.',
      time: '3:45 PM',
      date: 'July 15, 2023',
      iconData: Icons.person_add,
      iconColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: navyBlueColor,
        title: Text('Notifications',style: TextStyle(color:kWhite,),),
         leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kWhite,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      ),
        backgroundColor: kWhite,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildNotificationCard(notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    
    return Card(
       color: navyBlueColor,
    //   child: ListTile(
    //      shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(5.0),
    //       side: BorderSide(
    //         color: Colors.orange, // Set the border color here
    //         width: 2.0, // Set the border width here
    //       ),
    //     ),
    //    // tileColor: Colors.white, 
    //     leading: Icon(
    //       notification.iconData,
    //       color: notification.iconColor,
    //        size: 45,
    //     ),
        
    //     title: Text(notification.title, style: TextStyle(color: Color(0xFFFFAE00),), ),
    //     subtitle: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(notification.subtitle, style: TextStyle(color: Color.fromARGB(255, 233, 191, 101),),),
    //         SizedBox(height: 4),
    //         Text(
    //           '${notification.time} - ${notification.date}',
    //           style: TextStyle(
    //             fontSize: 12,
    //             color: Color.fromARGB(255, 233, 191, 101),
    //           ),
    //         ),
    //       ],
    //     ),
    //     trailing: IconButton(
    //       icon: Icon(Icons.delete),
    //       color: Color(0xFFFFAE00), 
    //       onPressed: () {
    //         showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //        backgroundColor:  Color(0xFF3A3A3A),
    //             shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       side: BorderSide(
    //         color: Colors.orange, // Set the border color here
    //         width: 2.0, // Set the border width here
    //       ),
    //     ),
    //       title: Text('GenieMoneyy',style: TextStyle(color: Color(0xFFFFAE00),),),
    //       content: Text('Do you want to delete this message?',style: TextStyle(color: Color(0xFFFFAE00),),),
    //       actions: <Widget>[
    //         ElevatedButton(
    //           style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Set the background color of the button
    // ),
    //           child: Text('No'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //         ElevatedButton(
    //           style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Set the background color of the button
    // ),
    //           child: Text('Yes',),
    //           onPressed: () {
    //             setState(() {
    //               notifications.remove(notification);
    //             });
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
    //       },
    //     ),
    //   ),
    );
  }
}

class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final IconData iconData;
  final Color iconColor;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    required this.iconData,
    required this.iconColor,
  });
}
