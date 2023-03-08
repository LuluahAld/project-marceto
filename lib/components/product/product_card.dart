import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/model/appData.dart';

class ProsuctCard2 extends StatefulWidget {
  ProsuctCard2({Key? key, required this.product, required this.cardWidth, required this.productImgWidth})
      : super(key: key);
  Product product;
  double cardWidth;
  double productImgWidth;
  @override
  State<ProsuctCard2> createState() => _ProsuctCard2();
}

class _ProsuctCard2 extends State<ProsuctCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardWidth,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: widget.productImgWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.contain,
                    )),
                const Positioned(top: 20, left: 20, child: Icon(Icons.favorite_border)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MText(text: widget.product.name, fontweight: FontWeight.normal, color: green, size: 16),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            appData.cart.add(widget.product);
                          },
                          child: const Icon(Icons.shopping_cart)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.category,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16, color: green),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MText(text: '${widget.product.price} SAR', fontweight: FontWeight.normal, color: green, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
