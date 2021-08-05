class AllRatesModel {
  List<Data> data;
  String rate;
  int totalPeopleRate;

  AllRatesModel({this.data, this.rate, this.totalPeopleRate});

  AllRatesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    rate = json['rate'];
    totalPeopleRate = json['total people rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['rate'] = this.rate;
    data['total people rate'] = this.totalPeopleRate;
    return data;
  }
}

class Data {
  int id;
  String rate;
  String review;
  String type;
  String ratableId;
  String userId;
  User user;

  Data(
      {this.id,
        this.rate,
        this.review,
        this.type,
        this.ratableId,
        this.userId,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    review = json['review'];
    type = json['type'];
    ratableId = json['ratable_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['review'] = this.review;
    data['type'] = this.type;
    data['ratable_id'] = this.ratableId;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  List<Null> location;

  User(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.phone,
        this.type,
        this.location});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
//    if (json['location'] != null) {
//      location = new List<Null>();
//      json['location'].forEach((v) {
//        location.add(new Null.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
//    if (this.location != null) {
//      data['location'] = this.location.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}class Location {
  String lat ;
  String long ;
  Location(this.long , this.lat) ;


  Location.fromJson(Map<String , dynamic> json ) {
    lat = json["lat"] ;
    long = json["lng"] ;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lng'] = this.long;
    data['lat'] = this.lat;


    return data ;
}
}