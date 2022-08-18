class EidAlKiyamaModel {
  int day;
  String month;
  int year;
  EidAlKiyamaModel({
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
