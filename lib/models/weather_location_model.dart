class WeatherModel {
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  List<Days>? days;

  WeatherModel(
      {this.queryCost,
        this.latitude,
        this.longitude,
        this.resolvedAddress,
        this.address,
        this.timezone,
        this.tzoffset,
        this.days});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['queryCost'] = this.queryCost;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['resolvedAddress'] = this.resolvedAddress;
    data['address'] = this.address;
    data['timezone'] = this.timezone;
    data['tzoffset'] = this.tzoffset;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  double? tempmax;
  double? tempmin;
  double? temp;
  String? conditions;

  Days({this.tempmax, this.tempmin, this.temp, this.conditions});

  Days.fromJson(Map<String, dynamic> json) {
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    conditions = json['conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tempmax'] = this.tempmax;
    data['tempmin'] = this.tempmin;
    data['temp'] = this.temp;
    data['conditions'] = this.conditions;
    return data;
  }
}
