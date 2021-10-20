import 'package:mangadex_library/src/models/chapter/chapterData.dart';

class SingleChapterData {
  late final String result;
  late final String response;
  late final Data data;
  SingleChapterData(this.result, this.response, this.data);
  SingleChapterData.fromJson(Map<String, dynamic> json) {
    result = json['result'] ?? '';
    data = Data.fromJson(json['data']);
  }
}