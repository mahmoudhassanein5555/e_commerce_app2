import 'package:e_commerce_app/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Product> carts = [];

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  List images = [
    "https://img.freepik.com/premium-photo/minimal-convenience-store-front-building-with-podium-isolated-background-commercial-design_977617-16342.jpg",
    "https://img.freepik.com/premium-photo/3d-render-shop-icon-with-isolated-background_494423-983.jpg",
    "https://img.freepik.com/premium-vector/phone-with-house-top-house-top_955834-71152.jpg",
  ];

  List collection = [
    "https://media.auchan.fr/A0220220621000669618PRIMARY_1200x1200/B2CD/",
    "https://media.istockphoto.com/photos/white-and-black-wireless-headphones-isolated-background-picture-id180669306?k=6&m=180669306&s=612x612&w=0&h=3ZPZY1twZYJFos3VyQk9cADsvXYUAPg00CSAwO9WWEY=",
    "https://media.istockphoto.com/id/509464671/photo/smart-watch.jpg?s=612x612&w=0&k=20&c=RDYfeSMutwJ778pweCYQwIvFKAcNCni5_m5B-iLkDZs=",
    "https://tse4.mm.bing.net/th/id/OIP.QqS864zbGK2i6G35qR_PeQAAAA?cb=thfc1&rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://tse3.mm.bing.net/th/id/OIP.aqGllaqeQJyWHMYuUfpbBAAAAA?cb=thfc1&rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://www.bluedistribuidora.com.br/Produtos/mouse-usb-optical-microsoft-compact-500-u81-00010-preto-2.jpg",
  ];
  List names = [
    "mackbook",
    "Wireless Headphones",
    "Smart Watch",
    "Designer Backpack",
    "Premium Keyboard",
    "Mouse",
  ];
  List description = [
    "Powerful performance for work and play.",
    "Crystal-clear sound without the wires.",
    "Stay connected and track your fitness.",
    "Premium materials with modern style.",
    "Smooth, responsive keys for fast typing.",
    "Precise tracking with ergonomic design.",
  ];

  List price = ["500\$", "600\$", "700\$", "250\$", "900\$", "190\$"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 82, 68, 188),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Our Products",
          style: TextStyle(
            fontFamily: "Suwannaphum-Bold",
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 82, 68, 188),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Featured Products",
              style: TextStyle(
                fontFamily: "Suwannaphum-Bold",
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),

          SizedBox(height: 30),

          Container(
            height: 200,
            width: 400,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network("${images[index]}");
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (i) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _currentPage == i ? 20 : 15,
                height: _currentPage == i ? 20 : 15,
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == i ? Colors.blue : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }),
          ),

          SizedBox(height: 20),

          Text(
            " Shop Our Collection",
            style: TextStyle(
              fontFamily: "Suwannaphum-Bold",
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            "${collection[index]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          left: 115,
                          top: 0,
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${names[index]} added to the cart",
                                    style: TextStyle(
                                      fontFamily: "Suwannaphum-Bold",
                                      fontSize: 17,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    82,
                                    68,
                                    188,
                                  ),
                                ),
                              );
                              carts.add(
                                Product(
                                  name: "${names[index]}",
                                  price: "${price[index]}",
                                  imageUrl: "${collection[index]}",
                                ),
                              );
                              setState(() {});
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${names[index]}",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 15,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Text(
                      "${price[index]}",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 15,
                        color: Color.fromARGB(255, 72, 58, 175),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Text(
            " Hot Offers 🔥",
            style: TextStyle(
              fontFamily: "Suwannaphum-Bold",
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    height: 70,
                    child: Card(
                      elevation: 8.5,
                      shadowColor: const Color.fromARGB(255, 169, 167, 163),
                      child: Row(
                        children: [
                          Text(
                            "${description[index]}",
                            style: TextStyle(
                              fontFamily: "Suwannaphum-Bold",
                              fontSize: 15,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Expanded(
                            child: Image.network("${collection[index]}"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}
