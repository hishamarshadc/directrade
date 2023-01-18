import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_project/presentation/admin/screens/view_customers/widgets/customer_card.dart';

class ViewCustPage extends StatelessWidget {
  const ViewCustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CustCard(index:index),
      itemCount: 2000,
    );
  }
}