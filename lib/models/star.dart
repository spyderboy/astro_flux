/// A capture-able node that produces Motes automatically.
/// Stars have three tiers of growth — higher tiers produce faster.
class Star {
  final int id;
  final int tier; // 1, 2, or 3
  final String ownerId; // empty string = uncaptured

  const Star({
    required this.id,
    this.tier = 1,
    this.ownerId = '',
  });

  bool get isCaptured => ownerId.isNotEmpty;

  /// Motes produced per second, based on tier.
  double get productionRate => tier * 0.5;

  Star copyWith({int? tier, String? ownerId}) {
    return Star(
      id: id,
      tier: tier ?? this.tier,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'tier': tier,
        'ownerId': ownerId,
      };

  factory Star.fromMap(Map<String, dynamic> map) => Star(
        id: map['id'] as int,
        tier: map['tier'] as int? ?? 1,
        ownerId: map['ownerId'] as String? ?? '',
      );

  @override
  bool operator ==(Object other) =>
      other is Star &&
      other.id == id &&
      other.tier == tier &&
      other.ownerId == ownerId;

  @override
  int get hashCode => Object.hash(id, tier, ownerId);
}
