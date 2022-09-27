アプリケーションをデプロイした後、そのアプリケーションが期待通りの動作をせず、診断やトラブルシューティングのためにアプリケーションのランタイムの動作に関する詳細な情報（例えば、アプリケーションのメモリが不足しているのか？ HTTP リクエストのレスポンスタイムはどうなっているのか？）が必要になることがあります。

Tanzu Application Platform は、Cody のような開発者がそういった情報を収集するのに役立つ Live View を提供しています。ここからは Live View の機能について見てみましょう。まずは TAP GUI （Web UI） にアクセスし、先ほど作成したデプロイメントを確認してみましょう。

```dashboard:open-url
url: https://tap-gui.{{ ENV_VIEW_CLUSTER_DOMAIN }}/catalog/default/component/spring-sensors/workloads
```

ここでは、私たちのアプリケーションである `spring-sensors` のデプロイメントを実行しています。複数のデプロイがリストアップされている可能性が高いです。これはマルチテナント開発環境では、異なる開発者 (または異なるワークショップセッション) がそれぞれコードのブランチに取り組んでいるためです。マルチテナント開発クラスタ (TAP では Iterate クラスタとも呼ばれます) では、各開発者は開発環境を分離するために各自のネームスペースで作業しています。

開発者の名前空間は **{{session_namespace}}** です。namespace カラムを確認すると、どの`spring-sensors`アプリが自分のものかを識別することができます。また、namespace カラムで自分の namespace を選択することで、結果をフィルタリングすることができます。 次に、名前空間に対応する行の spring-sensors ハイパーリンクをクリックし、Kind 列の `Knative Service` という値をクリックします。これで、アプリの詳細ビューが表示されます。

![Component View](images/component-view.png)

この画面を下にスクロールすると、アプリに関連する Kubernetes リソースが表示されます。画面の一番下には、Pod があります。Kubernetes では Pod はアプリケーションコンテナが実行される場所です。では、自分の Pod の名前をクリックしてみましょう。

![Pod View](images/pod-view.png)

Pod の情報が見られる画面の上部には、詳細情報が見られる画面へのリンクがあり、プロセスに関する主要な情報に素早くアクセスできます。View Pod Logs をクリックすると、アプリが動作している Kubernetes サーバーのアプリケーションログを見ることができます。

![Pod Detail](images/pod-detail.png)

少し下にスクロールすると、ライブビューペインが表示されます。ここには、Information Category というドロップダウンのメニューがあり、Application Runtime のあらゆるデータを閲覧することができます。

![Live View](images/live-view.png)

少しこれらのデータを好きに確認してみてください。ここには多くの見るべきものがあり、アプリケーションの環境変数のチェック、スレッドスタックトレースの表示、メモリ消費量のグラフ表示、各 HTTP リクエストのトレース情報など、様々な情報を見ることができます。

Live View は現在、Spring Boot の Java アプリケーションと、Steeltoe .NET Core アプリケーションに対応しています。