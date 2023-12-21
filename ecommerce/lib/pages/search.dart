import 'dart:convert';
import 'package:ecommerce/config/dio.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/barang.dart';
import 'package:ecommerce/models/reviews.dart';
import 'package:ecommerce/models/search.dart';
import 'package:ecommerce/pages/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  List<dynamic> productList = [];
  List<Product> searchedProduct = [];
  List<String> size = [
    "100",
    "200",
    "300",
    "400",
  ];

  List<int> rating = [
    1,
    2,
    3,
    4,
    5,
  ];

  int _selectedWeight = 0;
  int _selectedRating = 0;
  String _search = '';

  var selectedRange = const RangeValues(150.00, 1500.00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _search = value;
                    });

                    Future<List<Product>> filter() async {
                      // print(selectedRange);
                      try {
                        final res = await diohttp.post('/products/searchByText',
                            data: {'nama': _search});
                        // print(res);s

                        final data = res.data as List<dynamic>;
                        return data.map((p) {
                          final reviewData = p['reviews'] as List<dynamic>;
                          final reviews = reviewData
                              .map((r) => Review.fromJson(r))
                              .toList();
                          final product = Product.fromJson(p);
                          product.reviews = reviews;
                          return product;
                        }).toList();
                      } catch (e) {
                        return [];
                      }
                    }

                    filter().then((searched) {
                      print(searched);
                      setState(() {
                        searchedProduct = searched;
                      });
                    });
                  },
                  autofocus: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              )),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: showFilterModal,
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                  child: ListView.builder(
                    itemCount: searchedProduct.length,
                    itemBuilder: (context, index) {
                      final product = searchedProduct[index];

                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  content: Container(
                                    width: double.maxFinite,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.nama!,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 200,
                                          child: ListView.builder(
                                            itemCount: product.reviews!.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              final review = product.reviews![index];
                                              return ListTile(
                                                title: Text(review.text!),
                                                trailing: Text('Rating: ${review.rating.toString()}'),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          contentPadding: EdgeInsets.all(8),
                          leading: Image.network(
                            product.image!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.nama!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Rp. ${product.harga.toString()}'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  ),
                )
          ],
        ));
  }

  Future<void> products() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);

    setState(() {
      productList =
          data['products'].map((data) => Product.fromJson(data)).toList();
    });
  }

  productCart(Product product, Barang barang) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductViewPage(
                        barang: barang,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 10),
                blurRadius: 15,
                color: Colors.grey.shade200,
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:
                              Image.network(product.image!, fit: BoxFit.cover)),
                    ),
                    // Add to cart button
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: MaterialButton(
                        color: Colors.black,
                        minWidth: 45,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          addToCartModal();
                        },
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 20,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.nama!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.berat!.toString(),
                    style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "\$ " + product.harga.toString() + '.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  forYou(Product product) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(product.image!, fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.nama!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.berat!.toString(),
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ " + product.harga.toString() + '.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showFilterModal() async {
    List<Product> products = [];

    void filter(StateSetter setState) async {
      // print(selectedRange);

      final search = Search(
        rating: rating[_selectedRating],
        berat: _selectedWeight,
        rangeMin: selectedRange.start,
        rangeMax: selectedRange.end,
      );

      print(search.toJson());
      final res = await diohttp.post('/products/search', data: search.toJson());
      // print(res);

      final data = res.data as List<dynamic>;
      final b = data.map((p) {
        final reviewData = p['reviews'] as List<dynamic>;
        final reviews = reviewData.map((r) => Review.fromJson(r)).toList();
        final product = Product.fromJson(p);
        product.reviews = reviews;
        return product;
      }).toList();

      products = b;
    }

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      minWidth: 40,
                      height: 40,
                      color: Colors.grey.shade300,
                      elevation: 0,
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Rating',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rating.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRating = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: _selectedRating == index
                                  ? Colors.yellow[800]
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              rating[index].toString(),
                              style: TextStyle(
                                  color: _selectedRating == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Berat Makanan',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: size.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(size);
                          print(size[index]);
                          setState(() {
                            _selectedWeight = int.tryParse(size[index]) ?? 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: _selectedWeight.toString() ==
                                      size[index].toString()
                                  ? Colors.yellow[800]
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              size[index],
                              style: TextStyle(
                                color: _selectedWeight.toString() ==
                                        size[index].toString()
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Slider Price Renge filter
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price Range',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$ ${selectedRange.start.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12),
                        ),
                        Text(" - ",
                            style: TextStyle(color: Colors.grey.shade500)),
                        Text(
                          '\$ ${selectedRange.end.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RangeSlider(
                    values: selectedRange,
                    min: 0.00,
                    max: 2000.00,
                    divisions: 100,
                    inactiveColor: Colors.grey.shade300,
                    activeColor: Colors.yellow[800],
                    labels: RangeLabels(
                      '\$ ${selectedRange.start.toStringAsFixed(2)}',
                      '\$ ${selectedRange.end.toStringAsFixed(2)}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() => selectedRange = values);
                    }),
                const SizedBox(height: 20),
                button('Filter', () => filter(setState))
              ],
            ),
          );
        });
      },
    );
    print(products);
    setState(() {
      searchedProduct = products;
    });
    // if (mounted) {
    //   Navigator.of(context).pop();
    // }
  }

  addToCartModal() {
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: AnimationController(
            duration: const Duration(milliseconds: 400), vsync: this),
        builder: (context) => StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: rating.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedRating = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: _selectedRating == index
                                      ? Colors.yellow[800]
                                      : Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    rating[index].toString(),
                                    style: TextStyle(
                                        color: _selectedRating == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Size",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: size.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedWeight = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: _selectedWeight == index
                                        ? Colors.yellow[800]
                                        : Colors.grey.shade200,
                                    shape: BoxShape.circle),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    size[index],
                                    style: TextStyle(
                                        color: _selectedWeight == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      button('Add to Cart', () {
                        Navigator.pop(context);

                        // Let's show a snackbar when an item is added to the cart
                        final snackbar = SnackBar(
                          content: Text("Item added to cart"),
                          duration: Duration(seconds: 5),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      })
                    ],
                  ),
                );
              },
            ));
  }

  button(String text, Function() onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      elevation: 0,
      splashColor: Colors.yellow[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.yellow[800],
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
