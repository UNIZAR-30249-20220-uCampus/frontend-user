import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_display.dart';
import 'package:device_id/device_id.dart';

class ReservationInfoCard extends StatefulWidget {
  final Reservation reservation;
  final Function(String) onCancel;

  const ReservationInfoCard({Key key, this.reservation, this.onCancel})
      : super(key: key);
  @override
  _ReservationInfoCardtate createState() => _ReservationInfoCardtate();
}

class _ReservationInfoCardtate extends State<ReservationInfoCard> {
  String _deviceid = '';
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;

    setState(() {
      _deviceid = deviceid;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onTimetableChange(Timetable initialTimetable) {}
    return Stack(
      children: <Widget>[
        Positioned(
            top: 10,
            right: 10,
            left: 10,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      title: Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 10, left: 10),
                          child: Text(
                              'Reserva de ' + widget.reservation.space.uuid,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                              ))),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Horario',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Franjas horarias en las que se ha reservado el espacio'),
                                ],
                              ),
                            ),
                            TimetableDisplay(
                              onTimetableChanged: (timetable) =>
                                  onTimetableChange(timetable),
                              initialTimetable: widget.reservation.timeTable,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Fechas',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Fechas de inicio y de fin de la reserva')
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                    child: Row(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        elevation: 4.0,
                                        onPressed: null,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.date_range,
                                                          size: 15.0,
                                                          color: Colors.black,
                                                        ),
                                                        Text(
                                                          '${widget.reservation.timeTable.startDate.day} - ${widget.reservation.timeTable.startDate.month} - ${widget.reservation.timeTable.startDate.year}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        color: Colors.white,
                                        disabledColor: Colors.white
                                      )),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    elevation: 4.0,
                                    onPressed: null,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.date_range,
                                                      size: 15.0,
                                                      color: Colors.black,
                                                    ),
                                                    Text(
                                                      '${widget.reservation.timeTable.endDate.day} - ${widget.reservation.timeTable.endDate.month} - ${widget.reservation.timeTable.endDate.year}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    color: Colors.white,
                                    disabledColor: Colors.white
                                  )
                                ]))),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Frecuencia',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Frecuencia de repetición de la reserva'),
                                  Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                      ),
                                      child: Text(
                                          EnumsStrings.reservationFrequency[
                                              widget.reservation.frecuency],
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .primaryColor))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )),
        // _deviceid == widget.reservation.userID &&
        (widget.reservation.reservationStatus == ReservationStatus.PENDING ||
                widget.reservation.reservationStatus ==
                    ReservationStatus.PENDING_PAYMENT)
            ? Positioned(
                bottom: 50,
                right: 10,
                left: 10,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      child: RoundedLoadingButton(
                          color: Theme.of(context).primaryColor,
                          controller: _btnController,
                          child: Text(
                            'Cancelar reserva',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: () async {
                            widget.onCancel(widget.reservation.reservationID);
                            _btnController.success();
                            //Navigator.of(context).pop();
                          }),
                    )))
            : Container(),
      ],
    );
  }
}