import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/redux/connectors/filter/apply_button.dart';
import 'package:ucampus_lib/core/redux/connectors/filter/capacity_filter.dart';
import 'package:ucampus_lib/core/redux/connectors/filter/equipment_filter.dart';
import 'package:ucampus_lib/core/redux/connectors/filter/timetable_filter.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar espacios'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: ListView(
                children: <Widget>[
                  CapacityFilterConnector(),
                  EquipmentFilterConnector(),
                  TimetableFilterConnector()
                ],
              ),
            ),
          ),
          Divider(),
          ApplyButtonConnector(),
        ],
      ),
    );
  }
}
