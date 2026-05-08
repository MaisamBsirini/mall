import 'package:flutter/material.dart';
import 'package:mall/modules/home/views/area3D_view.dart';
import 'package:mall/modules/home/widgets/bottom_panel.dart';

class ExplorerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 3D view
          Area3DView(),

          /// draggable panel
          BottomPanel(),
        ],
      ),
    );
  }
}