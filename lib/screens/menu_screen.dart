import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/models/menu_item_model.dart';
import 'package:food_delivery_app/screens/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;

  MenuScreen({Key? key, required this.restaurant}) : super(key: key);

  final List<MenuItem> menuItems = [
    MenuItem(id: '1', name: 'Burger', price: 10.0, imageUrl: 'https://example.com/burger_menu.jpg'),
    MenuItem(id: '2', name: 'Pizza', price: 12.0, imageUrl: 'https://example.com/pizza_menu.jpg'),
    MenuItem(id: '3', name: 'Fries', price: 5.0, imageUrl: 'https://example.com/fries_menu.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name + ' Menu'),
        actions: [IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutScreen()),
          );
        }, icon: Icon(Icons.shopping_cart))],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return MenuItemCard(menuItem: menuItem);
        },
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemCard({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              menuItem.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('$${menuItem.price}'),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addItem(menuItem);
              },
            ),
          ],
        ),
      ),
    );
  }
}
