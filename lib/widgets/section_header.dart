import 'package:flutter/material.dart';
class SectionHeader extends StatefulWidget {
  const SectionHeader({Key? key}) : super(key: key);

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('90s songs',
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,fontWeight: FontWeight.bold
          ),),
        Text('View More',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white
          ),)
      ],
    );
  }
}
