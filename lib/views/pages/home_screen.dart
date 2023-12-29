import 'package:flutter/material.dart';
import 'package:jwelery_app/model/navigation_model.dart';
import 'package:jwelery_app/views/widgets/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../constants/strings.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/slide_drawer.dart';
import 'categories_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> images = [
    "https://newspaperads.ads2publish.com/wp-content/uploads/2020/11/fuzion-queentessential-extravagance-finest-diamond-jewelry-ad-toi-ahmedabad-6-11-2020.jpg",
    "https://i.pinimg.com/564x/43/68/b2/4368b2a77dceb87086c8752ce87c7728.jpg",
    "https://www.eventalways.com/media/eventgallery/large/gallery-image-1646823449.jpg",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/jewelry-collection-instagram-post-flyer-design-template-5cbe7bd2c299c98f3145f0a61d7b5cae_screen.jpg",
    "https://images.freecreatives.com/wp-content/uploads/2016/03/Luxury-Jewelry-Advertising.jpg"
  ];

  late CarouselController carouselController;

  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();

  }

  @override
  Widget build(BuildContext context) {




    double width = 20.0;
    double height = 20.0;

    List<NavigationModel> listOfNavigationModel = <NavigationModel>[];
    listOfNavigationModel.add(
        NavigationModel(
            Image.asset("assets/images/notification.png", width: width, height: height, color: Colors.white), "Notifications"));
    listOfNavigationModel.add(NavigationModel(
        Image.asset("assets/images/gold_bars.png", width: width, height: height), "Gold Rate"));
    listOfNavigationModel.add(
        NavigationModel(Image.asset("assets/images/gift.png", width: width, height: height,), "Promotions"));
    listOfNavigationModel.add(
        NavigationModel(Image.asset("assets/images/branding.jpg", width: width, height: height, color: Colors.white), "Brands"));
    listOfNavigationModel.add(NavigationModel(
        Image.asset("assets/images/roadmap.png", width: width, height: height, color: Colors.white), "Plans"));
    listOfNavigationModel.add(NavigationModel(
        Image.asset("assets/images/info.png", width: width, height: height, color: Colors.white,), "About us"));
    listOfNavigationModel.add(NavigationModel(
        Image.asset("assets/images/account.png", width: width, height: height), "My Account"));
    listOfNavigationModel.add(
        NavigationModel(Image.asset("assets/images/gears.png", width: width, height: height), "Settings"));
    listOfNavigationModel.add(
        NavigationModel(Image.asset("assets/images/terms_and_conditions.png", width: width, height: height, color: Colors.white), "Terms and Conditions"));
    listOfNavigationModel.add(NavigationModel(Image.asset("assets/images/login.png", width: width, height: height, color: Colors.white,), "Login"));

g
    return Scaffold(
      key: scaffoldKey,
      drawer: NavDrawer(
        backgroundColor: Color(0xFF9A0056),
        fontColor: Colors.white,
        fontSize: 15.0,
        fontFamily: 'Montserrat',
        listOfNavigationModel: listOfNavigationModel,
          fontWeight: FontWeight.bold
      ),
      appBar: AppBarWidget(
          menuIcon: Icons.menu,
          onPressed: () {
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
            }else{
              scaffoldKey.currentState!.openDrawer();
            }
          }, isNeededForHome: true,),
      body: Column(

        children: [
          CarouselSlider(
            carouselController: carouselController,
            items: images.map((image) => Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill
                  )
              ),
            )).toList(),
            options: CarouselOptions(
              viewportFraction: 1.04,
                height: MediaQuery.of(context).size.height/2,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason){
                  setState(() {
                    currentIndex = index;
                  });
                }
            ),


          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DotsIndicator(
              dotsCount: images.length,
              position: currentIndex,
              onTap: (index){
                carouselController.animateToPage(index);
              },
              decorator: const DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.black,
                size: Size.square(12.0),
                activeSize: Size.square(15.0),

              ),
            )

          )
        ],
      )
    );
  }
}
