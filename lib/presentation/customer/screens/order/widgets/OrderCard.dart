
// import 'package:flutter/material.dart';
// import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
// import 'package:sample_project/presentation/user_model.dart';

// class OrderCard extends StatelessWidget {
//   const OrderCard(
//       {Key? key, this.imageAlignment = Alignment.center, this.onProductPressed})
//       : super(key: key);

//   final Alignment imageAlignment;
//   final Function(String)? onProductPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade600,
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, 5),
//             ),
//             BoxShadow(
//               color: Colors.grey.shade300,
//               offset: const Offset(2, 0),
//             )
//           ],
          
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductFullViewPage(
//                         productId:
//                         imageUrl: "assets/images/biscuts.jpeg",
                        
                        
//                   ));
//             },
//             child: SizedBox(
//               child: Row(mainAxisSize: MainAxisSize.min, children: [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomStart,
//                   children: [
//                     Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset('assets/images/biscuts.jpeg',
//                             alignment: imageAlignment, fit: BoxFit.cover)),
//                   ],
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Seller',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           softWrap: false,
//                           style: Theme.of(context).textTheme.caption),
//                       Row(
//                         children: [
//                           Text('Product Title',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                               style: Theme.of(context).textTheme.bodyText1),
//                           const Spacer(flex: 10),
//                           ElevatedButton.icon(
//                             label: const Text('REMOVE'),
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.delete,
//                               size: 17,
//                               color: Colors.red,
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.black,
//                               backgroundColor: Colors.white,
//                               shadowColor: Colors.white,
//                             ),
//                           ),
//                           const Spacer(),
//                           Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.green),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(),
//                               child: const Text("Status",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green)),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text('\$Price',
//                               maxLines: 1,
//                               overflow: TextOverflow.clip,
//                               softWrap: false,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyText2
//                                   ?.copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.orange)),
//                           const Spacer(),
//                           Text('XQuantity',
//                               maxLines: 1,
//                               overflow: TextOverflow.clip,
//                               softWrap: false,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyText2
//                                   ?.copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.orange)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
