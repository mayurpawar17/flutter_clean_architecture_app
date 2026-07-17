import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// 1. This import will show an error until you run build_runner
import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // This will generate an extension called "init()" on GetIt
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => sl.init();