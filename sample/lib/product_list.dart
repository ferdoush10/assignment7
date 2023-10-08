import 'package:flutter/material.dart';
import 'package:sample/cart_page.dart';
import 'package:sample/product_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> product = [
    ProductModel(name: "Product", price: 10, quantity: 0),
    ProductModel(name: "Product", price: 15, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
    ProductModel(name: "Product", price: 20, quantity: 0),
  ];
  int count = 0;
  int totalItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${product[index].name} ${index + 1}'),
                    subtitle: Text('\$${product[index].price.toString()}'),
                    trailing: Column(
                      children: [
                        Text('count: ${product[index].quantity.toString()}'),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count = product[index].quantity++;

                              for (var n in product) {
                                n = product[index];
                                print(n);
                              }
                              if (count >= 4) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Congratulations!"),
                                        content: Text(
                                            "You bought ${count + 1} of ${product[index].name}${index + 1}"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      );
                                    });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.blue,
                            ),
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage(totalProduct: 'You bought ${count + 1} product');
          }));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

/*
          double total = 0;
          double totalPrice = 0;
          double item = 0;
          for (var p in product) {
            int tprice = p.price * p.quantity;
            //int item = p.quantity;

            totalPrice = totalPrice + tprice;

            int amount = p.quantity;
            total = total + amount;
            if (p.quantity > 0) {
              item = item + 1;
            }
          }
*/
