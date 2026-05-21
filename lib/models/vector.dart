/// A fused unit that moves across the map, captures stars, and fights enemies.
///
/// Positions live in Flame (VectorComponent.position) — NOT here.
/// Riverpod state tracks only logical properties: ownership, tier, health.
class Vector {
  final int id;
  final String owner;       // 'player' or 'enemy'
  final int tier;           // 1, 2, or 3
  final int currentHealth;

  Vector({
    required this.id,
    this.owner = 'player',
    this.tier = 1,
    int? currentHealth,
  }) : currentHealth = currentHealth ?? _maxForTier(tier);

  static int _maxForTier(int t) => t == 1 ? 1 : (t == 2 ? 5 : 25);

  int get maxHealth => _maxForTier(tier);
  int get power     => tier == 1 ? 1 : (tier == 2 ? 3 : 9);
  bool get isAlive  => currentHealth > 0;

  Vector copyWith({String? owner, int? tier, int? currentHealth}) => Vector(
        id: id,
        owner: owner ?? this.owner,
        tier: tier ?? this.tier,
        currentHealth: currentHealth ?? this.currentHealth,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'owner': owner,
        'tier': tier,
        'currentHealth': currentHealth,
      };

  factory Vector.fromMap(Map<String, dynamic> map) => Vector(
        id: map['id'] as int,
        owner: map['owner'] as String? ?? 'player',
        tier: map['tier'] as int? ?? 1,
        currentHealth: map['currentHealth'] as int?,
      );

  @override
  bool operator ==(Object other) => other is Vector && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
