// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sample_project/presentation/admin/screens/approvals/widgets/waiting_card.dart';

class SellerApprovalPage extends StatelessWidget {
  const SellerApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => WaitingCard(),
      itemCount: 2000,
    );
  }
}
