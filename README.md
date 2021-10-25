# Coffee First
〜きっとあなたのお気に入りの一杯が見つかる〜<br>
コーヒー豆・焙煎店の検索アプリです。

## URL

## アプリの概要
- コーヒー豆、焙煎店を検索・登録・評価できるWebアプリケーションです。

## アプリ開発経緯

既存のアプリでは都道府県で焙煎店を検索できるものがあるが、市区町村での詳しい検索ができなかったり、豆の情報までは各店舗のHPにアクセスしないと確認できないといったことが不便だなと感じていました。

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



## アプリの特徴

### コーヒー豆の検索
<br>

「生産国」や「価格帯」、「品種」など様々な複合条件でコーヒー豆が検索できます。

<br>

![スクリーンショット 2021-10-25 8 34 50](https://user-images.githubusercontent.com/83042016/138617370-c6babb2f-d5ce-4e91-bca7-312d75042480.png)

<br>

また、新着順や価格が安い順、高い順に検索結果を並べ替えることもできます。<br>
コーヒー豆の画像や、豆名をクリックすると該当コーヒー豆の詳細ページに、店舗名の欄の店舗名をクリックすると該当店舗の詳細ページへと遷移します。

<br>

### 焙煎店の検索

<br>


「店名」や「都道府県」、「住所」から検索することができます。<br>

<br>

![スクリーンショット 2021-10-22 10 16 49](https://user-images.githubusercontent.com/83042016/138378261-d6bf5a0d-12c8-42a2-ae28-761693accbd4.png)

<br>

また、新着順や評価が高い順に検索結果を並べ替えることもできます。<br>
店舗の画像や、店名をクリックすると該当店舗の詳細ページに、店舗名の欄の店舗名をクリックすると該当店舗の詳細ページへと遷移します。

<br>

### コーヒー豆の登録

<br>

![スクリーンショット 2021-10-25 9 01 57](https://user-images.githubusercontent.com/83042016/138618125-45f2eb78-3b31-4e4a-be22-5054938b83b3.png)

<br>
登録する際、ユーザーが生産国の文字を間違えて入力してしまうと検索できなくなる可能性も考えられたため、生産国に関してはenumのセレクトボックスを活用し、プルダウンで選択できるようデータを持たせました。<br>

<br>

![スクリーンショット 2021-10-25 9 03 31](https://user-images.githubusercontent.com/83042016/138618160-480ad16c-6456-4d3c-b7bc-7ee7704e1f82.png)


<br>

### 焙煎店の登録

<br>

![スクリーンショット 2021-10-25 9 07 31](https://user-images.githubusercontent.com/83042016/138618294-b4d839d9-ce1b-47db-9475-df1670d6af27.png)

<br>
こちらも登録する際、ユーザーが都道府県の文字を間違えて入力してしまうと検索できなくなる可能性も考えられたため、都道府県に関してはenumのセレクトボックスを活用し、プルダウンで選択できるようデータを持たせました。<br>

<br>

![スクリーンショット 2021-10-25 9 07 48](https://user-images.githubusercontent.com/83042016/138618317-9bdf3de2-56ff-446f-895a-cb0635287701.png)

<br>

### コーヒー豆の評価

<br>

コーヒー豆詳細ページから該当コーヒー豆の評価を投稿することができます。

<br>

![スクリーンショット 2021-10-25 9 14 02](https://user-images.githubusercontent.com/83042016/138618449-e5dc6914-dc37-4957-bbb0-971816c19394.png)

<br>

### 焙煎店の評価

<br>

店舗詳細ページから該当店舗の評価を投稿することができます。

<br>

![スクリーンショット 2021-10-25 9 11 48](https://user-images.githubusercontent.com/83042016/138618570-1acecbd3-4cc8-4281-9306-b1e0f87d17f4.png)

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
