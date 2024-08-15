import 'package:get_it/get_it.dart';
import 'package:palomaps_project/domain/app_repository.dart';
import 'package:palomaps_project/domain/database/product_database.dart';
import 'package:palomaps_project/domain/impl/app_repository_impl.dart';
import 'package:palomaps_project/extensions/color/default_theme_colors.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // getIt.registerSingleton<SharedPreferences>(
  //     await SharedPreferences.getInstance());
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper());
  getIt.registerSingleton<AppRepository>(AppRepositoryImpl());
  getIt.registerSingleton<DefaultThemeColors>(DefaultThemeColors());

  // getIt.registerSingleton<CustomerRepository>(CustomerRepositoryImpl());
  // getIt.registerSingleton<PaymentRepository>(PaymentRepositoryImpl());
}
