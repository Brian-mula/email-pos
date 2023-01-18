import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectDelivery extends ConsumerStatefulWidget {
  const SelectDelivery({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectDeliveryState();
}

class _SelectDeliveryState extends ConsumerState<SelectDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/delivery.png'),
                        fit: BoxFit.cover)),
              ))
        ],
      ),
    );
  }
}
