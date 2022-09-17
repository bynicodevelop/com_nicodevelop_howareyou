final List<Map<String, dynamic>> happyMoods = [
  {"id": "happy", "icon": "😀"},
  {"id": "sad", "icon": "😢"},
  {"id": "angry", "icon": "😡"},
  {"id": "tired", "icon": "😴"},
  {"id": "bored", "icon": "😒"},
  {"id": "confused", "icon": "😕"},
  {"id": "surprised", "icon": "😮"},
  {"id": "scared", "icon": "😱"},
  {"id": "disgusted", "icon": "🤢"},
  {"id": "excited", "icon": "😆"},
  {"id": "lonely", "icon": "😞"},
  {"id": "proud", "icon": "😎"},
  {"id": "worried", "icon": "😟"},
  {"id": "jealous", "icon": "😒"},
  {"id": "anxious", "icon": "😰"},
  {"id": "frustrated", "icon": "😤"},
  {"id": "ashamed", "icon": "😳"},
  {"id": "guilty", "icon": "😔"},
  {"id": "nostalgic", "icon": "😢"},
  {"id": "sentimental", "icon": "😢"},
  {"id": "grateful", "icon": "😊"},
  {"id": "caring", "icon": "😊"},
  {"id": "loving", "icon": "😍"},
  {"id": "optimistic", "icon": "😊"},
];

final List<Map<String, dynamic>> sosoMoods = [
  {"id": "happy", "icon": "😀"},
  {"id": "sad", "icon": "😢"},
  {"id": "angry", "icon": "😡"},
  {"id": "tired", "icon": "😴"},
  {"id": "bored", "icon": "😒"},
  {"id": "confused", "icon": "😕"},
  {"id": "surprised", "icon": "😮"},
  {"id": "scared", "icon": "😱"},
  {"id": "disgusted", "icon": "🤢"},
  {"id": "excited", "icon": "😆"},
  {"id": "lonely", "icon": "😞"},
  {"id": "proud", "icon": "😎"},
  {"id": "worried", "icon": "😟"},
  {"id": "jealous", "icon": "😒"},
  {"id": "anxious", "icon": "😰"},
  {"id": "frustrated", "icon": "😤"},
  {"id": "ashamed", "icon": "😳"},
  {"id": "guilty", "icon": "😔"},
  {"id": "nostalgic", "icon": "😢"},
  {"id": "sentimental", "icon": "😢"},
  {"id": "grateful", "icon": "😊"},
  {"id": "caring", "icon": "😊"},
  {"id": "loving", "icon": "😍"},
  {"id": "optimistic", "icon": "😊"},
];

final List<Map<String, dynamic>> sadMoods = [
  {"id": "happy", "icon": "😀"},
  {"id": "sad", "icon": "😢"},
  {"id": "angry", "icon": "😡"},
  {"id": "tired", "icon": "😴"},
  {"id": "bored", "icon": "😒"},
  {"id": "confused", "icon": "😕"},
  {"id": "surprised", "icon": "😮"},
  {"id": "scared", "icon": "😱"},
  {"id": "disgusted", "icon": "🤢"},
  {"id": "excited", "icon": "😆"},
  {"id": "lonely", "icon": "😞"},
  {"id": "proud", "icon": "😎"},
  {"id": "worried", "icon": "😟"},
  {"id": "jealous", "icon": "😒"},
  {"id": "anxious", "icon": "😰"},
  {"id": "frustrated", "icon": "😤"},
  {"id": "ashamed", "icon": "😳"},
  {"id": "guilty", "icon": "😔"},
  {"id": "nostalgic", "icon": "😢"},
  {"id": "sentimental", "icon": "😢"},
  {"id": "grateful", "icon": "😊"},
  {"id": "caring", "icon": "😊"},
  {"id": "loving", "icon": "😍"},
  {"id": "optimistic", "icon": "😊"},
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
