## docker で cron のサンプル

おすすめはできないが、一応動いたのでメモ

#### イメージのビルド

```console
$ git clone https://github.com/mapk0y/docker-cron
$ cd docker-cron
$ docker build -t mapk0y/cron .
```

#### コンテナの実行と確認

```console
$ docker run -d --name=cron mapk0y/cron
$ : 数分まつ
$ docker exec cron tail /root/cron-log                                                                                                                                                           
Thu Jun 30 02:49:01 JST 2016
Thu Jun 30 02:50:01 JST 2016
Thu Jun 30 02:51:01 JST 2016
Thu Jun 30 02:52:01 JST 2016
```

#### 懸念事項など

- strace すると sendmail を探している。これは MAILTO の処理のためだと思われるが、どこかエラーだから探しているのかは不明。必要なら入れたほうがいい。cron はバイナリに `/usr/sbin/sendmail` のパスが埋め込まれているのでパスの変更などは不可
- ユーザーごとの crontab (/var/spool/cron/crontab)が動くかは不明
- デフォルトで用意されている cron(cron.hourly)などが動くかは不明。`/etc/crontab` からキックされてるので動くはず
