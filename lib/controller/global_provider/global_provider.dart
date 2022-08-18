import 'package:beirutinexample/model/ases_el_sene_model.dart';
import 'package:beirutinexample/data/data.dart';
import 'package:beirutinexample/data/data.dart';
import 'package:beirutinexample/model/eid_al_kiyama_model.dart';
import 'package:beirutinexample/model/maraji3_al_kiyama_model.dart';
import 'package:beirutinexample/model/sabou3at.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalProvider extends ChangeNotifier {
  AsesElSeneModel _asesElSeneModel = AsesElSeneModel();
  Maraji3AlKiyamaModel _maraji3alKiyamaModel = Maraji3AlKiyamaModel();
  EidAlKiyamaModel _eidAlKiyamaModel = EidAlKiyamaModel();
  String _asesElSeneString = "";
  String _maraji3AlKiyamaString = "";
  String _eidAlKiyamaString = "";

  AsesElSeneModel get asesElSeneModel => _asesElSeneModel;
  Maraji3AlKiyamaModel get maraji3alKiyamaModel => _maraji3alKiyamaModel;
  EidAlKiyamaModel get eidAlKiyamaModel => _eidAlKiyamaModel;
  String get asesElSeneString => _asesElSeneString;
  String get maraji3AlKiyamaString => _maraji3AlKiyamaString;
  String get eidAlKiyamaString => _eidAlKiyamaString;

  calculateAsesElSene(int currentYear) {
    _asesElSeneModel = AsesElSeneModel();

    int _initialNumber = 0;
    _initialNumber = (currentYear - 1900).abs();
    while (_initialNumber > 0 && _initialNumber - 28 > 0) {
      _initialNumber = _initialNumber - 28;
    }
    if (_initialNumber % 4 == 0) {
      int dividerNumber = (_initialNumber / 4).round();
      var entryList = arkamAsasElSana.entries.toList();
      var currentIndex = entryList[dividerNumber - 1].key;
      _asesElSeneModel.initial = bRowList[_initialNumber - 1];
      _asesElSeneModel.secondary = currentIndex;
    } else {
      _asesElSeneModel.initial = bRowList[_initialNumber - 1];
    }

    if (_asesElSeneModel.secondary == 0) {
      _asesElSeneString = _asesElSeneModel.initial.toString();
    } else {
      _asesElSeneString = _asesElSeneModel.initial.toString() +
          "\(" +
          _asesElSeneModel.secondary.toString() +
          "\)";
    }
  }

  calculateMaraji3ElKiyama(int currentYear) {
    int _initialNumber = 0;
    _initialNumber = (currentYear - 1898).abs();
    while (_initialNumber > 0 && _initialNumber - 19 > 0) {
      _initialNumber = _initialNumber - 19;
    }
    _maraji3alKiyamaModel.first = maraje3AlKiyama[_initialNumber]['first'];
    _maraji3alKiyamaModel.last = maraje3AlKiyama[_initialNumber]['last'];
    _maraji3AlKiyamaString =
        maraje3AlKiyama[_initialNumber]['first'].toString() +
            " - " +
            maraje3AlKiyama[_initialNumber]['last'].toString();
  }

  calculateEdiAlKiyama(int currentYear) {
    _eidAlKiyamaModel = EidAlKiyamaModel();
    _eidAlKiyamaModel.year = currentYear;
    int t1 = 0;

    if (_asesElSeneModel.secondary != 0) {
      t1 = (_maraji3alKiyamaModel.last + _asesElSeneModel.secondary);
    } else {
      t1 = (_maraji3alKiyamaModel.last + _asesElSeneModel.initial);
    }
    int firstTotal = 0;
    if (t1 > 7) {
      firstTotal = t1 - 7;
    } else {
      firstTotal = t1;
    }

    if (firstTotal == 7) {
      if (_maraji3alKiyamaModel.first < 20) {
        _eidAlKiyamaModel.month = listOfMonths[4]!;
      } else {
        _eidAlKiyamaModel.month = listOfMonths[3]!;
      }
      int addedTotal = 0;
      if (_maraji3alKiyamaModel.first == 17 ||
          _maraji3alKiyamaModel.first == 18) {
        addedTotal = 1;
      } else {
        addedTotal = 8;
      }
      int secondTotal = addedTotal + _maraji3alKiyamaModel.first;
      if (secondTotal > 31) {
        _eidAlKiyamaModel.month = listOfMonths[4]!;
        _eidAlKiyamaModel.day = secondTotal - 31;
      } else {
        _eidAlKiyamaModel.day = secondTotal;
      }
    } else {
      int addedTotal = 0;
      switch (firstTotal) {
        case 1:
          addedTotal = 7;
          break;
        case 2:
          addedTotal = 6;
          break;
        case 3:
          addedTotal = 5;
          break;
        case 4:
          addedTotal = 4;
          break;
        case 5:
          addedTotal = 3;
          break;
        case 6:
          addedTotal = 2;
          break;
        case 7:
          addedTotal = 1;
          break;

        default:
      }
      int secondTotal = addedTotal + _maraji3alKiyamaModel.first;
      int thirdTotal = secondTotal - 31;
      int thirdTotalAbsolute = thirdTotal.abs();
      if (_maraji3alKiyamaModel.first < 20) {
        _eidAlKiyamaModel.month = listOfMonths[4]!;
      } else {
        _eidAlKiyamaModel.month = listOfMonths[3]!;
      }
      if (secondTotal > 31) {
        _eidAlKiyamaModel.month = listOfMonths[4]!;
        _eidAlKiyamaModel.day = secondTotal - 31;
      } else {
        _eidAlKiyamaModel.day = secondTotal;
      }
    }
    _eidAlKiyamaString =
        _eidAlKiyamaModel.day.toString() + "-" + _eidAlKiyamaModel.month;
  }

  SomElBa3outhModel _somElBa3outhModel = SomElBa3outhModel();
  String _somElBa3outhString = "";
  SomElBa3outhModel get somElBa3outhModel => _somElBa3outhModel;
  String get somElBa3outhString => _somElBa3outhString;

  /// whether or not is leap year
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  calculateSomElBa3outh(int currentYear) {
    _somElBa3outhModel.year = currentYear;

    /// get arkam el ba3outh
    int arkamElBa3outh = 0;
    bool checkIsLeapYear = isLeapYear(currentYear);
    if (checkIsLeapYear) {
      arkamElBa3outh = listOfArkamElBa3outh['leapYear']!;
    } else {
      arkamElBa3outh = listOfArkamElBa3outh['normalYear']!;
    }

    /// get som el ba3outh day
    int t1 = arkamElBa3outh + _eidAlKiyamaModel.day;
    if (t1 > 31) {
      int t2 = t1 - 31;
      _somElBa3outhModel.day = t2;
    } else {
      _somElBa3outhModel.day = t1;
    }

    /// get kiyama date
    String formattedDate = currentYear.toString() +
        "-" +
        _eidAlKiyamaModel.month +
        "-" +
        _eidAlKiyamaModel.day.toString();
    DateTime kiyamaDate = new DateFormat('yyyy-MMMM-dd').parse(formattedDate);
    DateTime startDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-March-1");
    DateTime endDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-April-10");
    if (kiyamaDate.difference(startDate).inDays == 0 ||
        kiyamaDate.difference(endDate).inDays == 0 ||
        kiyamaDate.isAfter(startDate) && kiyamaDate.isBefore(endDate)) {
      _somElBa3outhModel.month = listOfMonths[1]!;
    } else {
      _somElBa3outhModel.month = listOfMonths[2]!;
    }
    if (kiyamaDate.difference(endDate).inDays == 0) {
      /// check if its a leap year
      bool result = isLeapYear(currentYear);
      if (result) {
        _somElBa3outhModel.month = listOfMonths[2]!;
      }
    }
    _somElBa3outhString =
        _somElBa3outhModel.day.toString() + "-" + _somElBa3outhModel.month;
  }

  SomElKabirModel _somElKabirModel = SomElKabirModel();
  String _somElKabirString = "";

  SomElKabirModel get somElKabirModel => _somElKabirModel;
  String get somElKabirString => _somElKabirString;

  calculateAlSomeAlKabir(int currentYear) {
    _somElKabirModel.year = currentYear;
    int arkamElSom = 0;
    bool checkIsLeapYear = isLeapYear(currentYear);
    if (checkIsLeapYear) {
      arkamElSom = listOfAlSomAlKabir['leapYear']!;
    } else {
      arkamElSom = listOfAlSomAlKabir['normalYear']!;
    }

    String formattedDate = currentYear.toString() +
        "-" +
        _eidAlKiyamaModel.month +
        "-" +
        _eidAlKiyamaModel.day.toString();
    DateTime kiyamaDate = new DateFormat('yyyy-MMMM-dd').parse(formattedDate);
    DateTime startDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-March-1");
    DateTime endDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-April-18");
    if (kiyamaDate.difference(startDate).inDays == 0 ||
        kiyamaDate.difference(endDate).inDays == 0 ||
        kiyamaDate.isAfter(startDate) && kiyamaDate.isBefore(endDate)) {
      _somElKabirModel.month = listOfMonths[2]!;
    } else {
      _somElKabirModel.month = listOfMonths[3]!;
    }

    /// get some el kabir day
    int t1 = arkamElSom + _eidAlKiyamaModel.day;
    if (_somElKabirModel.month == listOfMonths[3]!) {
      if (checkIsLeapYear) {
        int t2 = t1 - 29;
        _somElKabirModel.day = t2;
      } else {
        int t2 = t1 - 28;
        _somElKabirModel.day = t2;
      }
    } else {
      if (t1 > 31) {
        int t2 = t1 - 31;
        _somElKabirModel.day = t2;
      } else {
        _somElKabirModel.day = t1;
      }
    }
    _somElKabirString =
        _somElKabirModel.day.toString() + "-" + _somElKabirModel.month;
  }

  EidElSou3oudModel _eidElSou3oudModel = EidElSou3oudModel();
  String _eidElSou3oudString = "";

  EidElSou3oudModel get eidElSou3oudModel => _eidElSou3oudModel;
  String get eidElSou3oudString => _eidElSou3oudString;

  calculateEidElSou3oud(int currentYear) {
    _eidElSou3oudModel.year = currentYear;
    int arkamEidElSou3oud = 9;
    String formattedDate = currentYear.toString() +
        "-" +
        _eidAlKiyamaModel.month +
        "-" +
        _eidAlKiyamaModel.day.toString();
    DateTime kiyamaDate = new DateFormat('yyyy-MMMM-dd').parse(formattedDate);
    DateTime startDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-March-1");
    DateTime endDate =
        new DateFormat('yyyy-MMMM-dd').parse("$currentYear-April-22");
    if (kiyamaDate.difference(startDate).inDays == 0 ||
        kiyamaDate.difference(endDate).inDays == 0 ||
        kiyamaDate.isAfter(startDate) && kiyamaDate.isBefore(endDate)) {
      _eidElSou3oudModel.month = listOfMonths[5]!;
    } else {
      _eidElSou3oudModel.month = listOfMonths[6]!;
    }

    /// get eid el sou3oud day
    int t1 = arkamEidElSou3oud + _eidAlKiyamaModel.day;
    if (t1 > 31) {
      int t2 = t1 - 31;
      _eidElSou3oudModel.day = t2;
    } else {
      _eidElSou3oudModel.day = t1;
    }
    _eidElSou3oudString =
        _eidElSou3oudModel.day.toString() + "-" + _eidElSou3oudModel.month!;

    print(_eidElSou3oudModel.toJson());
  }

  getAllResults(int currentYear) {
    if (currentYear > 0) {
      calculateAsesElSene(currentYear);
      calculateMaraji3ElKiyama(currentYear);
      calculateEdiAlKiyama(currentYear);
      calculateSomElBa3outh(currentYear);
      calculateAlSomeAlKabir(currentYear);
      calculateEidElSou3oud(currentYear);
      notifyListeners();
    }
  }
}
