import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  return FavoritesService();
});

class FavoritesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> toggleFavorite(String userId, Map<String, dynamic> recipe) async {
    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(recipe['name']);

    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(recipe);
    }
  }

  Stream<List<Map<String, dynamic>>> getFavorites(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.data())
            .toList());
  }

  Future<bool> isFavorite(String userId, String recipeName) async {
    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(recipeName)
        .get();
    return doc.exists;
  }
} 