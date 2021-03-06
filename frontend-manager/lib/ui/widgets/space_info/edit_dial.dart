import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ucampus_lib/core/models/space.dart';

class EditDial extends StatelessWidget {
  final Space space;

  EditDial({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600.0,
        child: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayOpacity: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).accentColor,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Center(
                child: Icon(
                  Icons.developer_board,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: 'Equipamiento',
              backgroundColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.pushNamed(context, "edit_equipment", arguments: space);
              },
            ),
            SpeedDialChild(
              child: Center(
                child: Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: 'Reservable/Alquilable',
              backgroundColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.pushNamed(context, "edit_bookable", arguments: space);
              },
            ),
            SpeedDialChild(
              child: Center(
                child: Icon(
                  Icons.schedule,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: 'Disponibilidad',
              backgroundColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.pushNamed(context, "edit_availability", arguments: space);
              },
            ),
          ],
        ));
  }
}
