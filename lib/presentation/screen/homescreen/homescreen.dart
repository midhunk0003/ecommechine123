import 'package:flutter/material.dart';
import 'package:globalecomersmachinetesting/data/model/product_model/product_model.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to the cart page or show a cart dialog
                  print("Cart icon clicked!");
                  // You can replace the print statement with navigation logic to a Cart screen.
                },
              ),
              CircleAvatar(
                radius: 8,
                child: Center(child: Text("1")),
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            8.0), // Padding for the whole body to prevent overflow
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:
                0.6, // Controls the aspect ratio of grid items (optional)
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    color: Colors.grey,
                    child: Center(child: Text('No Image')),
                  ),
                  // You can use a real image URL if available
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "qqq",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "www",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '₹111',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Spacer(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                            child: Text(
                          "ADD TO CART",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
