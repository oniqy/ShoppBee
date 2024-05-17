import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_bee/page/SingleBrandPage.dart';
import 'package:shop_bee/page/SingleProductPage.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({super.key});
  @override
  State<BrandPage> createState() => _MallPageState();
}

class _MallPageState extends State<BrandPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _findProduct = TextEditingController();
    List<String> listBarndName = [
      'Innisfree',
      '2q',
      'Somthing3',
      'Somthing4',
      'Somthing5',
      'Somthing6',
      'Somthing7',
      'Somthing8',
      'Somthing9',
      'Somthing10'
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            floating: false,
            title: Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: TextField(
                    controller: _findProduct,
                    decoration: InputDecoration(
                      hintText: 'ShopBee Search',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: const Icon(Icons.search,
                    color: Color(0xFFFF7F50), size: 35),
              ),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  title: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageSlideshow(
                            height: 120,
                            width: double.infinity,
                            indicatorColor: Colors.teal,
                            children: [
                              Image.asset(
                                'assets/img1.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/img2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ]),
                      ),
                      Text('Thương hiệu nổi bật',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500))),
                      for (int i = 0; i < 2; i++) ...[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.teal,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                child: SingleChildScrollView(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SingleBarndPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          margin: EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(30),
                                            child: Image.asset(
                                              'assets/img1.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Name Shop ->',
                                          style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                              color: Color(0xFFFF7F50),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                                margin: EdgeInsets.all(5),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2,
                                      crossAxisCount: 1,
                                    ),
                                    itemCount: listBarndName.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SingleProductPage(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                                        width: 180,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.teal),
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 250,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8),
                                                ),
                                                child: Image.asset(
                                                  'assets/img1.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              listBarndName[index],
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
                                                      fontSize: MediaQuery.of(context).size.width * 0.04,
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
                                                      fontSize: MediaQuery.of(context).size.width * 0.03,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.teal, width: 2),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                child: SingleChildScrollView(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleBarndPage()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          margin: EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.asset(
                                              'assets/img1.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Name Shop ->',
                                          style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                                color: Color(0xFFFF7F50),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                                margin: EdgeInsets.all(5),
                              ),
                              Expanded(
                                child: Container(
                                  height: 420,
                                  margin: EdgeInsets.all(10),
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2,
                                      crossAxisCount: 1,
                                    ),
                                    itemCount: listBarndName.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleProductPage()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        width: 180,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.4,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 250,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.only(
                                                        topRight: Radius
                                                            .circular(8),
                                                        topLeft:
                                                            Radius.circular(
                                                                8)),
                                                child: Image.asset(
                                                  'assets/img1.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              listBarndName[index],
                                              style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05,
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
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'đ10.000.000',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: TextStyle(
                                                      color:
                                                          Color(0xFFFF7F50),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12),
                                                Text(
                                                  'Đã bán 20',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.03,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '',
        child: const Icon(Icons.shopping_cart, color: Colors.teal),
        backgroundColor: Colors.white,
      ),
    );
  }
}
