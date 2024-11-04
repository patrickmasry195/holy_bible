import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holy_bible/widgets/custom_button.dart';

class TestamentsPage extends StatelessWidget {
  const TestamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 7,
            ),
            CustomButton(
              onTap: () => context.go('/gospels?testament=Old Testament'),
              text: 'العهد القديم',
              height: 100,
              width: 150,
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              onTap: () => context.go('/gospels?testament=New Testament'),
              text: 'العهد الجديد',
              height: 100,
              width: 150,
            ),
            const Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
