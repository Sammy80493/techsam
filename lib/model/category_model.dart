import 'dart:convert';

class Categories {
  final String id;
  final String image;
  final String name;

  Categories({
    this.id = '',
    this.image = '',
    this.name = '',
  });

  Categories copyWith({
    String? id,
    String? image,
    String? name,
  }) {
    return Categories(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'name': name});

    return result;
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source));

  @override
  String toString() => 'Categories(id: $id, image: $image, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Categories &&
        other.id == id &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ name.hashCode;
}

// List<Categories> categoriesItem = [
//   Categories(image: 'https://freesvg.org/img/hakim-flash-DISK.png'),
//   Categories(
//       image:
//           'https://www.euronics.ee/UserFiles/Products/Images/359757-541623-medium.png'),
//   Categories(
//       image:
//           'https://pngimg.com/uploads/hard_disc/Hard%20disc%20PNG,%20hard%20drive%20PNG%20images%20free%20download,%20HDD%20PNG_PNG12041.png'),
//   Categories(image: 'https://clipart-library.com/images/rTn9MngTR.png'),
//   Categories(
//       image:
//           'https://purepng.com/public/uploads/large/purepng.com-cpu-processorelectronicscpuprocessor-941524672626ogvtx.png'),
//   Categories(
//       image:
//           'https://static.vecteezy.com/system/resources/previews/028/051/896/original/gpu-graphic-card-in-white-or-invisible-background-png.png'),
//   Categories(
//       image:
//           'https://media.steelseriescdn.com/thumbs/catalog/items/64821/1af2600ee10f4bc5a868b8b5e00f1d62.png.500x400_q100_crop-fit_optimize.png'),
//   Categories(
//       image:
//           'https://www.vhv.rs/dpng/f/72-720542_razer-mouse-png-transparent-png.png'),
//   Categories(
//       image:
//           'https://00lvlshop.com/cdn/shop/products/mouse-pad-white-front-61ff79111545b_600x600.png?v=1644132631')
// ];

// List<Map<String, dynamic>> productCategories = [
//   {'Flash Drive': 'https://freesvg.org/img/hakim-flash-DISK.png'},
//   {
//     'Mouse Pad':
//         'https://00lvlshop.com/cdn/shop/products/mouse-pad-white-front-61ff79111545b_600x600.png?v=1644132631'
//   },
//   {
//     'Mouse':
//         'https://www.vhv.rs/dpng/f/72-720542_razer-mouse-png-transparent-png.png'
//   },
//   {
//     'Keyboard':
//         'https://media.steelseriescdn.com/thumbs/catalog/items/64821/1af2600ee10f4bc5a868b8b5e00f1d62.png.500x400_q100_crop-fit_optimize.png'
//   },
//   {
//     'Gpu':
//         'https://static.vecteezy.com/system/resources/previews/028/051/896/original/gpu-graphic-card-in-white-or-invisible-background-png.png'
//   },
//   {
//     'Processor':
//         'https://purepng.com/public/uploads/large/purepng.com-cpu-processorelectronicscpuprocessor-941524672626ogvtx.png'
//   },
//   {'Monitor': 'https://clipart-library.com/images/rTn9MngTR.png'},
//   {
//     'Ram':
//         'https://www.euronics.ee/UserFiles/Products/Images/359757-541623-medium.png'
//   },
//   {
//     'Hard drive':
//         'https://pngimg.com/uploads/hard_disc/Hard%20disc%20PNG,%20hard%20drive%20PNG%20images%20free%20download,%20HDD%20PNG_PNG12041.png'
//   }
// ];
