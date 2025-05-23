// import 'dart:ffi';

import 'package:bplustree/widgets/controller_widgets/controller_container_widget.dart';
import 'package:bplustree/widgets/ui_tree/bplus_tree_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bplus_tree_bloc.dart';
import '../bloc/bplus_tree_event.dart';
import '../bloc/bplus_tree_state.dart';
import '../widgets/controller_widgets/button_widget.dart';

class BPlusTreeScreen extends StatelessWidget {
  const BPlusTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BPlusTreeBloc(),
      child: Scaffold(
        body: BlocBuilder<BPlusTreeBloc, BPlusTreeState>(
          builder: (context, state) {
            return Column(
              children: [
                ResponsiveContainer(),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: BPlusTreeWidget(
                  root: state.tree.root,
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
