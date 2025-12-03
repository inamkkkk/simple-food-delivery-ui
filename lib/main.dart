import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/screens/restaurant_list_screen.dart';
import 'package:food_delivery_app/models/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create: (context) => CartModel(), child:
      MaterialApp(
        title: 'Food Delivery App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RestaurantListScreen(),
      ),
    );
  }
}
