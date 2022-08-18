class SomElBa3outhModel {
  int day;
  String month;
  int year;
  SomElBa3outhModel({
    this.day = 0,
    this.month = "",
    this.year = 0,
  });
  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class SomElKabirModel {
  int day;
  String month;
  int year;
  SomElKabirModel({
    this.day = 0,
    this.month = "",
    this.year = 0,
  });
  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class EidElSou3oudModel {
  int? day;
  String? month;
  int? year;
  EidElSou3oudModel({
    this.day,
    this.month,
    this.year,
  });
  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}
