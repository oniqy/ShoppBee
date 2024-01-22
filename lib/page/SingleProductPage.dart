import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable/expandable.dart';
import 'package:shop_bee/page/Catalogue.dart';

class SingleProductPage extends StatefulWidget {
  SingleProductPage({super.key});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  bool isScrolled = false;
  late ExpandableController expandableController;
  double appBarHieght = 320.0;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        isScrolled = _scrollController.offset > appBarHieght - kToolbarHeight;
      });
    });
    expandableController = ExpandableController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 320.0,
            pinned: true,
            actions: [
              AnimatedContainer(
                height: 40,
                width: 40,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
              AnimatedContainer(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: isScrolled ? Colors.teal : Colors.transparent,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ClipRRect(
                      child: ImageSlideshow(
                        height: 350,
                        children: [
                          Image.asset(
                            'assets/img1.jpg',
                            fit: BoxFit.fill,
                          ),
                          Image.asset('assets/img2.jpg', fit: BoxFit.fill)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 150,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 15, 0, 8),
                        child: Text(
                          'Name of product',
                          style: GoogleFonts.nunito(
                              textStyle: const TextStyle(fontSize: 23)),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          'đ10.000.0000',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF7F50))),
                        )),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Đã bán 1',
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/img1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                      ),
                      Text(
                        'Name Shop',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 120,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.teal,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Xem shop',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(fontSize: 18)),
                            )),
                      ),
                    ],
                  )),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Column(children: [
                  Text(
                    'Detail product',
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
                    child: Text(
                      'Nếu bạn đang tìm kiếm một trang web để mua và bán hàng trực tuyến thì Shopee.vn là một sự lựa chọn tuyệt vời dành cho bạn. Shopee là trang thương mại điện tử cho phép người mua và người bán tương tác và trao đổi',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      maxLines: 5,
                    ),
                  ),
                  ExpandableNotifier(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expandable(
                          collapsed: ExpandableButton(
                            child: Icon(Icons.arrow_downward_sharp),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                                child: Text(
                                  'thông tin về sản phẩm và chương trình khuyến mãi của shop. Do đó, việc mua bán trên Shopee trở nên nhanh chóng và đơn giản hơn. Bạn có thể trò chuyện trực tiếp với nhà bán hàng để hỏi trực tiếp về mặt hàng cần mua. Còn nếu bạn muốn tìm mua những dòng sản phẩm chính hãng, uy tín, Shopee Mall chính là sự lựa chọn lí tưởng dành cho bạn. Để bạn có thể dễ dàng khi tìm hiểu và sử dụng sản phẩm, Shopee Blog - trang blog thông tin chính thức của Shopee - sẽ giúp bạn có thể tìm được cho mình các kiến thức về xu hướng thời trang, review công nghệ, mẹo làm đẹp, tin tức tiêu dùng và deal giá tốt bất ngờ.Đến với Shopee, cơ hội để trở thành một nhà bán hàng dễ dàng hơn bao giờ hết. Chỉ với vài thao tác trên ứng dụng, bạn đã có thể đăng bán ngay những sản phẩm của mình. Không những thế, các nhà bán hàng có thể tự tạo chương trình khuyến mãi trên Shopee để thu hút người mua với những sản phẩm có mức giá hấp dẫn. Khi đăng nhập tại Shopee Kênh người bán, bạn có thể dễ dàng phân loại sản phẩm, theo dõi đơn hàng, chăm sóc khách hàng và cập nhập ngay các hoạt động của shop.Bên cạnh đó, Shopee hợp tác với nhiều đơn vị vận chuyển uy tín trên thị trường như SPX,... nhằm cung cấp dịch vu giao nhận và vận chuyển tiện lợi cho cả khách hàng và người bán. Cùng với nhiều ưu đãi với chi phí giao hàng hợp lý, Shopee đảm bảo cho khách hàng trải nghiệm mua sắm thuận tiện nhất.',
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ExpandableButton(
                                  child: Icon(Icons.arrow_upward),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 2),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    Text('Đánh giá sản phẩm'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                    Text('(11 đánh giá khác)'),
                  ]),
                ),
              )
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.8,
              // Set the horizontal spacing between items to 0
            ),
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      color: Colors.white,
                      width: 10,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    'assets/img1.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text('Name'),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(Icons.star, color: Colors.yellow),
                                    Icon(Icons.star, color: Colors.yellow),
                                    Icon(Icons.star, color: Colors.yellow),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'binh luann neee sdkfhsdhfksdhfkshfkjshfkjsdfkakjsdhkashdkjasdhkadhkajsdhkasdhkadhkahdkashdkashdkahdkaoiafoiaasdasdsadasadsfasdasdasdasdasdasdasdasdasdasdasdasdasdasdadasdasdasdasdad',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(fontSize: 20),
                              ),
                              maxLines: 3,
                            ),
                          ),
                          ExpandableNotifier(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expandable(
                                  collapsed: ExpandableButton(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CataloguePage()));
                                        },
                                        child: Text('Xem them')),
                                  ),
                                  expanded: SizedBox(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                childCount: 3),
          ),

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.54, // Adjust the aspect ratio to control height
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
                        borderRadius: BorderRadius.circular(8),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.chat, size: 30),
              color: Colors.teal,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.teal,
              child: Icon(Icons.add_shopping_cart, size: 30),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Color(0xFFFF7F50),
              child: Icon(Icons.shopping_cart, size: 30),
            ),
            label: '',
          ),
        ],
      ),


    );


  }
}
