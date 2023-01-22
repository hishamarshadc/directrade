// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sample_project/presentation/admin/screens/approvals/widgets/waiting_card.dart';

class sellerChangesApprovalPage extends StatelessWidget {
  const sellerChangesApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const WaitingCard(),
      itemCount: 2000,
    );
  }
}
