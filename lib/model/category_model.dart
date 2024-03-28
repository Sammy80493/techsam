import 'dart:convert';

class Categories {
  final String imgPath;
  final String name;

  Categories({
    this.imgPath = '',
    this.name = '',
  });

  Categories copyWith({
    String? imgPath,
    String? name,
  }) {
    return Categories(
      imgPath: imgPath ?? this.imgPath,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'imgPath': imgPath});
    result.addAll({'name': name});

    return result;
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      imgPath: map['imgPath'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source));

  @override
  String toString() => 'Categories(imgPath: $imgPath, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Categories &&
        other.imgPath == imgPath &&
        other.name == name;
  }

  @override
  int get hashCode => imgPath.hashCode ^ name.hashCode;
}

// List<Categories> categoriesItem = [
//   Categories(imgPath: 'https://freesvg.org/img/hakim-flash-DISK.png'),
//   Categories(
//       imgPath:
//           'https://www.euronics.ee/UserFiles/Products/Images/359757-541623-medium.png'),
//   Categories(
//       imgPath:
//           'https://pngimg.com/uploads/hard_disc/Hard%20disc%20PNG,%20hard%20drive%20PNG%20images%20free%20download,%20HDD%20PNG_PNG12041.png'),
//   Categories(imgPath: 'https://clipart-library.com/images/rTn9MngTR.png'),
//   Categories(
//       imgPath:
//           'https://purepng.com/public/uploads/large/purepng.com-cpu-processorelectronicscpuprocessor-941524672626ogvtx.png'),
//   Categories(
//       imgPath:
//           'https://static.vecteezy.com/system/resources/previews/028/051/896/original/gpu-graphic-card-in-white-or-invisible-background-png.png'),
//   Categories(
//       imgPath:
//           'https://media.steelseriescdn.com/thumbs/catalog/items/64821/1af2600ee10f4bc5a868b8b5e00f1d62.png.500x400_q100_crop-fit_optimize.png'),
//   Categories(
//       imgPath:
//           'https://www.vhv.rs/dpng/f/72-720542_razer-mouse-png-transparent-png.png'),
//   Categories(
//       imgPath:
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
