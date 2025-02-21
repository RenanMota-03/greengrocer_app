import 'package:flutter/material.dart';
import 'package:greengrocer_app/src/config/custom_colors.dart';
import 'package:greengrocer_app/src/models/cart_item_model.dart';
import 'package:greengrocer_app/src/services/utils_services.dart';
import 'package:greengrocer_app/src/view/widgets/quantity_widget.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItemModel;
  final Function(CartItemModel) remove;
  const CartTile({
    super.key,
    required this.cartItemModel,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          widget.cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItemModel.item.itemName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItemModel.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: QuantityWidget(
          value: widget.cartItemModel.quantity,
          suffixText: widget.cartItemModel.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItemModel.quantity = quantity;

              if (quantity == 0) {
                widget.remove(widget.cartItemModel);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
