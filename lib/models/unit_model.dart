// ignore_for_file: depend_on_referenced_packages

/// Base class for all game units (Mote/Vector/Surge).
///
/// Health tiers: Tier-1 = 1 HP, Tier-2 = 5 HP, Tier-3 = 25 HP.
/// Power tiers:  Tier-1 = 1,   Tier-2 = 3,   Tier-3 = 9.
///
/// ⚠️  Do NOT write: currentHealth = maxHealth in the initializer list.
///     Dart disallows referencing this.field in the same initializer list.
///     Use the static helper _maxForTier() instead.
abstract class UnitModel {
  final int id;
  final int tier;
  final int currentHealth;

  UnitModel({required this.id, required this.tier, int? currentHealth})
      : currentHealth = currentHealth ?? _maxForTier(tier);

  static int _maxForTier(int t) => t == 1 ? 1 : (t == 2 ? 5 : 25);

  int get maxHealth => _maxForTier(tier);
  int get power => tier == 1 ? 1 : (tier == 2 ? 3 : 9);
  bool get isAlive => currentHealth > 0;
}
