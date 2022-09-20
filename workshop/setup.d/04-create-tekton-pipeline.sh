#!/bin/bash
set -x
set +e

cat <<'EOF' | kubectl -n $SESSION_NAMESPACE apply -f -
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: developer-defined-tekton-pipeline
  labels:
    apps.tanzu.vmware.com/pipeline: test
spec:
  params:
  - name: source-url
  - name: source-revision
  tasks:
    - name: test
      params:
      - name: source-url
        value: $(params.source-url)
      - name: source-revision
        value: $(params.source-revision)
      taskSpec:
        params:
        - name: source-url
        - name: source-revision
        steps:
        - name: test
          image: alpine
          script: |-
            echo "Skip Test :)"
EOF
