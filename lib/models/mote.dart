/// Lifecycle state of a Mote.
enum MoteLifecycle { created, active, fused }

class Mote {
  final int id;
  final MoteLifecycle lifecycleState;

  const Mote({
    required this.id,
    this.lifecycleState = MoteLifecycle.active,
  });

  /// Lifecycle transition helpers — return a new Mote (immutable).
  Mote setCreated() => copyWith(lifecycleState: MoteLifecycle.created);
  Mote setActive()  => copyWith(lifecycleState: MoteLifecycle.active);
  Mote setFused()   => copyWith(lifecycleState: MoteLifecycle.fused);

  bool get isActive  => lifecycleState == MoteLifecycle.active;
  bool get isFused   => lifecycleState == MoteLifecycle.fused;
  bool get isCreated => lifecycleState == MoteLifecycle.created;

  Mote copyWith({int? id, MoteLifecycle? lifecycleState}) {
    return Mote(
      id: id ?? this.id,
      lifecycleState: lifecycleState ?? this.lifecycleState,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'lifecycleState': lifecycleState.name,
  };

  factory Mote.fromMap(Map<String, dynamic> map) => Mote(
    id: map['id'] as int,
    lifecycleState: MoteLifecycle.values.firstWhere(
      (e) => e.name == map['lifecycleState'],
      orElse: () => MoteLifecycle.active,
    ),
  );

  @override
  bool operator ==(Object other) => other is Mote && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
