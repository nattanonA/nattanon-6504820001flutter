class Product {
  List<Course>? course;

  Product({this.course});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['Course'] != null) {
      course = <Course>[];
      json['Course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['Course'] = this.course!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  String? id;
  String? pdCode;
  String? pdName;
  String? linkDetail;
  String? price;
  String? images;

  Course(
      {this.id,
      this.pdCode,
      this.pdName,
      this.linkDetail,
      this.price,
      this.images});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pdCode = json['pd_code'];
    pdName = json['pd_name'];
    linkDetail = json['link_detail'];
    price = json['price'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pd_code'] = this.pdCode;
    data['pd_name'] = this.pdName;
    data['link_detail'] = this.linkDetail;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}
