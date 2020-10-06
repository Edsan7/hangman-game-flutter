import 'package:english_words/english_words.dart';

class WordGenerator {

  static String word;
  static String wordType;

  static String getWord(){
    word = WordPair.random(top:300).first.toString();
    wordType = nouns.contains(word) ? "Noun" : "Adjective";
    return word;
  }
}