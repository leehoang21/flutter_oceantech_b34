// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_oceantech/common/contant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // late final ProfileCubit profileCubit;

  // @override
  // void initState() {

  //   profileCubit = ProfileCubit();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: const [
          // BlocProvider(
          //   create: (context) => profileCubit,
          // ),
        ],
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Main Screen'),
                Text(currentUser?.email ?? ''),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: SizedBox.square(
      //   dimension: 56,
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.black,
      //     onPressed: () async {
      //       await Navigator.pushNamed(
      //         context,
      //         RouteList.createTransaction,
      //       );
      //       transactionCubit.onInit();
      //     },
      //     child: const Icon(
      //       Icons.add_rounded,
      //       size: 52,
      //     ),
      //   ),
      // ),
      // bottomNavigationBar:
      //     _BuildBottomNavigationBar(transactionCubit, profileCubit),
    );
  }
}

// class _BuildBottomNavigationBar extends StatelessWidget {
//   const _BuildBottomNavigationBar();

//   // final ProfileCubit profileCubit;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TabMangerCubit, int>(
//       builder: (context, state) {
//         return BottomNavigationBarWidget(
//           currentIndex: state,
//           onTap: (int value) {
//             // context
//             //     .read<TabMangerCubit>()
//             //     .changePage(value,profileCubit);
//           },
//           iconsData: MainConstants.bottomIconsData,
//         );
//       },
//     );
//   }
// }

// class _BuildBody extends StatelessWidget {
//   const _BuildBody();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TabMangerCubit, int>(
//       builder: (context, state) {
//         return AnimatedSwitcher(
//           duration: MainConstants.screenAnimatingDuration,
//           child: MainConstants.screens[state],
//         );
//       },
//     );
//   }
// }

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.iconsData,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;
  final List<Map<String, dynamic>> iconsData;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: iconsData.asMap().entries.map((entry) {
        return BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
            child: Icon(
              entry.value['iconPath'] as IconData,
              size: 24,
              color: entry.key == currentIndex ? Colors.black : Colors.grey,
            ),
          ),
          label: (entry.value["label"] as String),
        );
      }).toList(),
      selectedFontSize: 12,
      unselectedFontSize: 12,
    );
  }
}
