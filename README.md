# アプリケーション名
Wedding Budget

# アプリケーション概要
結婚式にかかる費用を都度入力することで、今いくらになっているのかを把握することができる

## URL

https://wedding-budgets.onrender.com/

## テスト用アカウント

- Basic認証ID: admin
- Basic認証パスワード: 2222
- メールアドレス: test@gmail.com
- パスワード: aaa111

## 利用方法

1. トップページ（イベント一覧画面）からユーザー新規登録を行う
2. イベント、見積を登録する

## アプリケーションを作成した背景
- 私が現在、結婚式の準備を行っており、見積時点から費用がいくら上がっているのか把握できていませんでした。
- そのため費用に動きがあった際、都度記録できれば費用を把握することができ、節約すべきところがあるか、増額しても問題ないのかなど判断がつきやすくなると考えました。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/121dOuFKGHeaaWB940u9zocZQ3VbN0_5Cxoz1q_1JWvg/edit?usp=sharing

## 実装した機能についての画像やGIFおよびその説明
| NO | 画面        | 機能                | 目的                            | 様子                                      |
|----|------------|-------------------- |--------------------------------|-------------------------------------------|
| 1  | ユーザー登録 | 新規登録・ログイン機能  | ユーザーごとにイベントを管理するため | [![Image from Gyazo](https://i.gyazo.com/a4d40e6936b720d28408f0039833678b.gif)](https://gyazo.com/a4d40e6936b720d28408f0039833678b) |
| 2  | イベント登録 | イベント登録機能       | イベント名、開催日を設定するため    | [![Image from Gyazo](https://i.gyazo.com/328531f7424dccc5094f5ebb44e2b7c3.gif)](https://gyazo.com/328531f7424dccc5094f5ebb44e2b7c3) |
| 3  | イベント編集 | イベント編集機能       | 登録に誤りがあった際に修正するため  | [![Image from Gyazo](https://i.gyazo.com/8a17ea341fd5e479344e88502f2f9dfe.gif)](https://gyazo.com/8a17ea341fd5e479344e88502f2f9dfe) |
| 4  | 見積登録    | 見積登録機能           | 現在の金額を登録するため       | [![Image from Gyazo](https://i.gyazo.com/688a2de31515b644cbb8401efc0e4fc3.gif)](https://gyazo.com/688a2de31515b644cbb8401efc0e4fc3) |
| 5  | イベント詳細 | イベント・見積金額参照機能 | 現在の金額、見積時からの差分を把握するため      | [![Image from Gyazo](https://i.gyazo.com/0f2d017d31fc199ddf46ca478ea4982c.gif)](https://gyazo.com/0f2d017d31fc199ddf46ca478ea4982c) |

## 実装予定の機能

- ユーザビリティ向上のため、2回目以降に見積を登録する際、前回に入力した内容を初期表示する
- 現在は合計金額のみ表示しているため、挙式、料理などのカテゴリごとに金額を比較できるようにする

## データベース設計
![ER](https://github.com/mitstaku/wedding-budgets/blob/main/ER.png)

## 画面遷移図
![screen_transition_diagram](https://github.com/mitstaku/wedding-budgets/blob/main/screen_transition_diagram.png)

## 開発環境

- フロントエンド：HTML/CSS/JavaScript/chart.js
- バックエンド：Ruby 3.2.0/Rails 7.0.8
- データベース：PostgreSQL
- インフラ：Render
- テキストエディタ：Visual Studio Code/Cursor

## ローカルでの動作方法

以下のコマンドを順に実行。
- git clone https://github.com/mitstaku/wedding-budgets.git
- cd xxxx
- bundle install
- yarn install

## 工夫したポイント
1.視覚的に見やすく
- chart.jsを用いて金額の推移を見やすく工夫した
- オリジナルロゴの作成や、ベーシックな色合いなどの見た目を工夫した

2.ユーザーが使いやすく
- 見積登録画面で、カテゴリごとに＋ボタンを配置し、必要な分だけテキストボックスを表示するようにした
- イベントや見積が登録されていない場合には「イベントを登録しましょう」などの文言と登録ボタンを表示するようにし、次に何をすればいいかユーザーがわかりやすいように工夫した