import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

// class KeranjangCard extends StatelessWidget {
//   // final KeranjangModel cart; //keranjang model API
//   KeranjangCard(this.cart);
//
//   @override
//   Widget build(BuildContext context) {
//     // Butuh API
//     // CartProvider cartProvider = Provider.of<CartProvider>(context);
//
//     return Container(
//       margin: EdgeInsets.only(
//         top: defaultMargin,
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 10,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white10,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       cart.product.galleries[0].url,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       cart.product.name,
//                       style: KopdigTheme.primaryTextStyle.copyWith(
//                         fontWeight: semiBold,
//                       ),
//                     ),
//                     Text(
//                       '\$${cart.product.price}',
//                       style: KopdigTheme.priceTextStyle,
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       cartProvider.addQuantity(cart.id); // bingung API
//                     },
//                     child: Image.asset(
//                       'assets/button_add.png',
//                       width: 16,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     cart.quantity.toString(), // bingung API
//                     style: KopdigTheme.primaryTextStyle.copyWith(
//                       fontWeight: medium,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       cartProvider.reduceQuantity(cart.id); // bingung API
//                     },
//                     child: Image.asset(
//                       'assets/button_min.png',
//                       width: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           GestureDetector(
//             onTap: () {
//               cartProvider.removeCart(cart.id); // bingung API
//             },
//             child: Row(
//               children: [
//                 Image.asset(
//                   'assets/icon_remove.png',
//                   width: 10,
//                 ),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 Text(
//                   'Remove',
//                   style: KopdigTheme.alertTextStyle.copyWith(
//                     fontSize: 12,
//                     fontWeight: light,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
