import 'package:animated_switch_grid_list/screen_sizes.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

setupLocators(){
  locator.registerLazySingleton(() => ScreenSizes());
}