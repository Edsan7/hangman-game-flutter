import 'package:english_words/english_words.dart';

class WordGenerator {

  static String word;
  static String wordType;


  static String getWord(){
    word = generateWordPairs(top: 300).first.toString();
    if(nouns.contains(word)){
      wordType = "Noun";
    }
    else wordType = "Adjective";
    return word;
  }
}