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
              onTap: () => context.go('/gospels'),
              text: 'العهد القديم',
              fontSize: 20,
              height: 100,
              width: 150,
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              onTap: () => context.go('/gospels'),
              text: 'العهد الجديد',
              fontSize: 20,
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
