import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'language': 'Select Langauge',
          'name': 'User Name',
          'password': 'Password',
          'submit': 'Submit',
          'japan': 'Japan',
          'passvalid': 'should be of min 3 characters and max 11',
          'elo': 'Elo rating',
          'recommandation': 'Recommended for you',
          'userpass': 'User Name and Password',
          'tp': 'Tournaments\nPlayed',
          'tw': 'Tournaments\nWon',
          'wp': 'Winner\nPercentage',
          'simon': 'Simon Baker',
          'user_not_valid': 'User is not valid',
        },
        'ja_JP': {
          'login': 'ログイン',
          'language': '言語を選択する',
          'name': '名前',
          'password': 'パスワード',
          'submit': '送信',
          'elo': 'イロレーティング',
          'recommandation': 'あなたにおすすめ',
          'japan': '日本',
          'user_not_valid': 'ユーザーが無効です',
          'userpass': 'ユーザー名とパスワード',
          'simon': 'サイモンベイカー',
          'tp': 'トーナメント\nプレイ済み',
          'tw': 'トーナメント\n勝ちました',
          'wp': '勝者\nパーセンテージ',
          'passvalid': '最小3文字、最大11文字である必要があります'
        }
      };
}
