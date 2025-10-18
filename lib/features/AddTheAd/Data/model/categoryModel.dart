class CategoryModel{

  final int id;
  final String name;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image
  });


  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(

    id: map['id'],
    name: map['name'],
    image: map['image'],
  );


  Map<String, dynamic> toMap() =>
      {

        'id': id,
        'name': name,
        'image': image,

      };

}