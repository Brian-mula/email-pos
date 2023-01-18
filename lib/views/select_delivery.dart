import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class SelectDelivery extends ConsumerStatefulWidget {
  const SelectDelivery({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectDeliveryState();
}

class _SelectDeliveryState extends ConsumerState<SelectDelivery> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 320,
              child: Column(
                children: [
                  Text(
                    "Choose a pick up method",
                    style: theme.textTheme.headline6!
                        .copyWith(fontSize: 24, color: Colors.orange.shade600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/motor.png"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping",
                                style: theme.textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "We deliver to your door step",
                                style: theme.textTheme.bodyLarge,
                              )
                            ],
                          )
                        ],
                      ),
                      RoundCheckBox(
                          isChecked: isSelected,
                          onTap: (selected) {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/walking.png"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Self picking",
                                style: theme.textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "You will pick by yourself from our shop",
                                style: theme.textTheme.bodyLarge,
                              )
                            ],
                          )
                        ],
                      ),
                      RoundCheckBox(
                          isChecked: false,
                          onTap: (selected) {
                            print("tracking selected");
                          })
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
