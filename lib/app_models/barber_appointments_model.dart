class BarberAppointmentsModel {
  List<Data> data;

  BarberAppointmentsModel({this.data});

  BarberAppointmentsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String appointmentDate;
  String appointmentTime;
  String day;
  String description;
  Applicant applicant;
  Barber barber;
  Salon salon;
  Null address;
  Data({this.id, this.appointmentDate, this.appointmentTime, this.day, this.description, this.applicant,
    this.barber, this.salon, this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    day = json['day'];
    description = json['description'];
    applicant = json['applicant'] != null ? new Applicant.fromJson(json['applicant']) : null;
    barber = json['barber'] != null ? new Barber.fromJson(json['barber']) : null;
    salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
    address = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['day'] = this.day;
    data['description'] = this.description;
    if (this.applicant != null) {
      data['applicant'] = this.applicant.toJson();
    }
    if (this.barber != null) {
      data['barber'] = this.barber.toJson();
    }
    if (this.salon != null) {
      data['salon'] = this.salon.toJson();
    }
    data['address'] = this.address;

    return data;
  }
}

class Applicant {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  List<List> location;

  Applicant({this.id, this.name, this.image, this.email, this.phone, this.type, this.location});

  Applicant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    return data;
  }
}

class Location {




  Location.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Barber {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  Null fees;
  List<Null> services;
  List<Null> salons;
  Null experience;
  List<Null> availability;
  List<Null> specifications;
  List<Null> ratings;

  Barber({this.id, this.name, this.image, this.email, this.phone, this.type, this.fees, this.services, this.salons, this.experience, this.availability, this.specifications, this.ratings});

  Barber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    fees = json['fees'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['fees'] = this.fees;

    return data;
  }
}

class Salon {
  int id;
  String nameEn;
  String nameAr;
  String descriptionEn;
  String descriptionAr;
  String images;
  List<Location> location;
  Category category;
  List<Barbers> barbers;

  Salon({this.id, this.nameEn, this.nameAr, this.descriptionEn, this.descriptionAr, this.images,
    this.location, this.category, this.barbers,});

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    images = json['images'];
    if (json['location'] != null) {
      location = new List<Location>();
      json['location'].forEach((v) { location.add(new Location.fromJson(v)); });
    }
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
    if (json['barbers'] != null) {
      barbers = new List<Barbers>();
      json['barbers'].forEach((v) { barbers.add(new Barbers.fromJson(v)); });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['images'] = this.images;
    if (this.location != null) {
      data['location'] = this.location.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.barbers != null) {
      data['barbers'] = this.barbers.map((v) => v.toJson()).toList();
    }

    return data;
  }
}


class Category {
  int id;
  String nameEn;
  String nameAr;
  String image;
  String type;
  List<Products> products;

  Category({this.id, this.nameEn, this.nameAr, this.image, this.type, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    type = json['type'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) { products.add(new Products.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['type'] = this.type;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String nameEn;
  String nameAr;
  String price;
  String image;
  String descriptionEn;
  String descriptionAr;
  String quantity;
  List<Null> ratings;
  String categoryId;

  Products({this.id, this.nameEn, this.nameAr, this.price, this.image, this.descriptionEn, this.descriptionAr, this.quantity, this.ratings, this.categoryId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    price = json['price'];
    image = json['image'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    quantity = json['quantity'];

    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['quantity'] = this.quantity;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Barbers {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String type;
  String fees;
  List<Services> services;
  String experience;
  List<Availability> availability;
  List<Specifications> specifications;
  List<Ratings> ratings;

  Barbers({this.id, this.name, this.image, this.email, this.phone, this.type, this.fees, this.services, this.experience, this.availability, this.specifications, this.ratings});

  Barbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    fees = json['fees'];
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) { services.add(new Services.fromJson(v)); });
    }
    experience = json['experience'];
    if (json['availability'] != null) {
      availability = new List<Availability>();
      json['availability'].forEach((v) { availability.add(new Availability.fromJson(v)); });
    }
    if (json['specifications'] != null) {
      specifications = new List<Specifications>();
      json['specifications'].forEach((v) { specifications.add(new Specifications.fromJson(v)); });
    }
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) { ratings.add(new Ratings.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['fees'] = this.fees;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    data['experience'] = this.experience;
    if (this.availability != null) {
      data['availability'] = this.availability.map((v) => v.toJson()).toList();
    }
    if (this.specifications != null) {
      data['specifications'] = this.specifications.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int id;
  String nameEn;
  String nameAr;

  Services({this.id, this.nameEn, this.nameAr});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class Availability {
  int id;
  String day;
  String startTime;
  String endDate;
  String date;

  Availability({this.id, this.day, this.startTime, this.endDate, this.date});

  Availability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_date'] = this.endDate;
    data['date'] = this.date;
    return data;
  }
}

class Specifications {
  int id;
  String nameEn;
  String nameAr;
  String image;

  Specifications({this.id, this.nameEn, this.nameAr, this.image});

  Specifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    return data;
  }
}

class Ratings {
  int id;
  String rate;
  String review;
  String type;
  String ratableId;
  String userId;
  Applicant user;

  Ratings({this.id, this.rate, this.review, this.type, this.ratableId, this.userId, this.user});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    review = json['review'];
    type = json['type'];
    ratableId = json['ratable_id'];
    userId = json['user_id'];
    user = json['user'] != null ? new Applicant.fromJson(json['user']) : null;
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


