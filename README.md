# 明石高専オープンデータWeb API（β）

## 概要

[明石高専オープンデータ](http://www.akashi.ac.jp/guide/opendata)を利用した非公式Web APIです．
まだβ版であり開発継続中ですので，issue飛ばすなりpull request投げるなりしていただけると幸いです．

## API詳細（仮）
### GET /api/v1/lectures/:id

シラバス詳細情報

### GET /api/v1/timetables

時間割一覧

#### パラメータ

- year: 年度（西暦） ※ 省略すると今の時間割を取ってくる
- term: 前期/後期 ※ 省略すると今の時間割を取ってくる
- grade: 学年
- department: 学科ID（機械: 1，電気: 2，都市: 3，建築: 4，専攻科: 5）
- course: コースID（電気電子: 1，情報: 2，機械・電子: 3，都市・建築: 4）
- wday: 曜日（0: 日曜，1: 月曜, 2:火曜, 3:水曜，…，6: 土曜）
- period: 時限

#### リクエスト例

```
# 今期の1Mの時間割
/api/v1/timetables?grade=1&department=1

# 2013年後期 4EJの時間割
/api/v1/timetables?year=2013&term=後期&grade=4&department=2&course=2

# 2014年前期 専攻科1ME 月曜3限の時間割
/api/v1/timetables?year=2014&term=前期&grade=1&department=5&course=3
```

### GET /api/v1/timetables/:id

時間割詳細

## TODO

- `scope`のテスト
- `GET /api/v1/timetables`のテスト
- 2014年版のデータ投入
- テストデータに`Faker`を使わないよう変更したい（`autodoc`を活かすため）

## Author

- [izumin5210](//twitter.com/izumin5210)

## License

This code is free to use under the terms of the MIT license.
