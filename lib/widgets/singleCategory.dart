import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SinngeCategory extends ConsumerStatefulWidget {
  const SinngeCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SinngeCategoryState();
}

class _SinngeCategoryState extends ConsumerState<SinngeCategory> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: PageView.builder(
          itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2017/06/22/19/04/bread-2432090__340.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Chocolate Pie",
                          style: theme.textTheme.headline6!
                              .copyWith(color: Colors.orange.shade600),
                        ),
                        Text(
                          "Ksh. 300",
                          style: theme.textTheme.headline6!
                              .copyWith(color: Colors.green.shade600),
                        )
                      ],
                    ),
                  )
                ],
              )),
    );
  }
}
