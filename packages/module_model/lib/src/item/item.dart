class Item {
  String name;
  bool isBought;

  Item({required this.name, required this.isBought});

  Item.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name']! as String,
          isBought: json['isBought']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'isBought': isBought,
    };
  }
}
