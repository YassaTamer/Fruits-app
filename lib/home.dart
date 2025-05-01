import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/colors.dart';
import 'package:fruits/model.dart';
import 'package:fruits/product_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    'assets/banners/Slider 1.png',
    'assets/banners/Slider 2.png',
    'assets/banners/Slider 3.png',
  ];

  List<CategoryModel> category = [
    CategoryModel(image: 'assets/category/beverage.png', name: 'beverages'),
    CategoryModel(image: 'assets/category/fruits.png', name: 'fruits'),
    CategoryModel(image: 'assets/category/laundry.png', name: 'laundry'),
    CategoryModel(image: 'assets/category/milk.png', name: 'milk&egg'),
    CategoryModel(image: 'assets/category/vegetables.png', name: 'vegetables'),
  ];

  List<ProductModel> product = [
    ProductModel(
      price: 3.99,
      rate: 4.8,
      rateCount: 287,
      image: "assets/fruits/banana.png",
      name: "banana",
    ),
    ProductModel(
      price: 2.99,
      rate: 4.8,
      rateCount: 287,
      image: "assets/fruits/orange.png",
      name: "orange",
    ),
    ProductModel(
      price: 3.99,
      rate: 4.8,
      rateCount: 287,
      image: "assets/fruits/pepper.png",
      name: "pepper",
    ),
    ProductModel(
      price: 5.99,
      rate: 4.8,
      rateCount: 27,
      image: "assets/fruits/lemon.png",
      name: "lemon",
    ),
  ];

  List basketList = [];

  void toggelSelection(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motor.svg'),
            SizedBox(width: 10),
            Text('61 Hopper street..', style: TextStyle(fontSize: 20)),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 32),
            Spacer(),
            SvgPicture.asset('assets/icons/bascket.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 180,
              aspectRatio: 1,
              viewportFraction: .6,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.linear,
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: List.generate(category.length, (itemIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            category[itemIndex].image,
                            width: 60,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        category[itemIndex].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: List.generate(product.length, (index) {
                  return ProductItem(
                    price: product[index].price,
                    rate: product[index].rate,
                    rateCount: product[index].rateCount,
                    image: product[index].image,
                    name: product[index].name,
                    onTap: () => toggelSelection(product[index]),
                    icon:
                        isSelected(product[index])
                            ? Icon(Icons.close)
                            : Icon(Icons.add),
                  );
                }),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 77,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: basketList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(basketList[index].image),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Container(width: 2, height: 40, color: Colors.white),

                  SizedBox(width: 10),
                  Text(
                    "View Basket",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Badge(
                    backgroundColor: Colors.red,
                    label: Text(
                      basketList.length.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/bascket.svg',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
