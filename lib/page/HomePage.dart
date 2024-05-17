import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shop_bee/page/CartPage.dart';
import 'package:shop_bee/page/SingleProductPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _findProduct = TextEditingController();
  List<Icon> iconList = [
    Icon(Icons.shopify, color: Color(0xFFFF7F50)),
    Icon(Icons.food_bank_rounded, color: Color(0xFFFF7F50)),
    Icon(Icons.flash_on, color: Color(0xFFFF7F50)),
    Icon(Icons.shopify, color: Color(0xFFFF7F50)),
    Icon(Icons.food_bank_rounded, color: Color(0xFFFF7F50)),
    Icon(Icons.flash_on, color: Color(0xFFFF7F50)),
    Icon(Icons.shopify, color: Color(0xFFFF7F50)),
    Icon(Icons.food_bank_rounded, color: Color(0xFFFF7F50)),
    Icon(Icons.flash_on, color: Color(0xFFFF7F50)),
    Icon(Icons.live_tv, color: Color(0xFFFF7F50)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            floating: false,
            title: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _findProduct,
                  decoration: InputDecoration(
                    hintText: 'ShopBee Search',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        print('object');
                      },
                      child: Container(
                        child: const Icon(Icons.search,
                            color: Color(0xFFFF7F50), size: 35),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 330,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageSlideshow(
                          width: double.infinity,
                          height: 120,
                          initialPage: 0,
                          indicatorColor: Color(0xFFFF7F50),
                          children: [
                            Image.asset(
                              'assets/img1.jpg',
                              fit: BoxFit.fill,
                            ),
                            Image.asset('assets/img1.jpg', fit: BoxFit.fill),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 180,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: iconList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: iconList[index],
                            ),
                            Text('data $index', style: GoogleFonts.nunito()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Recommend for you',
                style: GoogleFonts.nunito(
                  textStyle:
                      TextStyle(fontSize: 22
                          , fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  0.54, // Adjust the aspect ratio to control height
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleProductPage()));
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                        child: Image.asset(
                          'assets/img1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Name',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      Text(
                        'Mo Ta sadasasdadasssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'đ10.000.000',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xFFFF7F50),
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Đã bán 20',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        tooltip: '',
        child: const Icon(Icons.shopping_cart, color: Colors.teal),
        backgroundColor: Colors.white,
      ),
    );
  }
}
