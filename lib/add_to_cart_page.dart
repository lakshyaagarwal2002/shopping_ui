import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem {
  String name;
  String image;
  double price;
  int quantity;
  bool isSelected;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.isSelected = false,
    required String description,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    for (var newItem in _items) {
      if (newItem.name == item.name) {
        newItem.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(item);
    notifyListeners();
  }

  void toggleSelection(int index) {
    _items[index].isSelected = !_items[index].isSelected;
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity == 1) {
      _items.removeAt(index);
    } else {
      _items[index].quantity--;
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      if (item.isSelected) {
        total += item.price * item.quantity;
      }
    }
    return total;
  }
}

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.shopping_cart, size: 30, color: Colors.black),
                ],
              ),
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.items.isEmpty) {
                    return Center(
                      child: Text(
                        "Your cart is empty.",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.only(right: 12, top: 20),
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];
                      return Row(
                        children: [
                          Checkbox(
                            value: item.isSelected,
                            onChanged: (bool? value) {
                              cartProvider.toggleSelection(index);
                            },
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.image,
                              height: 100,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[300]),
                                    ),
                                    const SizedBox(width: 30),
                                    Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => cartProvider
                                                .decreaseQuantity(index),
                                            child: Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            '${item.quantity}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => cartProvider
                                                .increaseQuantity(index),
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                  );
                },
              ),
            ),
            if (Provider.of<CartProvider>(context).items.isNotEmpty) ...[
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(fontSize: 18)),
                        Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                            return Text(
                              "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.red[300]),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              "Checkout",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
