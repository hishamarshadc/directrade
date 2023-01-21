import 'package:flutter/material.dart';
import 'package:sample_project/presentation/admin/screens/view_users/view_sellers/widgets/seller_card.dart';

class ViewSellersPage extends StatelessWidget {
  const ViewSellersPage({super.key});

  @override
  Widget build(BuildContext context) {
   return ListView.separated(
      itemBuilder: (context, index) => SellerCard(index: index,),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 2000,
    );
  }
}