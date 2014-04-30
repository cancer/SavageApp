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
 - スプレッドシート使えば楽じゃない？
- ワイヤー
 - https://cacoo.com/diagrams/4re2IZRzkpLgMl7D
- Ionic使ってみたい
 - http://ionicframework.com/

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

bowerのインストール
```
$ npm install -g bower
$ bower install
```

