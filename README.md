# Coffee First

![スクリーンショット 2021-10-26 8 27 12](https://user-images.githubusercontent.com/83042016/138879142-750b6b8c-19aa-4f8f-bd67-0242ea47bcba.png)


〜きっとあなたのお気に入りの一杯が見つかる〜<br>
コーヒー豆・焙煎店の検索アプリです。

## URL

## アプリの概要
- コーヒー豆、焙煎店を検索・登録・評価できるWebアプリケーションです。

## アプリ開発経緯

私自身、コーヒーが大好きで新しい焙煎店やコーヒー豆を探すために既存のアプリをよく見ていたのですが、既存のアプリでは都道府県で焙煎店を検索できるものはあるのですが、市区町村での詳しい検索ができなかったり、豆の情報までは各店舗のHPにアクセスしないと確認できないといったことに関して不便だなぁと感じていました。

- #### 既存のアプリでは都道府県までの検索しかできず市区町村の範囲には対応していない
- #### 豆の生産国での検索などには対応していない
- #### ユーザーによるクチコミなどは他のサイトを見るなどしてまた別にタブを開いて検索する必要がある
- #### 豆の生産地などの情報は各店舗のHPにアクセスしないと確認できない

そのため、アプリひとつで完結できるような検索機能を持った焙煎店のまとめアプリのようなものを作れば上記の煩わしさは解消されると思ったため、今回本アプリを作成することとしました。

## 工夫した点　　

### アプリ全体

- 様々な媒体下での使用を考慮してレスポンシブデザインの対応に注意しました。
- 配色や文字の大きさ、要素と要素の間隔、リンクの配置など、ユーザー目線で見やすく使いやすいアプリになっているか意識しながら作成しました。

### 検索ページ

- 自分であれば検索結果を評価の高い順や、価格の安い順で閲覧したいなと、ユーザー目線に立って考え検索結果の並べ替え機能を実装しました。
- ユーザーがコーヒー豆や焙煎店を登録した際、画像の登録がないと一覧画面のレイアウトが見づらくなってしまうため、画像の登録がない場合にはデフォルト画像を表示させました。

### 登録ページ

- コーヒー豆の「生産国」や店舗の「都道府県」に関してはユーザーが文字を間違えて入力してしまうと検索できなくなる可能性も考えられたため、enumのセレクトボックスを活用し、プルダウンで選択できるようにしました。
- 入力が必須な項目に関しては一目で分かるように赤色の`*`を表示させました。
- 登録した画像が消えてしまわないようにするため、画像の保存先はAWS S3に設定しました。

### 詳細ページ

- あまりページ数が多くなるとユーザー視点で見た時に使用感が悪くなってしまうと考えたため、詳細ページから評価を投稿できるような仕様としました。
- コーヒー豆を検索し詳細ページの情報を閲覧している際には、おそらく「この豆はどこのお店で買えるんだろう」、店舗を検索し詳細ページの情報を確認している際には「この店ではどんなコーヒー豆を販売しているんだろう」といったことをユーザーは考えるのではないかと思ったため、各詳細ページに店舗・コーヒー豆の名前を各詳細ページへのリンクとし、表示させました。
- 店舗詳細ページの各店舗のURLはテキスト形式をハイパーリンクとし、クリックするだけで別タブで該当URLのページを開くことができる仕様としました。

### ユーザー詳細ページ

- 該当ユーザーが登録したコーヒー豆、焙煎店の一覧が表示される仕様としました。カード形式のフォームに表示されているコーヒー豆名や店名は各詳細ページのリンクとなっており、すぐに詳細情報を確認することができます。また、管理がしやすいよう、ユーザー詳細ページを閲覧しているユーザーが登録者であれば編集・削除のリンクが表示されるよう設定しました。



## アプリの使い方

### コーヒー豆の検索
<br>

「生産国」や「価格帯」、「品種」など様々な複合条件でコーヒー豆が検索できます。

<br>

![bean-search new](https://user-images.githubusercontent.com/83042016/138647870-a75e9589-6b42-4ebd-b524-fc8582cee62a.gif)


<br>

また、新着順や価格が安い順、高い順に検索結果を並べ替えることもできます。<br>

![bean-price new](https://user-images.githubusercontent.com/83042016/138648247-08210e1d-8f6c-4b6e-8441-4bbe222ecd83.gif)

<br>

### 焙煎店の検索

<br>


「店名」や「都道府県」、「住所」から検索することができます。<br>

<br>

![shop-search](https://user-images.githubusercontent.com/83042016/138648805-a6ba1578-c33e-40cb-807d-190ed1a6898d.gif)


<br>

また、新着順や評価が高い順に検索結果を並べ替えることもできます。<br>

![shop-rate](https://user-images.githubusercontent.com/83042016/138650480-7ecaec27-3d67-467c-805c-dbbce16fed77.gif)

<br>

### コーヒー豆の登録

<br>

![bean new](https://user-images.githubusercontent.com/83042016/138645275-db0963a1-5dd0-4a0b-959c-df67aef93d7a.gif)

<br>
登録する際、ユーザーが生産国の文字を間違えて入力してしまうと検索できなくなる可能性も考えられたため、生産国に関してはenumのセレクトボックスを活用し、プルダウンで選択できるようデータを持たせました。<br>


<br>

### 焙煎店の登録

<br>

![beans new](https://user-images.githubusercontent.com/83042016/138640964-0674764a-6a6e-4b84-8350-79e56f68b2d7.gif)

<br>
こちらも登録する際、ユーザーが都道府県の文字を間違えて入力してしまうと検索できなくなる可能性も考えられたため、都道府県に関してはenumのセレクトボックスを活用し、プルダウンで選択できるようデータを持たせました。<br>

<br>

### コーヒー豆の評価

<br>

コーヒー豆詳細ページから該当コーヒー豆の評価を投稿することができます。

<br>

![bean-rated](https://user-images.githubusercontent.com/83042016/138653340-b68d4e3d-aede-426f-a7c9-64dbda8a9067.gif)

<br>

### 焙煎店の評価

<br>

店舗詳細ページから該当店舗の評価を投稿することができます。

<br>

![shop-rated](https://user-images.githubusercontent.com/83042016/138653798-3dbbc44b-25b8-4e81-a8b0-90c585f0bd3d.gif)

<br>

## アプリの機能一覧

<br>

現時点(2021年10月)で実装済みの機能は以下の通りです。

<br>

### メイン機能  
<br>

- **コーヒー豆・焙煎店の検索** (ransack, enum_help, ページネーション(kaminari))
- **コーヒー豆・焙煎店の登録、編集、削除** (CRUD処理, CarrierWave, minimagic)
- **コーヒー豆・焙煎店の評価** (CRUD処理)
  - 星評価(jQuery Raty)

<br>

### 認証機能  

- ユーザー登録・ログイン・ログアウト(devise)
- ゲストログイン
- プロフィール編集
- アカウント削除
- 管理画面(active_admin)

## ER図

<img width="715" alt="スクリーンショット 2021-10-25 14 32 00" src="https://user-images.githubusercontent.com/83042016/138639586-94c4ef21-45cf-484f-870e-0def39d75b8e.png">

## 使用技術　　
- 言語 ：Ruby(2.7.3)
- フレームワーク :Ruby on Rails(6.1.4.1)
- フロントエンド :HTML/Scss/JavaScript
- DB :PostgreSQL
- インフラ :Heroku
- ソースコード管理 :Github
- 開発環境　:MacOS/Visual Studio Code

## 今後追加で実装したい機能

- 気になるコーヒー豆・焙煎店をユーザー毎にチェックしておける機能
- 検索機能に位置情報での検索を追加
- テスト(Rspec)を記述
- AWSへデプロイ
