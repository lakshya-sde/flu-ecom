import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.only(bottom: TSizes.xs),
        child: 
        // SizedBox(
        //   height: 400,
        //   child: 
          Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ),
        // ),
      ),
    );
  }
}
