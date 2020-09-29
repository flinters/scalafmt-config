# scalafmt-config

本プロジェクトはメンテナンスされていません。

チームが扱うプロダクト内でフォーマットが共通であることが重要であり、フォーマットの内容はさほど重要ではないと考えます。

何も好みがない場合は scalafmt 標準のフォーマットを使用します。
チーム内で共通の見解がある場合には、カスタマイズして使います。


sbt plugin と本設定をセットアップする[スクリプト](setup.sh) を用意しています。ダウンロードして実行するか、次のコマンドを実行します。

```bash
curl -L https://git.io/vdiNA | bash
```

コンパイル時にフォーマットする設定にはしていません。
必要に応じて [IntelliJ で保存時にフォーマットする](https://scalameta.org/scalafmt/docs/installation.html#format-on-save) ように設定します。
