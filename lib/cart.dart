import 'package:flutter/material.dart';
import 'menu.dart';

class Cart extends StatefulWidget {
  final List<Menu> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  double _totalprice = 0.0;

  List<Menu> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
             var item = _cart[index];
             return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: Column (
                 children: <Widget>[
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    item.icon,
                    color: item.color,
                  ),),
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(item.name),
                  ),
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("RM"+ item.price .toStringAsFixed(
                                                                      2) ??
                                                          "0.0"),
                  ),
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      })),
                  ]
                ),
              ),
            );
          }),
    );
  }
}