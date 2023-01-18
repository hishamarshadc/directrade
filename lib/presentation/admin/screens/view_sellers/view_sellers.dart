import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_project/presentation/admin/screens/view_sellers/widgets/seller_card.dart';

class ViewSellersPage extends StatelessWidget {
  const ViewSellersPage({super.key});

  @override
  Widget build(BuildContext context) {
   return ListView.separated(
      itemBuilder: (context, index) => SellerCard(index: index,),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 2000,
    );
  }
}