import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleBarndPage extends StatelessWidget {
  const SingleBarndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: 320.0,
            pinned: true,
            title: Text('Name of brand',style: GoogleFonts.nunito(
              textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white)
            ),),
            actions: [
              AnimatedContainer(
                height: 40,
                width: 40,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Colors.white12.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.more_horiz,color: Colors.white,),
              ),
            ],
            centerTitle: true,
            flexibleSpace: LayoutBuilder(
              builder: (context, contrains) {
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                          height: 150,
                          width: double.infinity,
                        child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.transparent.withOpacity(0.7), // Set the opacity value (0.0 to 1.0)
                          BlendMode.srcATop,
                        ),
                          child: Image.asset(
                            'assets/img1.jpg',
                            fit: BoxFit.fitWidth,
                          )),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 5,color: Colors.teal),
                            borderRadius: BorderRadius.circular(80)
                          ),
                          height: 125,
                          width: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              'assets/img1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),


                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
