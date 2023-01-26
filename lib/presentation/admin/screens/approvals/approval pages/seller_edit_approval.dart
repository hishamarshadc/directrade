import 'package:flutter/cupertino.dart';
import 'package:sample_project/presentation/admin/screens/approvals/approval%20pages/widgets/edit_card.dart';

class SellerEditsPage extends StatelessWidget {
  const SellerEditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const SellerEditCard(),
      itemCount: 30,
    );
  }
}