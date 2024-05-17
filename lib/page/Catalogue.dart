import 'package:flutter/material.dart';

class CataloguePage extends StatefulWidget {
  CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  int currentTab = 0;
  PageController pageController = PageController();
  final TextEditingController _fineProduct = TextEditingController();
  List<String> tabName = [
    "Tất cả",
    "Nhóm",
    "Riêng tư",
    "Công việc",
  ];

  dynamic chatMockUpData = [
    [
      {
        'name': 'Henry',
        'time': '9h',
        'message': 'Hi Guy',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Jack',
        'time': '10h',
        'message': 'Hi',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Kali',
        'time': '2h',
        'message': 'So !!',
        'imgpath': "assets/img1.jpg"
      }
    ],
    [
      {
        'name': 'Henry',
        'time': '9h',
        'message': 'Hi Guy',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Kali',
        'time': '2h',
        'message': 'So !!',
        'imgpath': "assets/img1.jpg"
      }
    ],
    [
      {
        'name': 'Henry',
        'time': '9h',
        'message': 'Hi Guy',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Kali',
        'time': '2h',
        'message': 'So !!',
        'imgpath': "assets/img1.jpg"
      }
    ],
    [
      {
        'name': 'Henry',
        'time': '9h',
        'message': 'Hi Guy',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Jack',
        'time': '10h',
        'message': 'Hi',
        'imgpath': "assets/img1.jpg"
      },
      {
        'name': 'Kali',
        'time': '2h',
        'message': 'So !!',
        'imgpath': "assets/img1.jpg"
      }
    ],
  ];

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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.search,
                  size: 35,
                  color: Color(0xFFFF7F50),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabName.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = index;
                      pageController.jumpToPage(index);
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            tabName[index],
                            style: TextStyle(
                              color: (currentTab == index) ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: (currentTab == index) ? 50 : 0,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (currentTab == index) ? Colors.blue : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: tabName.length,
              onPageChanged: (index) {
                setState(() {
                  currentTab = index;
                });
              },
              itemBuilder: (context, index) {
                return getTab(chatMockUpData, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getTab(dynamic chatMockUpData, int tabIndex) {
    return ListView.builder(
      itemCount: chatMockUpData[tabIndex].length,
      itemBuilder: (context, index) {
        final chatData = chatMockUpData[tabIndex][index];

        return GestureDetector(
          onTap: () {
            // Handle tap
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.all(10),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      chatData['imgpath']!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chatData['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        chatData['message']!,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chatData['time']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
