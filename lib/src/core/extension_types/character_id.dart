extension type CharacterID(int id) {
  bool operator <(CharacterID other) => id < other.id;
  bool operator <=(CharacterID other) => id <= other.id;
  bool operator >(CharacterID other) => id > other.id;
  bool operator >=(CharacterID other) => id >= other.id;

  bool isEqualTo(CharacterID other) => id == other.id;
}
