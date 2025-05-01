import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final double rate;
  final int rateCount;
  final Function()? onTap;
  final Widget icon;
  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.rateCount,
    this.onTap,
    required this.icon ,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(image, width: 140, height: 140),
                ),

                Positioned(
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: icon,
                      radius: 15,
                    ),
                  ),
                  right: 2,
                  bottom: 0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icons/star.png', width: 18),
                    SizedBox(width: 5),
                    Text(
                      "$rate ($rateCount)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "\$ $price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
