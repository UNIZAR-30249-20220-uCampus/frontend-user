import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/ui/widgets/space_info/equipment_editor.dart';

class EditEquipmentForm extends StatefulWidget {
  final Space space;
  final Function(String, List<Equipment>) onEdit;

  const EditEquipmentForm({Key key, this.space, this.onEdit}) : super(key: key);
  @override
  _EditEquipmentFormState createState() => _EditEquipmentFormState();
}

class _EditEquipmentFormState extends State<EditEquipmentForm> {
  bool showError = false;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  List<Equipment> _equipments;

  @override
  void initState() {
    super.initState();
    _equipments = widget.space.equipments;
  }

  void onEquipmentsChange(List<Equipment> equipments) {
    setState(() {
      _equipments = equipments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                    child: Text(
                      'Equipamiento de ' +
                          widget.space.uuid.replaceAll("\"", ""),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 0, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              EquipmentEditor(
                                  equipments: _equipments,
                                  onEquipmentsChange: this.onEquipmentsChange),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: RoundedLoadingButton(
              color: Theme.of(context).primaryColor,
              controller: _btnController,
              child: Text(
                'Guardar edición',
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).accentColor),
              ),
              onPressed: () async {
                widget.onEdit(widget.space.uuid, _equipments);
                _btnController.success();
                Navigator.of(context).pushReplacementNamed("/");
              }),
        )
      ],
    );
  }
}
