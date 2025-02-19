import 'package:flutter/material.dart';
import 'package:greengrocer_app/src/config/app_data.dart' as app_data;
import 'package:greengrocer_app/src/config/custom_colors.dart';
import 'package:greengrocer_app/src/services/utils_services.dart';

class CartTab extends StatelessWidget {
  CartTab({super.key});
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Text(app_data.cartItens[index].item.itemName);
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
                  utilsServices.priceToCurrency(50.5),
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

                    onPressed: () {},
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
}
