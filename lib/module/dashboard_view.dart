import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  final Function(int) onNavigate;

  const DashboardView({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                onNavigate(1);
              },
              child: const Text('Go to Product Detail /product-detail/1'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                onNavigate(2);
              },
              child: const Text('Go to Product Detail /product-detail/2'),
            )
          ],
        ),
      ),
    );
  }
}
