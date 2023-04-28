import 'package:hive/hive.dart';
import 'package:myapp/src/teta_files/imports.dart';

//false = dark_mode
//true = light mode
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false){
    init();
  }

  Future init() async {
    final box = await Hive.openBox<dynamic>('theme_data');
    if (box.containsKey('flag')) {
      final val = box.get('flag');
      emit(val as bool);
    } else {
      box.put('flag', false);
      emit(false);
    }
  }

  Future changeVal() async {
    final box = await Hive.openBox<dynamic>('theme_data');
    var val = state;
    val = !val;
    box.put('flag', val);
    emit(val);
  }

  Color getColor(String key) => state
        ? TetaThemes.lightTheme[key] as Color
        : TetaThemes.darkTheme[key] as Color;
}
