import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/menu_service.dart';

final menuControllerProvider = StateNotifierProvider<MenuController, AsyncValue<Map<String, dynamic>?>>((ref) {
  final menuService = ref.watch(menuServiceProvider);
  return MenuController(menuService);
});

class MenuController extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final MenuService _menuService;

  MenuController(this._menuService) : super(const AsyncValue.data(null));

  Future<void> generateMenu(Map<String, dynamic> profile) async {
    state = const AsyncValue.loading();
    try {
      final menu = await _menuService.generateMenu(profile);
      state = AsyncValue.data(menu);
    } catch (error, stackTrace) {
      String errorMessage = 'Une erreur est survenue';

      
      if (error.toString().contains('Aucune recette disponible')) {
        errorMessage = 'Aucune recette n\'est disponible dans la base de données';
      } else if (error.toString().contains('Aucune recette ne correspond')) {
        errorMessage = 'Aucune recette ne correspond à vos critères. Veuillez ajuster vos préférences.';
      }
    
      state = AsyncValue.error(error.toString(), stackTrace);
    }
  }
} 