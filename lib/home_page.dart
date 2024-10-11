import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/product_description.dart';
import 'add_to_cart_page.dart';
import 'item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  final List<ItemModel> items = [
    ItemModel(
      name: "ArmChair",
      description:
          "Elevate your living space with the ArmChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 150.00,
      image:
          "https://media.istockphoto.com/id/1490325659/photo/armchair.webp?a=1&b=1&s=612x612&w=0&k=20&c=UD9MxwOQUxka36GDfQzTT4dtRWsXtoab43n3Tg1AoqM=",
    ),
    ItemModel(
      name: "BlueChair",
      description:
          "Elevate your living space with the BlueChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 250.00,
      image:
          "https://media.istockphoto.com/id/2059474032/photo/blue-armchair.webp?a=1&b=1&s=612x612&w=0&k=20&c=VrlMXrtedIZUmQxmfFNgbuwWbBeLloZGpmkiF2ktGvA=",
    ),
    ItemModel(
      name: "BrownChair",
      description:
          "Elevate your living space with the BrownChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 175.00,
      image:
          "https://images.unsplash.com/photo-1612372606404-0ab33e7187ee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2hhaXJ8ZW58MHx8MHx8fDA%3D",
    ),
    ItemModel(
      name: "GreenChair",
      description:
          "Elevate your living space with the GreenChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 200.00,
      image:
          "https://plus.unsplash.com/premium_photo-1683133939183-edd5476e6200?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNoYWlyfGVufDB8fDB8fHww",
    ),
    ItemModel(
      name: "PinkChair",
      description:
          " Elevate your living space with the PinkChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 150.00,
      image:
          "https://plus.unsplash.com/premium_photo-1690971631360-c7b4f08b4f94?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2hhaXJ8ZW58MHx8MHx8fDA%3D",
    ),
    ItemModel(
      name: "WoodenChair",
      description:
          "Elevate your living space with the WoodenChair- A perfect blend of elegance and functionality. Crafted with high-quality materials, this chair features a sleek, contemporary design that seamlessly fits into any modern decor.",
      price: 180.00,
      image:
          "https://plus.unsplash.com/premium_photo-1705479742826-cb265b9d6999?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNoYWlyfGVufDB8fDB8fHww",
    ),
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    getImageFromCamera();
                  },
                  child: Text(
                    "Upload from Camera",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Text(
                    "Upload from Gallery",
                    style: TextStyle(color: Colors.white),
                  )),
              _image != null
                  ? CircleAvatar(radius: 10,
                    child: Image.file(
                        _image!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        
                      ),
                  )
                  : SizedBox(height: 10, child: Text('No image selected')),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(Icons.menu)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(18, 12, 0, 0),
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCartPage(),
                            ),
                          );
                        },
                        child: Icon(Icons.shopping_cart, size: 30),
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(Icons.circle, color: Colors.red, size: 12),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Explore",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 308,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      width: 200,
                      margin: EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyProductDescription(
                                                name: item.name,
                                                image: item.image,
                                                price: item.price,
                                                description: item.description,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Image.network(
                                          item.image,
                                          height: 170,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 16,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          item.isLiked = !item.isLiked;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red[300],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.favorite,
                                              color: item.isLiked
                                                  ? Colors.red.shade900
                                                  : Colors.white,
                                              size: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(item.name,
                                  style: TextStyle(fontSize: 18)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 4.0),
                              child: Text(
                                item.description,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "\$${item.price.toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    CartItem cartItem = CartItem(
                                      name: item.name,
                                      image: item.image,
                                      price: item.price,
                                      description: item.description,
                                    );

                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .addItem(cartItem);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("${item.name} added to cart!"),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin:
                                        EdgeInsets.only(right: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(Icons.add,
                                        color: Colors.white, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            items[0].image,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[0].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            items[0].description,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$${items[0].price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyProductDescription(
                                            name: items[0].name,
                                            image: items[0].image,
                                            price: items[0].price,
                                            description: items[0].description,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          items[1].image,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[1].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          items[1].description,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$${items[1].price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyProductDescription(
                                          name: items[1].name,
                                          image: items[1].image,
                                          price: items[1].price,
                                          description: items[1].description,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_image', _image));
  }
}
