# fileStructure
このプログラムは2018/4/6から開発を開始した指定ディレクトリ以下のファイル名を全て入手するプログラムです。
ディレクトリA
|-ディレクトリB
|   |-ファイルA
|   |-ファイルB
|-ディレクトリC
といった形で表示します。そして指定ディレクトリ下にあるファイルを全て書き出すので指定ディレクトリによっては時間がかかるかもしれません。

# 使い方
fileStructure targetDir
とコマンドプロンプトに入力して使います。([]はオプションです。)
targetDir       :開始ディレクトリとなるディレクトリ

詳しくは fileStructure --help と入力してください。
