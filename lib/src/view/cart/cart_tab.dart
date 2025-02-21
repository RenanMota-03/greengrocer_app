import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:greengrocer_app/src/config/app_data.dart' as app_data;
import 'package:greengrocer_app/src/config/custom_colors.dart';
import 'package:greengrocer_app/src/services/utils_services.dart';
import 'package:greengrocer_app/src/view/cart/components/cart_tile.dart';

import '../../models/cart_item_model.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItens.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItens) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return CartTile(
                  remove: removeItemFromCart,
                  cartItemModel: app_data.cartItens[index],
                );
              },
              itemCount: app_data.cartItens.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Total Geral", style: TextStyle(fontSize: 12)),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      log(result.toString());
                    },
                    child: Text(
                      'Concluir Pedidos',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Confirmação'),
          content: Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Não', style: TextStyle(color: Colors.green)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Sim', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
