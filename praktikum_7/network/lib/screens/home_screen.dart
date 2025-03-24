import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Menggunakan 'const' agar tidak ada error pada list
  final List<Item> availableItems = const [
    Item(name: "Soundproof Shoes", price: 15000),
    Item(name: "Safe Cracker Tool", price: 250000),
    Item(name: "Motorbike hijacking tool", price: 100000),
    Item(name: "Gun Suitcase", price: 15000000),
    Item(name: "See-through Glasses", price: 2000000),
    Item(name: "Network Jammer", price: 5000000),
    Item(name: "Taser Gun", price: 3000000),
    Item(name: "Bulletproof Tire", price: 1500000),
    Item(name: "Mask", price: 150000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mas Jojo Shop"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.formattedPrice),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
