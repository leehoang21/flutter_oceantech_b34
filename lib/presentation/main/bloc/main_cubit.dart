import 'package:flutter_bloc/flutter_bloc.dart';

class TabMangerCubit extends Cubit<int> {
  TabMangerCubit() : super(0);

  // void changePage(
  //     int index, ProfileCubit profileCubit) {
  //   for (var i in MainConstants.bottomIconsData.asMap().entries) {
  //    if (i.value['label'] == 'My page') {
  //       profileCubit.onInit();
  //     }
  //   }
  //   emit(index);
  // }
}
