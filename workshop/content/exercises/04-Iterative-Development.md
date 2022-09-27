Tiltfile スクリプトは、Tanzu Application Platform を利用して、3つの主要なタスクを実行します。
* アプリケーションのコンテナイメージの作成
* アプリケーションの実行と、アプリケーションへアクセスするための Kubernetes リソースを作成
* ソースコードの編集に伴うアプリケーションの "ライブアップデート" を有効にする

これらの各ステップを詳しく見ていきましょう。

<h4>コンテナイメージの作成</h4>

Tanzu Application Plaform の最も強力な機能の1つは、**Tanzu Build Service** です。これは開発者が提供するアプリケーションのソースコードからランタイムコンテナを自動生成します。これらのコンテナイメージを作成するために、CNCFプロジェクトの**Cloud Native Buildpacks**を活用しています。Tanzu は、最新の言語ランタイムの依存性を提供しながら、セキュリティとパフォーマンスのためにコンテナイメージを最適化するためのビルドパックを提供します。Tanzu のビルドパックは、Java、.NET Core、Node、Go、Python、PHPなど、最も一般的なプログラミング言語に対応しています。また、その他の言語のニーズがある場合は、オープンソースコミュニティが他の多くの言語用のビルドパックを提供しています。

開発者の Cody は、Tanzu Build Service のメリットを活用することで、Cody が自分で Dockerfile を作成したり、メンテナンスしたりする必要がなく、コンテナの安全性やパッチの適用を保証するための作業に追われることもなくなります。彼は、コンテナランタイムの生成ではなく、ソースコードを書く本来の作業に集中することができます。Tanzu Build Service の他の利点については後ほど見ていきます。

<h4>Kubernetes リソースの作成</h4>

開発環境が Kubernetes クラスタの場合、Tanzu Application Platform はコンテナイメージをデプロイ・実行するために必要な Kubernetes リソースを作成し、ローカルマシンから Kubernetes にデプロイされたアプリケーションにアクセスできるようにします。この環境では、Tanzu Application Platform に組み込まれているオープンソースプロジェクト Knative をランタイムに使用しています。これらの Kubernetes リソースはリポジトリに格納されているため、GitOps モデルで非常に簡単に使用できます。

<h4>Live Updates</h4>

Tilt では、実行中のアプリケーションを数秒で更新することができます。どのように動作するか見てみましょう。
Tanzu コマンド ラインを使用して、最初のデプロイの準備ができたことを確認します。

```execute-2 
tanzu apps workload get spring-sensors
```

これは、関連する Pod や Knative Services とともに、サプライチェーンを通じて進行するワークロードの状態を報告します。
デプロイの準備が完了すると、下部にこのような作業用の URL が表示されます。もし Knative Services の READY の欄に Ready と表示されない場合は、完了するまでコマンドを何度か繰り返して確認してください。
```
Knative Services
NAME             READY   URL
spring-sensors   Ready   http://spring-sensors-tap-demos-w07-s003.tap.corby.cc
```
ターミナルウィンドウで URL をクリックすると、アプリケーションが表示されます。

では、ここからはアプリケーションのコードを変更してみましょう。現在、バナーのテキストは「Spring Sensors」と表示されています。バナーを他のものに変更してみましょう。

```editor:select-matching-text
file: spring-sensors/src/main/java/org/tanzu/demo/DemoController.java
text: "Spring Sensors"
```

選択したテキストは、コードエディタで入力して置き換えるか、以下をクリックして自動的に文字列の置換を適用することができます。

```editor:replace-text-selection
file: spring-sensors/src/main/java/org/tanzu/demo/DemoController.java
text: Hot New Banner
```

このコード変更をすると、実行中のコンテナに自動的にパッチが適用されます。10秒以内にターミナルウィンドウでアプリケーションが再起動するのが確認できます。アプリケーションが動作しているブラウザのタブに移動して、リフレッシュしてください。
コードの変更が自動的に適用されていることがわかります。

これで、Cody は集中してコード開発を続けることができます。彼はコード変更を反映させる作業を都度することなく、次の機能のコーディングを開始し、実行中のコンテナですぐに段階的な結果を確認しながら開発を続けることができます。Live Update の詳細は[ドキュメント](https://docs.tilt.dev/live_update_reference.html)をご参照ください。


では、他に Tanzu Application Platform を使ってできる機能を引き続き見ていきましょう。
