import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/menu_item_model.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return cart.items.isEmpty
              ? Center(child: Text('Your cart is empty.'))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            final item = cart.items[index];
                            return CheckoutItemCard(item: item);
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Total: $${cart.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Simulate order placement
                          cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Order placed!')),
                          );
                          Navigator.pop(context);
                        },
                        child: Text('Place Order'),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class CheckoutItemCard extends StatelessWidget {
  final MenuItem item;

  const CheckoutItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('$${item.price}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
