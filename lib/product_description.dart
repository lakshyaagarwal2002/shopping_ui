import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/add_to_cart_page.dart';

class MyProductDescription extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final String description;
  const MyProductDescription(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.description});

  @override
  State<MyProductDescription> createState() => _MyProductDescriptionState();
}

class _MyProductDescriptionState extends State<MyProductDescription> {
  bool isLiked = false;
  int selectedColorIndex = 0;

  final List<Color> colorOptions = [
    Colors.red.shade300,
    Colors.grey.shade300,
    Colors.blueGrey.shade500,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      colorOptions[selectedColorIndex].withOpacity(0.5),
                      BlendMode.color,
                    ),
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        Text(
                          "Product",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyCartPage()));
                              },
                              child: Icon(Icons.shopping_cart,
                                  size: 30, color: Colors.black),
                            ),
                            Positioned(
                              right: 0,
                              child: Icon(Icons.circle,
                                  color: Colors.red, size: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 12,
                child: InkWell(
                  onTap: () {
                    isLiked = !isLiked;
                    setState(() {});
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: isLiked ? Colors.red : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.white : Colors.red[300],
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${widget.price.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red[300],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(children: [
                  ...List.generate(4, (index) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    );
                  }),
                  Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 6.0),
                    child: Text("4.5",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Color Option"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = 0;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Icon(
                    selectedColorIndex == 0
                        ? Icons.radio_button_checked_outlined
                        : Icons.circle,
                    size: 20,
                    color: Colors.red[300],
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = 1;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Icon(
                    selectedColorIndex == 1
                        ? Icons.radio_button_checked_outlined
                        : Icons.circle,
                    size: 20,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = 2;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Icon(
                    selectedColorIndex == 2
                        ? Icons.radio_button_checked_outlined
                        : Icons.circle,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Description"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 8, right: 5),
            child: Text(
              widget.description,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 52.0),
          Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                CartItem cartItem = CartItem(
                  name: widget.name,
                  image: widget.image,
                  price: widget.price,
                  description: widget.description,
                );

                Provider.of<CartProvider>(context, listen: false)
                    .addItem(cartItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.name} added to cart!"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  "   +   Add to Cart   ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            height: 50,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
