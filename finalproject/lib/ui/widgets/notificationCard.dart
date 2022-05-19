import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const BehindMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.black,
            foregroundColor: Colors.orange[800],
            icon: Icons.notifications_none_outlined,
            label: 'Unread',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: cardLayout,
    );
  }

  final cardLayout = Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: new LinearGradient(stops: [
          0.02,
          0.02
        ], colors: [
          Color.fromARGB(255, 233, 124, 0),
          Color.fromARGB(255, 63, 63, 63)
        ]),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: 340,
            child: Text(
              "08 April",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 124, 153),
                fontSize: 8,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 350,
              child: Text(
                "Lorem ipsum dolor sit amet, consetetur.",
                style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                ),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 350,
              child: Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                ),
              )),
        ],
      ));
}
