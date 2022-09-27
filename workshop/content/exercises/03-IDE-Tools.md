１つ前の章で見たように、Application Accelerator では、Web UI を使用して、プロジェクトテンプレートを .zip ファイルとしてローカルマシンにダウンロードすることができます。この章では、コマンドラインツールを使用して、今回のワークショップを実施するターミナルセッションにテンプレートをダウンロードしていきます。Tanzu CLI は、Tanzu Application Platform で作業するためのプラグイン機能を提供します。それでは、まずはプロジェクトテンプレートの .zip ファイルをダウンロードしてみましょう。

```execute
tanzu accelerator generate spring-sensors --server-url https://accelerator.{{ ENV_VIEW_CLUSTER_DOMAIN }}
```

ダウンロードした .zip ファイルを解凍します。

```execute
unzip -o spring-sensors.zip
```

これは Java の Web アプリケーションです。ソースコードを見てみましょう。

```editor:open-file
file: spring-sensors/src/main/java/org/tanzu/demo/DemoController.java
```

Learning Center では、ブラウザ上で動作する埋め込み型の Coder 開発環境を使っています。もちろん、Visual Studio Code や IntelliJ IDEA などの Tanzu Application Platform でサポートされている IDE を使用して、ローカルマシンでコーディングすることもできます。このアプリでは、センサーデータを生成・表示するための HTTP エンドポイントが定義されています。Embedded Coder エディターの右下の青いバーに Java が表示され、初期化が完了すると親指を立てたマークが表示されるので、数秒待って初期化を完了させてください。 では Tanzu Application Platform の Developer Tooling を使って、アプリケーションを動かしてみましょう。

```editor:open-file
file: spring-sensors/Tiltfile
``` 

Tiltfile は Application Accelerator によってプロジェクトテンプレートの一部として作られたファイルです。Tilt を使用したことがない方はこのスクリプトは難しいもの見えるかもしれませんが、まずはこのスクリプトを起動し、順をおってこのスクリプトが行っていることを説明していきます。コードエディターで Tilt ファイルを右クリックし、`Tanzu.Live Update Start`を選択します。
その後ポップアップメニューから "Live Update Start "を選択します。**または、以下のコマンドをクリックしても同じことができます。

```editor:execute-command
command: tanzu.liveUpdateStart
```

Tiltfile スクリプトは、開発環境にアプリケーションをデプロイするもので、初回実行時には完了まで約2.5分かかりますが、Tiltfile スクリプトは、より高速な反復デプロイを実行するためのセットアップを行うため次回以降の時間はより短縮されます。

