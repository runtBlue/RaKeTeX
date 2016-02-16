RaKeTeX
===

Rake で管理しながら Markdown ベースで TeX 編集
---

執筆活動をマークダウン".md"の編集に集中して行うためのプロジェクト。

執筆文書の可読性は向上されるでしょう。

実際には".md"ファイルを pandoc を用いて".tex"に変換する。これを input に用いて文書を作ることができる。

後々述べる様々なタスク管理のため $ rake を使用する。
".md" を編集を監視し、pdf の自動生成ができる。
監視には $ guard を使用する。

図のファイル名を使用して、自動的に includegraphic のマクロを自動生成できる。
自動生成する図挿入マクロは、任意で追加、変更拡張できる。
図挿入マクロのキャプションを YAML で一覧管理する。キャプションは ./lib/captions.yml に記述する。

図ファイルは全て pdf に変換して、TeX からはそれしか参照しない。pdf の挿入に必要な .xbb は自動生成する。
こうすることで、TeX が参照する図は figures だけだが、編集者は figures を触らない。



ruby を用いた任意のタスクは ./lib/tasks/*.rake に追加すると機能する。

全ての機能のためのパス管理や詳細設定は ./lib/config.yml に記述する。
動作環境を満たせば、別環境で執筆するのも簡単である。

動作環境
---
ruby
guard
MacTex
dvipdfmx
platex
pandoc
ImageMagick

＾＾；
---

最終的に精細な編集を目指す場合 tex の編集技術は要求される。

pandoc 特有のエスケープ問題に向き合うことになる。

問題を棚上げにするには、動作するまとまった内容を上書きのマクロにしてしまうことだ。

マクロは ./lib/index.tex の内容の順番で読み込まれるため、./lib/macro/superscript.tex に任意の上書きマクロを記述していく。

図のファイル名からマクロを自動生成する
---
1. pine-apple.jpg を用意する。
1. figures.src に置く。
1. $ rake embody を実行する。
1. マクロ「\\apple」を使うことができる。
1. pine-apple@RedApple.jpg にリネームする。
1. $ rake catalog を実行する。
1. 使えるマクロ一覧が表示される。
1. マクロ「\\RedApple」を使うことができる。
1. ./lib/captions.yml を編集し次の内容を追加する。

```
RedApple: '赤いリンゴの写真。$5 \times 5 \ cm\,$の大きさ。キャプション内は数式モード。'
```

1. $ rake catalog を実行する。
1. キャプションが更新される。

マクロを変更、増設する
---
1. ./lib/tasks/catalog.rake を開く。
1. optional_macros に追加、編集した項目、新しく作る接尾辞を記述する。


