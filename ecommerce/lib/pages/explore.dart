import 'package:ecommerce/config/dio.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  List<dynamic> productList = [];
  List<Product> products = [];

  void getProducts() async {
    final res = await diohttp.get('/products');
    final data = res.data as List<dynamic>;
    final b = data.map((p) {
      final reviewData = p['reviews'] as List<dynamic>;
      final reviews = reviewData.map((r) => Review.fromJson(r)).toList();
      // List<Review> reviews
      final product = Product.fromJson(p);
      product.reviews = reviews;
      return product;
    }).toList();

    setState(() {
      products = b;
    });
    // print(products);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProducts();
    });
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        expandedHeight: 300.0,
        elevation: 0,
        pinned: true,
        floating: true,
        stretch: true,
        backgroundColor: Colors.grey.shade50,
        flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 100),
            stretchModes: [
              StretchMode.zoomBackground,
              // StretchMode.fadeTitle
            ],
            title: AnimatedOpacity(
              opacity: _isScrolled ? 0.0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text("Welcome To Keripik Tempe Karina",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                  )),
            ),
            background: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            )),
        bottom: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                child: TextField(
                  readOnly: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              )),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 300,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See all ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final product in products)
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
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
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 150, // Sesuaikan lebar kartu sesuai kebutuhan
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                product.nama!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text('Rp. ${product.harga.toString()}'),
                              SizedBox(height: 10),
                              Icon(Icons.reviews_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ])),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'For You',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Tambahkan logika untuk menangani tombol "See all"
                      },
                      child: Text(
                        'See all ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
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
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.nama!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Rp. ${product.harga.toString()}'),
                          trailing: Icon(Icons.reviews_outlined),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 300,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keripik Tempe',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See all ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final product in products)
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
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
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 150, // Sesuaikan lebar kartu sesuai kebutuhan
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                product.nama!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text('Rp. ${product.harga.toString()}'),
                              SizedBox(height: 10),
                              Icon(Icons.reviews_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ])),
          Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 300,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keripik Pisang',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See all ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final product in products)
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
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
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 150, // Sesuaikan lebar kartu sesuai kebutuhan
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                product.nama!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text('Rp. ${product.harga.toString()}'),
                              SizedBox(height: 10),
                              Icon(Icons.reviews_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ])),
          Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 300,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keripik Buah-buahan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'See all ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final product in products)
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
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
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 150, // Sesuaikan lebar kartu sesuai kebutuhan
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              Text(
                                product.nama!,
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 10),
                              Text('Rp. ${product.harga.toString()}'),
                              SizedBox(height: 10),
                              Icon(Icons.reviews_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ])),
        ]),
      )
    ]);
  }
}