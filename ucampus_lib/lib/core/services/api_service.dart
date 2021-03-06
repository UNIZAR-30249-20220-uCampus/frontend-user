import 'package:latlong/latlong.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';

enum ReservationResult { success, error }
enum CancelReservationResult { success, error }
enum AcceptReservationResult { success, error }
enum PaymentReservationResult { success, error }
enum UpdateEquipmentResult { success, error }
enum UpdateBookableResult { success, error }

abstract class ApiService {
  Future<Space> getSpaceInformation(int floor, LatLng coordinates);

  Future<List<Space>> filterSpaces(FilterCriteria criteria);

  Future<ReservationResult> makeReservation(
    Timetable time,
    String spaceID,
    bool isForRent,
    String userID
  );
 
  Future<List<Reservation>> getSpaceReservation(String spaceID);

  Future<List<Reservation>> getSpacePendingReservation(String spaceID);

  Future<List<Reservation>> getReservation(String userID);

  Future<CancelReservationResult> cancelReservation(int reservationID);

  Future<PaymentReservationResult> paymentReservation(
    int reservationID,
    Payment paymentConfirmation,
  );

  Future<AcceptReservationResult> acceptReservation(int reservationID);

  Future<UpdateEquipmentResult> updateEquipment(String spaceID, List<Equipment> newEquipment);

  Future<UpdateBookableResult> updateBookable(String spaceID, bool bookable);

  Future<UpdateBookableResult> updateLeasable(String spaceID, bool leasable);

  Future<List<Reservation>> getAllReservations();
  
}

