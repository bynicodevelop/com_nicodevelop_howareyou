final List<Map<String, dynamic>> happyMoods = [
  {"id": "happy", "icon": "😀"},
  {"id": "excited", "icon": "😆"},
  {"id": "proud", "icon": "😎"},
  {"id": "loving", "icon": "😍"},
  {"id": "optimistic", "icon": "😊"},
];

final List<Map<String, dynamic>> sosoMoods = [
  {"id": "tired", "icon": "😴"},
  {"id": "bored", "icon": "😒"},
  {"id": "confused", "icon": "😕"},
  {"id": "surprised", "icon": "😮"},
  {"id": "lonely", "icon": "😞"},
  {"id": "worried", "icon": "😟"},
  {"id": "ashamed", "icon": "😳"},
];

final List<Map<String, dynamic>> sadMoods = [
  {"id": "sad", "icon": "😢"},
  {"id": "angry", "icon": "😡"},
  {"id": "scared", "icon": "😱"},
  {"id": "anxious", "icon": "😰"},
  {"id": "frustrated", "icon": "😤"},
  {"id": "nostalgic", "icon": "😢"},
];

final Map<String, dynamic> moods = {
  "happy": happyMoods,
  "soso": sosoMoods,
  "sad": sadMoods,
};

List<Map<String, dynamic>> getFlatMoods() => List<Map<String, dynamic>>.from(
    moods.entries.map((e) => e.value).expand((e) => e).toList());

// mood from getFlatMoods()
Map<String, dynamic> getFlatMoodsById(String id) =>
    getFlatMoods().firstWhere((e) => e["id"] == id);
