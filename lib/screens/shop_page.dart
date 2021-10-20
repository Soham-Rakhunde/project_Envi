import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_envi/services/coupon_clipper.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List couponList = [
  //   {
  //     'icon': FaIcon.a,
  //   },
  // ]

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          // leading: const Center(
          //   child: FaIcon(
          //     FontAwesomeIcons.chevronLeft,
          //   ),
          // ),
          flexibleSpace: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'Coupons',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Cinzel",
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
        ),
      ),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          buildCoupons(
            _size,
            title: "Amazon",
            price: "50",
            color: Colors.amberAccent,
            url: "https://pngimg.com/uploads/amazon/amazon_PNG27.png",
            scale: 2,
            textSpan: <TextSpan>[
              const TextSpan(
                  text: '₹ '
              ),
              const TextSpan(
                text: '100',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold
                ),
              ),
              const TextSpan(
                  text: ' Coupon'
              )
            ],
          ),
          buildCoupons(
            _size,
            title: "NGO",
            price: "10",
            color: Colors.greenAccent,
            scale: 5,
            url: "https://www.pngall.com/wp-content/uploads/2017/05/Save-Earth-PNG-Picture.png",
            textSpan: <TextSpan>[
              const TextSpan(
                  text: 'Donate ₹'
              ),
              const TextSpan(
                text: '1K',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          // Image.asset("assets/images/earth.png"),
          buildCoupons(
            _size,
            title: "Metro",
            price: "25",
            color: Colors.purple,
            isAsset: true,
            scale: 2,
            url: "assets/images/metrologo.png",
            textSpan: <TextSpan>[
              const TextSpan(
                text: '1',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
              const TextSpan(
                  text: ' Month Pass '
              ),
            ],
          ),
          buildCoupons(
            _size,
            title: "Flipkart",
            price: "20",
            scale: -1,
            color: Colors.blueAccent,
            url: "https://www.freepnglogos.com/uploads/flipkart-logo-png/flipkart-inventory-management-system-zap-inventory-1.png",
            textSpan: <TextSpan>[
              const TextSpan(
                text: '20',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold
                ),
              ),
              const TextSpan(
                  text: ' % Discount'
              )
            ],
          ),
          buildCoupons(
            _size,
            title: "Tree Shop",
            price: "5",
            color: Colors.orangeAccent,
            isAsset: true,
            scale: 15,
            url: "assets/images/treelogo.png",
            textSpan: <TextSpan>[
              const TextSpan(
                  text: 'Buy '
              ),
              const TextSpan(
                text: '1',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
              const TextSpan(
                  text: ' Get '
              ),
              const TextSpan(
                text: '1',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
              const TextSpan(
                  text: ' Free'
              ),
            ],
          ),
        ],
      ),
    );

  }

  Padding buildCoupons(Size _size, {required String title,required String price,
    required String url, required Color color, List<InlineSpan>? textSpan, bool isAsset = false, int scale =0 }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: _size.width*0.1),
      child: CustomPaint(
      painter: BoxShadowPainter(),
      child: ClipPath(
        clipper: CouponClipper(), //my CustomClipper
          child: Container(
            color: Colors.white,
                width: _size.width*0.8,
                height: _size.width*0.35,
            child: CustomPaint(
              painter: DottedLinePainter(
                color: color
              ),
              child:
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 21
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text:  TextSpan(
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                children: textSpan,
                            ),
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Price: $price ',
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15
                                  ),
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.diceD20,
                                  size: 15,
                                  // color: Colors.lightGreen,
                                ),
                              ],
                            ),
                        ]
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(35.0 - scale),
                        child: isAsset
                            ? Image.asset(url)
                            : Image.network(url),
                      ),
                    ),

                  ],
                ),
          ),
        ), // my widgets inside
          )),
    );
  }
}
