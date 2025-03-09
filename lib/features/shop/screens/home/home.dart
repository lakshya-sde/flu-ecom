import 'package:flutter/material.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/primary_header_conatiner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [PrimaryHeaderContainer(child: Container())])));
  }
}
