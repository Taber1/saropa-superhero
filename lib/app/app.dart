import 'package:saropa_task/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:saropa_task/services/api_service.dart';
import 'package:saropa_task/ui/views/superhero/superhero_view.dart';
import 'package:saropa_task/ui/views/superhero_profile/superhero_profile_view.dart';
import 'package:saropa_task/services/local_storage_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SuperheroView),
    MaterialRoute(page: SuperheroProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocalStorageService),
// @stacked-service
  ],
)
class App {}
