import 'package:flutter/material.dart';
import 'package:shop_bee/page/CartPage.dart';

class CataloguePage extends StatefulWidget {
  CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  int currentTab = 0;
  PageController pageController = PageController();
  int test = 0;
  final TextEditingController _fineProduct= TextEditingController();
  List<String> tabName = [
    "Men's Outfit",
    "Women's Outfit",
    "Kid's Outfit",
    "Accessories",
    "Footwear",
    "Men's Cosmetics",
    "Women's Cosmetics"
  ];
  List<String> nameCatalogue = [];
  List<AssetImage> imgCatalogue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
         title: Container(
           child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: TextField(
                    controller: _fineProduct,
                    decoration: InputDecoration(
                      hintText: 'ShopBee Search',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.search,size: 35,color: Color(0xFFFF7F50),),)
            ],
                   ),
         ),
      ),
      body: NestedScrollView (
          body: Row(
            children: [
              SizedBox(
                width: 150,
                child: ListView.separated(
                  itemCount: tabName.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 5,
                      color: Colors.teal.withOpacity(0.2),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentTab = index;
                          pageController.jumpToPage(index);
                        });
                      },
                      child: Container(
                        color: Colors.teal.withOpacity(0.2),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: (currentTab == index) ? 50 : 0,
                              width: 5,
                              color: Color(0xFFFF7F50),
                            ),
                            Expanded(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  alignment: Alignment.center,
                                  height: 50,
                                  color: (currentTab == index)
                                      ? Colors.grey.withOpacity(0.2)
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Text(tabName[index]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: <Widget>[
                        for (var i = 0; i < tabName.length; i++)...[
                          GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemCount: TestFun(i),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.transparent,
                                          border: Border.all(color: Colors.teal)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset('assets/img2.jpg',fit: BoxFit.cover,),
                                      ),
                                    ),
                                  ),
                                  Text(nameCatalogue[index]),
                                ],
                              ))],
                      ],
                    ),
                  ))
            ],
          ), headerSliverBuilder: (context, innerBoxIsScrolled) => [

      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        tooltip: '',
        child: Icon(
          Icons.shopping_cart,
          color: Colors.teal,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
  int TestFun(int i){
      switch (i){
        case 1:
          Change(i);
          return  nameCatalogue.length;
        case 2:
          Change(i);
          return nameCatalogue.length;
        default:
          return 2;
      }
  }
  void Change(int i){
    switch(i){
      case 1:
        nameCatalogue = ['A1','A2','A3','A5'];
        break;
      case 2:
        nameCatalogue = ['A1','A2','A3','A5','A6','A7','A8'];
        break;
      default:
        nameCatalogue = ['A1','A2'];
        break;

    }
  }
}