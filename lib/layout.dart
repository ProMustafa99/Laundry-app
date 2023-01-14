import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_mangment/cubit_app.dart';
import 'package:flutter_application_1/data_mangment/status_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class layout extends StatefulWidget {
  const layout({Key? key}) : super(key: key);

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lundary_cubit(LoginInitialState_Navigation()),
      child: BlocConsumer<lundary_cubit, laundry_app>(
        listener: (context, state) {},
        builder : (context, state) { 
          return Scaffold(
            backgroundColor: Colors.black,
          
            body: lundary_cubit.get(context).screen[lundary_cubit.get(context).currentIndex],bottomNavigationBar: BottomNavigationBar(currentIndex: lundary_cubit.get(context).currentIndex,
                onTap: (index) {
                  lundary_cubit.get(context).changBottomNavigationBar(index);
                },

                type: BottomNavigationBarType.fixed,
                items: lundary_cubit.get(context).bottomItems),
          );
        },
      ),
    );
  }
}
