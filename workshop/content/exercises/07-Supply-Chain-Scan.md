先ほどはLive Update の機能でアプリケーションをデプロイしましたが、今度はtanzu コマンドでデプロイしてみましょう。下記コマンドを入力してみてください。

```execute
tanzu apps workload apply spring-music \
  --app spring-music \
  --git-repo https://github.com/tanzu-japan/spring-music \
  --git-branch tanzu \
  --type web \
  --label apps.tanzu.vmware.com/has-tests=true \
  --annotation autoscaling.knative.dev/minScale=1 \
  -y
```  
source-test-scan-to-url という別のサプライチェーンを使用
アプリがデプロイされ、テスト、イメージのスキャンが実施
サプライチェーンを確認
```dashboard:open-url
url: https://tap-gui.{{ ENV_VIEW_CLUSTER_DOMAIN }}/supply-chain
```

```execute
tanzu apps workload apply spring-music- \
  --app spring-music \
  --git-repo https://github.com/tanzu-japan/spring-music \
  --git-branch vulnerability-demo \
  --type web \
  --label apps.tanzu.vmware.com/has-tests=true \
  --annotation autoscaling.knative.dev/minScale=1 \
  -y
  ``` 
  今度は失敗。同じく確認
  ```dashboard:open-url
url: https://tap-gui.{{ ENV_VIEW_CLUSTER_DOMAIN }}/supply-chain
```

最後にSBOM 見せて終わり
