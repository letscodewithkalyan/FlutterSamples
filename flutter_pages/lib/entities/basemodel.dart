abstract class BaseModel {
  Map<String, dynamic> toJson();
  static T? fromJson<T extends BaseModel>(dynamic map){}
}
