import 'dart:convert';

class Products {
  final String id;
  final String image;
  final double price;
  final String status;
  final String name;
  final bool isFavourite;
  final String description;
  final int qty;

  Products({
    required this.id,
    required this.image,
    required this.price,
    required this.status,
    required this.name,
    required this.isFavourite,
    required this.description,
    required this.qty,
  });

  Products copyWith({
    String? id,
    String? image,
    double? price,
    String? status,
    String? name,
    bool? isFavourite,
    String? description,
    int? qty,
  }) {
    return Products(
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
      status: status ?? this.status,
      name: name ?? this.name,
      isFavourite: isFavourite ?? this.isFavourite,
      description: description ?? this.description,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'price': price});
    result.addAll({'status': status});
    result.addAll({'name': name});
    result.addAll({'isFavourite': isFavourite});
    result.addAll({'description': description});
    result.addAll({'qty': qty});

    return result;
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      status: map['status'] ?? '',
      name: map['name'] ?? '',
      isFavourite: map['isFavourite'] ?? false,
      description: map['description'] ?? '',
      qty: map['qty']?.toInt() ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(id: $id, image: $image, price: $price, status: $status, name: $name, isFavourite: $isFavourite, description: $description, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Products &&
        other.id == id &&
        other.image == image &&
        other.price == price &&
        other.status == status &&
        other.name == name &&
        other.isFavourite == isFavourite &&
        other.description == description &&
        other.qty == qty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        price.hashCode ^
        status.hashCode ^
        name.hashCode ^
        isFavourite.hashCode ^
        description.hashCode ^
        qty.hashCode;
  }
}

// List<Products> productsItems = [
//   //Mouse Pad
//   Products(
//       id: 1,
//       image:
//           'https://media.steelseriescdn.com/thumbs/catalog/items/63381/4901ce3edc6d47b8afaa01347a87333c.png.1200x627_q100_crop-fit_optimize.png',
//       price: '5.0',
//       status: 'pending',
//       name: 'SteelSeries',
//       isFavourite: false,
//       description:
//           'SteelSeries mouse pads are renowned for their quality and performance in the gaming community. These mouse pads are designed with a focus on precision, durability, and comfort, making them popular among gamers and professionals alike. Overall, SteelSeries mouse pads are trusted by gamers worldwide for their combination of performance, durability, and customization options, making them a popular choice for both casual and competitive gaming.'),
//   Products(
//       id: 2,
//       image:
//           'https://www.spicybaboon.com.au/cdn/shop/products/choo-choo-choose-you-mouse-pad-40337608507677_1800x.png?v=1674536742',
//       price: '9.5',
//       status: 'pending',
//       name: 'Choo Choo Choose You 🖱️🚂- Mouse Pad',
//       isFavourite: false,
//       description: 'Nice mouse pad for office, gaming and music studios'),
//   Products(
//       id: 3,
//       image:
//           'https://akkogear.eu/cdn/shop/products/1_edafa161-c161-4d39-8aa7-4761392b1fc5.png?v=1692101001&width=2000',
//       price: '25.5',
//       status: 'pending',
//       name: 'Akko 7th Anniversary Mouse Pad',
//       isFavourite: false,
//       description: 'Nice mouse pad for office, gaming and music studio 900*400mm'),
//   Products(
//       id: 4,
//       image:
//           'https://th-store.msi.com/cdn/shop/products/1024_3_a0672dcd-816f-4cfd-98b2-d41139efbb2e_876x700.png?v=1678964042',
//       price: '12.5',
//       status: 'pending',
//       name: 'MSI GAMING MOUSE PAD AGILITY GD60 RGB MICRO TEXTURED CLOTH',
//       isFavourite: false,
//       description:
//           '6 lighting colors with multiple lighting effects and clear brightness. The polygon shaped control box with a button, allowing color switching by one simple click.'),
//   Products(
//       id: 5,
//       image:
//           'https://www.pulsar.gg/cdn/shop/products/PulsarxDemonSlayerES23mmXLgamingmousepad_Tanjiro_01-384776_1024x.png?v=1708009172',
//       price: '38.5',
//       status: 'pending',
//       name: '[Demon Slayer] ES2 TANJIRO eSports Mousepad 3mm XL (Medium Speed)',
//       isFavourite: false,
//       description: 'Demon Slayer Tanjiro'),
//   Products(
//       id: 6,
//       image:
//         'https://www.pulsar.gg/cdn/shop/products/PulsarxDemonSlayerES23mmXLgamingmousepad_Nezuko_01-873543_large.png?v=1708009172',
//       price: '38.5',
//       status: 'pending',
//       name: '[Demon Slayer] ES2 NEZUKO eSports Mousepad 3mm XL (Medium Speed)',
//       isFavourite: false,
//       description: 'Demon Slayer NEZUKO'),
//   Products(
//       id: 7,
//       image:
//           'https://www.pulsar.gg/cdn/shop/products/PulsarxDemonSlayerES23mmXLgamingmousepad_Zenitsu_01-540718_large.png?v=1708009172',
//       price: '36.5',
//       status: 'pending',
//       name: '[Demon Slayer] ES2 ZENITSU eSports Mousepad 3mm XL (Medium Speed)',
//       isFavourite: false,
//       description: 'Demon Slayer ZENITSU'),
//   Products(
//       id: 8,
//       image:
//           'https://www.pulsar.gg/cdn/shop/products/PulsarxDemonSlayerES23mmXLgamingmousepad_Inosuke_01-347474_large.png?v=1708009172',
//       price: '36.5',
//       status: 'pending',
//       name: '[Demon Slayer] ES2 INOSUKE eSports Mousepad 3mm XL (Medium Speed)',
//       isFavourite: false,
//       description: 'Demon Slayer INOSUKE'),

//   //Mouse
//   Products(
//       id: 9,
//       image:
//           'https://images.jdmagicbox.com/quickquotes/images_main/hp-computer-mouses-01-06-2021-447-227144883-0g8c9.png',
//       price: '20.5',
//       status: 'pending',
//       name: 'HP Omen Mouse',
//       isFavourite: false,
//       description: 'Omen Mouse sweetable for gaming and office work'),
//   Products(
//       id: 10,
//       image:
//           'https://cdn.sotel.de/images/1001063304/razer-cobra-kabelgebundene-usb-gaming-maus-58g-leichtbauweis-001.jpg',
//       price: '25.5',
//       status: 'pending',
//       name: 'Razer COBRA mouse Right-hand',
//       isFavourite: false,
//       description: 'Razer COBRA mouse Right-hand USB Type-A Optical 8500 DPI'),
//   Products(
//       id: 11,
//       image:
//           'https://muscat.gccgamers.com/razer-orochi-v2-wireless-ultra/assets/product.webp',
//       price: '23.1',
//       status: 'pending',
//       name: 'Razer Orochi V2 Ultra',
//       isFavourite: false,
//       description: 'Razer Orochi V2 Ultra in Muscat | Buy Mechanical Gaming Mouse'),
//   Products(
//       id: 12,
//       image:
//           'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/CH_9307011_NA_Gallery_IRONCLAW_RGB_01.png',
//       price: '19.63',
//       status: 'pending',
//       name: 'Corsair IronClaw RGB gaming mouse',
//       isFavourite: false,
//       description: 'Hands-on: Corsair IronClaw RGB gaming mouse'),
//   Products(
//       id: 13,
//       image:
//           'https://my-store.msi.com/cdn/shop/files/GM11_2_700x700.png?v=1689132358',
//       price: '38.30',
//       status: 'pending',
//       name: 'MSI Clutch GM 11 Gaming Mouse',
//       isFavourite: false,
//       description: 'MSI Gaming Mouse sweetable for games'),
//   Products(
//       id: 14,
//       image:
//           'https://my-store.msi.com/cdn/shop/files/DSB1_1_700x700.png?v=1689146272',
//       price: '38.30',
//       status: 'pending',
//       name: 'MSI Interceptor DSB1 GAMING',
//       isFavourite: false,
//       description: 'MSI Gaming Mouse sweetable for games'),

//   //Keyboard
//   Products(
//       id: 15,
//       image:
//           'https://my-store.msi.com/cdn/shop/files/GK30GM11White_5_700x700.png?v=1687864790',
//       price: '40.30',
//       status: 'pending',
//       name: 'MSI VIGOR Combo GK30 Gaming Keyboard (White)',
//       isFavourite: false,
//       description: 'MSI Gaming Keyboard sweetable for games'),
//   Products(
//       id: 16,
//       image:
//           'https://tonixcomputer.co.id/wp-content/uploads/sites/3/2020/05/MSI-Vigor-GK40.png',
//       price: '39.30',
//       status: 'pending',
//       name: 'MSI Vigor GK40',
//       isFavourite: false,
//       description: 'MSI Gaming Keyboard sweetable for games'),
//   Products(
//       id: 17,
//       image:
//           'https://techwarez.online/wp-content/uploads/2022/04/758fce0e60685959f2bf45c613de345f.png',
//       price: '39.70',
//       status: 'pending',
//       name: 'MSI Vigor GK50',
//       isFavourite: false,
//       description: 'MSI Vigor GK50 Low Profile TKL Mechanical Keyboard'),
//   Products(
//       id: 18,
//       image:
//           'https://assets3.razerzone.com/wzp6clLMNC59OtXB-XpmvscIdNg=/1500x1000/https%3A%2F%2Fhybrismediaprod.blob.core.windows.net%2Fsys-master-phoenix-images-container%2Fh7d%2Fh59%2F9533910089758%2Fdeathstalker-v2-pro-tkl-4-500x500.png',
//       price: '36.80',
//       status: 'pending',
//       name: 'Razer DeathStalker V2 Pro Tenkeyless',
//       isFavourite: false,
//       description:
//           'A wireless ultra-slim tenkeyless optical keyboard optimized for top-tier performance and durability featuring low-profile switches for ultra-fast actuation'),
//   Products(
//       id: 19,
//       image:
//           'https://dubai.gccgamers.com/razer-huntsman-v2-tkl/assets/product-1.webp',
//       price: '34.80',
//       status: 'pending',
//       name: 'Razer Huntsman V2 TKL',
//       isFavourite: false,
//       description: 'Razer Huntsman V2 TKL Optical Mechanical Gaming Keyboard'),
//   //GPU
//   Products(
//       id: 20,
//       image:
//           'https://img.overclockers.co.uk/images/GRA-MSI-01319/8f13e307a9dc659c0bb172788f8f6f8d.jpg',
//       price: '134.80',
//       status: 'pending',
//       name: 'NVIDIA GeForce RTX 4090',
//       isFavourite: false,
//       description:
//           "The NVIDIA GeForce RTX 4090 is a high-performance graphics card designed for gaming, content creation, and professional applications. Built on NVIDIA's latest architecture, likely named after Ampere or its successor, the RTX 4090 is expected to offer significant improvements in ray tracing, artificial intelligence '(AI)' processing, and overall rendering capabilities compared to its predecessors'"),
//   Products(
//       id: 21,
//       image:
//           'https://cdn.shopify.com/s/files/1/0562/7713/9620/files/1024_e528d520-80a6-4165-9da9-c60af2a36ef1_512x410.png?v=1706894535',
//       price: '434.80',
//       status: 'pending',
//       name: 'MSI RTX 4090 Ventus 3X 24G OC',
//       isFavourite: false,
//       description:
//           'The NVIDIA GeForce RTX 4090 graphics card offers extreme speed for gamers and creators alike'),
//   Products(
//       id: 22,
//       image:
//           'https://th-store.msi.com/cdn/shop/products/1024_8077f7b4-afbe-46be-9e54-841eff179cd8_876x700.png?v=1679455452',
//       price: '134.80',
//       status: 'pending',
//       name: 'MSI GeForce RTX 3080 Ti GAMING X TRIO 12G',
//       isFavourite: false,
//       description: """GPU : NVIDIA® GeForce RTX™ 3080 Ti, 
//           GPU Clock : Boost: 1770 MHz, 
//           CUDA Core : 10240 
//           Video Memory: 12GB GDDR6X,
//           Memory Interface: 384-bit,
//           Memory Speed : 19 Gbps,
//           Interface : PCI Express® Gen 4,
//           Power Connectors : 8-pin x 3,
//           Output: DisplayPort x 3 (v1.4)HDMI™ x 1 (Supports 4K@120Hz as specified in HDMI™ 2.1),
//           Card Dimention : 324 x 140 x 56mm"""),
//   Products(
//       id: 23,
//       image:
//           'https://admin.dreamwaretech.co.za/files/FA80FD75-D076-8987-D0CC-9DD800D9B655.png',
//       price: '144.80',
//       status: 'pending',
//       name:
//           'Gigabyte Geforce RTX 3080 TURBO 10GB LHR GDDR6 PCIe 4.0 Nvidia Graphics Card',
//       isFavourite: false,
//       description:
//           "The GeForce RTX 3080 delivers the ultra performance that gamers crave, powered by Ampere—NVIDIA’s 2nd gen RTX architecture. It’s built with enhanced RT Cores and Tensor Cores, new streaming multiprocessors, and superfast G6X memory for an amazing gaming experience."),
//   Products(
//       id: 24,
//       image:
//           'https://www.amd.com/system/files/2021-07/910022-amd-radeon-6600XT-angle1260x709_0.png',
//       price: '149.80',
//       status: 'pending',
//       name: 'AMD Radeon™ RX 6600 Graphics Card',
//       isFavourite: false,
//       description:
//           "Epic 1080p Gaming Introducing the AMD Radeon™ RX 6600 graphics card, featuring the breakthrough AMD RDNA™ 2 architecture, engineered to deliver the ultimate 1080p gaming experience."),
//   Products(
//       id: 25,
//       image:
//           'https://dlcdnwebimgs.asus.com/gain/ad0b64de-0d9d-496a-aa22-37d3de22e5c2/',
//       price: '249.80',
//       status: 'pending',
//       name: 'ASUS Radeon™ RX 6800 XT',
//       isFavourite: false,
//       description:
//           "ASUS Radeon™ RX 6800 XT 16GB GDDR6 offers colossal performance to rule your game."),
//   //Processor
//   Products(
//       id: 26,
//       image:
//           'https://muscat.gccgamers.com/intel-core-i3-13100/assets/product.webp',
//       price: '180.80',
//       status: 'pending',
//       name: 'Core i3-13100',
//       isFavourite: false,
//       description:
//           "12M Cache, up to 4.50 GHz, 4.50 GHz Performance-core & Max Turbo, DDR5 4800 MT/s DDR4 3200 MT/s Memory Types, 64-bit, Intel UHD Graphics 730"),
//   Products(
//       id: 27,
//       image:
//           'https://www.intel.com/content/dam/www/central-libraries/us/en/images/2022-11/badge-atom-processor-centered-rwd.png.rendition.intel.web.480.270.png',
//       price: '180.80',
//       status: 'pending',
//       name: 'Intel Atom® x7000E and Intel® Core™ i3 Processors',
//       isFavourite: false,
//       description:
//           "Intel Atom® processors x7000E Series and Intel® Core™ i3 processors break new ground for x86 processors in the 6W to 15W base processor power range. Built with the same Efficient-cores and Intel® UHD Graphics as 12th Gen Intel® Core™ processors, the series supports Intel® Advanced Vector Extensions 2 (Intel® AVX2) and Intel® Deep Learning Boost (Intel® DL Boost) for accelerated deep learning inference and media processing."),
//   Products(
//       id: 28,
//       image:
//           'https://my.mouser.com/images/marketingid/2019/img/102089033.png?v=070223.1007',
//       price: '130.80',
//       status: 'pending',
//       name: 'Intel Core™ i5 14nm Processor',
//       isFavourite: false,
//       description:
//           "Intel Core™ i5 14nm Processor is designed to deliver significantly enhanced graphics and increased performance in a smaller thermal envelope, supporting the next generation of Internet of Things solutions. These i5 processors provide up to 25% additional multi-threaded CPU performance using 2nd generation 3-D tri-gate transistors and up to 20% lower power consumption with PCH I/0 throttling and dynamic power and thermal framework 8.0. The Intel Core i5 CPUs support high-end performance for media and graphics, have blazing-fast decode and transcode (frees up the CPU for other tasks), accelerate integer/matrix compute performance, and contain Intel Broadwell instructions for efficient and secure cryptographic performance. These devices include the Intel vPro™ processor, with built-in security features that let the user display and dock wirelessly."),
//   Products(
//       id: 29,
//       image:
//           'https://a-power.com/app/uploads/2022/10/101883005_8706101033.png',
//       price: '230.80',
//       status: 'pending',
//       name:
//           'Intel® Core™ 13th Gen i7-13700KF Processor (30M Cache, up to 5.40 GHz)',
//       isFavourite: false,
//       description:
//           "Intel® Core™ 13th Gen Raptor Lake i7-13700KF Processor (30M Cache, up to 5.40 GHz) FC-LGA16A, unlocked, without graphics (BX8071513700KF)"),
//   Products(
//       id: 30,
//       image:
//           'https://mytech.ma/wp-content/uploads/2021/12/ryzen-3600-cover.webp',
//       price: '370.80',
//       status: 'pending',
//       name: 'AMD Ryzen 5 3600 3,6 GHz Socket AM4 - Tray',
//       isFavourite: false,
//       description:
//           "The AMD Ryzen 5 3600 from the Matisse processor family has 6 CPU cores based on the « Zen 2 » architecture . After « Zen » and « Zen + », this is the third generation of Zen micro-architecture, which, thanks to advanced 7-nanometer manufacturing, offers not only a decent increase in clock rate and thus performance, but also modern new features. Paired with an AMD X570 or B550 chipset, the Ryzen 5 3600 supports the PCI Express 4.0 standard that is twice as fast as its predecessor . All Ryzen 3000 processors use the proven AM4 platform and can basically also run on older chipsets.The AMD Ryzen 5 3600 at a glance:"),
//   //Monitor
//   Products(
//       id: 31,
//       image:
//           'https://th-store.msi.com/cdn/shop/files/1024_fd8661cd-d81f-42e6-8aef-94e8511b5f04_876x700.png?v=1703939810',
//       price: '270.80',
//       status: 'pending',
//       name: 'MSI G2422C',
//       isFavourite: false,
//       description:
//           "Equipped with an immersive, curved 23.6 Inch FHD (1920 x 1080) VA panel (1500R) with 180Hz refresh rate and 1ms response time, the G2422C Curved Gaming monitor provides a competitive edge over most opponents. The G2422C features AMD FreeSync technology, which matches the display & GPU refresh rates for ultra-smooth gameplay, and a tilt-/height-adjustable stand."),
//   Products(
//       id: 32,
//       image:
//           'https://mmd-aoc2.oss-cn-hongkong.aliyuncs.com/Products/Monitors/G%20Line/G2/Q27G2SD/Q27G2SD_F.png',
//       price: '230.80',
//       status: 'pending',
//       name: 'Q27G2S/D27" QHD Gaming Monitor',
//       isFavourite: false,
//       description:
//           "Loaded with essentials for competitive gamers, this Q27G2S/D 27” gaming monitor has smooth 170Hz refresh rate, 1ms MPRT response time and G-Sync Compatible certified tear-free Technology. At 2560 x 1440 resolution, Quad HD offers superior high quality viewing with"),
//   Products(
//       id: 33,
//       image:
//           'https://images.samsung.com/is/image/samsung/p6pim/sg/ls27bg400eexxs/gallery/sg-odyssey-g4-25g40b-421806-ls27bg400eexxs-532081790?\$650_519_PNG\$',
//       price: '240.80',
//       status: 'pending',
//       name: '27" Odyssey G4 G40B FHD 240Hz Gaming Monitor',
//       isFavourite: false,
//       description: """IPS panel comes together for a crystal clear picture.
//            G-Sync compatible monitor has a 240Hz refresh rate and 1ms response time"""),
//   Products(
//       id: 34,
//       image: 'https://xlr8it.in/wp-content/uploads/2021/09/hc5.png',
//       price: '270.80',
//       status: 'pending',
//       name: 'Acer Aopen 80 Cm (31.5 In) WQHD 144Hz Gaming Monitor | 32HC1Q',
//       isFavourite: false,
//       description: """AMD FreeSync
//               144Hz Refresh Rate
//               Low blue light technology
//               WQHD Resolution with Frameless Design
//               1800R Curve Screen
//               Flickerless Technology
//               Product Type: Computer Monitor
//               Country of origin: China"""),
//   Products(
//       id: 35,
//       image:
//           'https://dlcdnwebimgs.asus.com/files/media/323592BE-69E2-4C59-BF1D-352BD8D2D8F7/v1/img/kv/rog-swift-oled-pg42uq.png',
//       price: '246.80',
//       status: 'pending',
//       name: 'ROG Swift OLED PG42UQ',
//       isFavourite: false,
//       description:
//           """ROG Swift OLED PG42UQ gaming monitor – 41.5-inch 4K, OLED, 138Hz (overclocked), 0.1 ms (GTG), G-SYNC® compatible, anti-glare micro-texture coating, custom heatsink, uniform brightness, 98% DCI-P3, true 10-bit, HDMI® 2.1, DisplayPort™ 1.4"""),
//   //Ram Sticks
//   Products(
//       id: 36,
//       image:
//           'https://alketron.com/image/cache/catalog/ALK_Desktop%20RAM/DDR3_Gaming_RAM_1866MHz-270x270.png',
//       price: '70.80',
//       status: 'pending',
//       name: 'ALKETRON - 8GB-DDR3-1866MHZ GAMING DESKTOP RAM',
//       isFavourite: false,
//       description: """ALKETRON - 8GB-DDR3-1866MHZ GAMING DESKTOP RAM"""),
//   Products(
//       id: 37,
//       image: 'https://advanti.com/images/product/back-cover.png',
//       price: '80.80',
//       status: 'pending',
//       name: 'RANSOR Supersonic 8GB 3000MHz DDR4 RAM',
//       isFavourite: false,
//       description: """8GB Single Module
//                 DDR4
//                 3000MHz
//                 18-18-18-38
//                 1.35V"""),
//   Products(
//       id: 38,
//       image:
//           'https://elevenpcgaming.it/wp-content/uploads/2023/05/KINGSTONE-FURY-2X8GB-1.png',
//       price: '94.80',
//       status: 'pending',
//       name: 'FURY DDR5 2x8GB 6000MHz DIMM',
//       isFavourite: false,
//       description: """FURY DDR5 2x8GB 6000MHz DIMM"""),
//   Products(
//       id: 39,
//       image:
//           'https://assets.corsair.com/image/upload/c_pad,q_auto,h_1024,w_1024,f_auto/products/Memory/CMH64GX5M2B5200C40W/VENGEANCE_RGB_DDR5_WHT_01.webp',
//       price: '97.80',
//       status: 'pending',
//       name:
//           'VENGEANCE® RGB 64GB (2x32GB) DDR5 DRAM 5200MT/s CL40 Memory Kit — White',
//       isFavourite: false,
//       description:
//           """CORSAIR VENGEANCE RGB DDR5 memory delivers DDR5 performance, higher frequencies, and greater capacities optimized for Intel® motherboards while lighting up your PC with dynamic, individually addressable ten-zone RGB lighting."""),
//   Products(
//       id: 40,
//       image:
//           'https://png.pngtree.com/png-vector/20231224/ourmid/pngtree-laptop-memory-module-so-dimm-chip-png-image_11214997.png',
//       price: '40.80',
//       status: 'pending',
//       name:
//           'SODIMM Laptop Ram for Intel AMD Laptop Memory, DDR2 4GB 800Mhz PC2 6400 2RX8 200 Pins',
//       isFavourite: false,
//       description:
//           """Full testing by actual item manufacturer or batch number. Model before delivery: DDR2 SODIMM Capacity: 4GB Frequency: 800Mhz Function: DDR2 200PIN Scope of application: Laptop pin of memory DDR for laptop = 184 pins DDR for laptop = 200 pins DDR2 for desktop = 240 pins DDR2 for laptop = 200 pins DDR3 for desktop = 240 pins DDR3 for laptop = 204 pins First XP's recognition is around 3GB. Win 7 32Bit's recognition is around 2.26-4.5GB. 7 32Bit is about 8-16GB. Please check which model is suitable for your laptop before purchasing. Common models include: PC2 4200 = DDR2 533MHZ PC2 5300 = DDR2 667MHZ (compatible with DDR2 533 MHZ) PC2 6400 = DDR2 800MHZ (compatible with DDR2 667 MHZ, DDR2 533MHZ) PC2 8500 = DDR2 1066MHZ The appearance and color of different batches of products may vary depending on the usage. Does not affect may vary Color: Green Material: PCB Size: 7x3cm Package Contents: 1 x RAM Only the above package content, other products not included. Note: Due to light reflection and different displays, the item color in the picture may be slightly different from the actual item. """),
// //Flash Drive
//   Products(
//       id: 41,
//       image:
//           'https://www.ormsdirect.co.za/cdn/shop/products/sandisk-64gb-cruzer-blade-usb-flash-drive-front.webp?v=1678026678&width=1024',
//       price: '30.80',
//       status: 'pending',
//       name: 'SanDisk 64GB Cruzer Blade USB Flash Drive',
//       isFavourite: false,
//       description: """Easily Share Files
//               Compact for Portable Use
//               Mac and PC Compatible"""),
//   Products(
//       id: 42,
//       image:
//           'https://www.ormsdirect.co.za/cdn/shop/products/sandisk-64gb-cruzer-blade-usb-flash-drive-front.webp?v=1678026678&width=1024',
//       price: '14.80',
//       status: 'pending',
//       name: 'SanDisk 16GB Cruzer Blade USB Flash Drive',
//       isFavourite: false,
//       description: """Easily Share Files
//               Compact for Portable Use
//               Mac and PC Compatible"""),
//   Products(
//       id: 43,
//       image:
//           'https://www.ormsdirect.co.za/cdn/shop/products/sandisk-64gb-cruzer-blade-usb-flash-drive-front.webp?v=1678026678&width=1024',
//       price: '10.80',
//       status: 'pending',
//       name: 'SanDisk 8GB Cruzer Blade USB Flash Drive',
//       isFavourite: false,
//       description: """Easily Share Files
//               Compact for Portable Use
//               Mac and PC Compatible"""),
//   Products(
//       id: 44,
//       image:
//           'https://www.pny.com/productimages/290FC85F-7EEB-4415-B0E9-B09100D79B1B/images/HP-USB-3.2-x796w-fr-op.png',
//       price: '100.80',
//       status: 'pending',
//       name: 'HP x796w USB 3.2 256GB Flash Drive',
//       isFavourite: false,
//       description:
//           """Offers a mobile storage solution to store and share your music, photos, files and more
//               Backwards compatible with USB 2.0
//               Durable metal casing
//               Ideal as external storage"""),
//   Products(
//       id: 45,
//       image:
//           'https://www.pny.com/productimages/A8617752-954C-4C70-905E-1F586BF15B93/images/HP-USB-Flash-Drive-v150w-2925C-128GB-la.png',
//       price: '80.80',
//       status: 'pending',
//       name: 'HP 128GB v150w USB 2.0 Flash Drive',
//       isFavourite: false,
//       description: """
//               Capacity	128GB
//               Interface	USB 2.0
//               Compatibility	USB 2.0 equipped host devices, and USB 3.0 host devices at USB 2.0 speeds
//               Environmental Conditions	Operating Temperature: 0° to 60° C, Storage Temperature: -25° to 85° C"""),
// //Hard Drive
// Products(
//       id: 46,
//       image:
//           'https://www.pny.com/productimages/A8617752-954C-4C70-905E-1F586BF15B93/images/HP-USB-Flash-Drive-v150w-2925C-128GB-la.png',
//       price: '80.80',
//       status: 'pending',
//       name: 'HP 128GB v150w USB 2.0 Flash Drive',
//       isFavourite: false,
//       description: """
//               Capacity	128GB
//               Interface	USB 2.0
//               Compatibility	USB 2.0 equipped host devices, and USB 3.0 host devices at USB 2.0 speeds
//               Environmental Conditions	Operating Temperature: 0° to 60° C, Storage Temperature: -25° to 85° C"""),
// ];
