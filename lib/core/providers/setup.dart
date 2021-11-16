import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'user_provider.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider.value(value: UserProvider()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];