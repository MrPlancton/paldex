import 'package:paldex/configs/colors.dart';
import 'package:paldex/domain/entities/category.dart';
import 'package:paldex/routes.dart';

const List<Category> categories = [
  Category(name: 'Paldex', color: AppColors.teal, route: Routes.paldex),
  Category(name: 'Moves', color: AppColors.red, route: Routes.paldex),
  Category(name: 'Abilities', color: AppColors.blue, route: Routes.paldex),
  Category(name: 'Items', color: AppColors.yellow, route: Routes.items),
  Category(name: 'Locations', color: AppColors.purple, route: Routes.paldex),
  Category(name: 'Type Effects', color: AppColors.brown, route: Routes.typeEffects),
];
