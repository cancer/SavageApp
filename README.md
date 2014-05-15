# SavageApp
Utility web-app for 関東IT土方組合
というか幹事支援ツール

## Requirements
- ○メンバー管理
- ○チーム分け
- △分けられたチームからのスパイぎめ
- △当日の出席管理
(△は優先度低め)

## Specs?
- DB?
 - SQL? mongodb?
 - ~~スプレッドシート使えば楽じゃない？~~
- BaaSつかう
 - Parse.com https://parse.com/
 - http://www.riaxdnp.jp/?p=6420
 - http://popdevelop.com/2013/11/parse-com-and-angularjs-for-easy-setup-of-user-authentication/
 - https://github.com/felipesabino/angular-parse
 - http://josebolanos.wordpress.com/2013/09/30/5-tips-for-using-parse-with-angularjs/
- ワイヤー
 - https://cacoo.com/diagrams/4re2IZRzkpLgMl7D
- ~~Ionic使ってみたい~~
 - ~~http://ionicframework.com/~~
- CSSフレームワークはratchetを使う
 - http://goratchet.com/

### スプレッドシートからデータを取ってくる
この辺
- http://d.hatena.ne.jp/shinobu_siv/20121028/1351405359
- http://qiita.com/kjunichi/items/552f13b48685021966e4

## Setup

node/rubyのインストール
```
$ cat .node-version |ndenv install
$ cat .ruby-version |rbenv install
$ exec $SHELL -l
```

bundlerのインストール
```
$ gem install bundler
```

sass/compassのインストール
```
$ bundle install
```

grunt/grunt-tasksのインストール
```
$ npm install -g grunt-cli
$ npm install
```

bower_componentsのインストール
```
$ npm install -g bower
$ bower install
```

## Start Development
```
$ grunt
$ (open http://localhost:9000/)
```
