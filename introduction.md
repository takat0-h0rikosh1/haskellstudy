# Haskell は何か?

Haskel は純粋関数型プログラミング言語です。  
命令プログラミング言語はコンピュータに **何をするか** を伝えます。
純粋関数型プログラミングは **何であるか** を伝えます。

純粋関数型言語では、関数は副作用は持ちません。
何かを計算して返すだけです。複数回呼ばれても同じ結果が変えるので参照透明性が保証されます。

Haskell は遅延評価します。

Haskell は静的型付け言語です。
どのコード片が数字でどれが文字列かコンパイラがプログラムのコンパイル時に知っているということです。

Haskel は型推論を持つ優れた型システムを採用しています。
わざわざ明示的に書かなくても大丈夫です。

Haskel はエレガントで簡潔です。
命令形で書かれたものと比べて短くなり簡潔になります。
よって保守しやすく、バグも減ります。

# Required

## GHC

The Glasgow Haskell Compiler の略です。
広く利用されている Haskell のコンパイラです。

### Cabal

Haskell のプログラムやライブラリのパッケージングシステムです。

#### Install ghcup

GHC のバージョン管理ツール。jenv とか rbenv とかと同じノリです。

https://gitlab.haskell.org/haskell/ghcup/blob/master/README.md#manual-install

```
$ curl https://get-ghcup.haskell.org -sSf | sh

Done installing, run "ghci-8.6.5" or set up your current GHC via: ghcup set 8.6.5
Setting GHC to 8.6.5
Done, make sure "/Users/takato_horikoshi/.ghcup/bin" is in your PATH!
Setting GHC to 8.6.5
Done, make sure "/Users/takato_horikoshi/.ghcup/bin" is in your PATH!
Installing cabal-install-2.4.1.0 into "/Users/takato_horikoshi/.ghcup/bin"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 4878k  100 4878k    0     0   889k      0  0:00:05  0:00:05 --:--:--  891k
Successfully installed cabal-install into
  /Users/takato_horikoshi/.ghcup/bin

You may want to run the following to get the really latest version:
    cabal new-install cabal-install

And make sure that "~/.cabal/bin" comes *before* "/Users/takato_horikoshi/.ghcup/bin"
in your PATH!
cabal: unrecognised command: new-update (try --help)

# bash: export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
$ set -x PATH $HOME/.cabal/bin/ $HOME/.ghcup/bin $PATH
```

## Install Stack

Haskell プロジェクトを開発するためのクロスプラットフォームです。
以下の機能を提供します。

- 各環境への GHC の自動インストール
- プロジェクトに必要なパッケージのインストール
- プロジェクトのビルド
- プロジェクトのテスト
- プロジェクトのベンチマーク

```sh
$ curl -sSL https://get.haskellstack.org/ | sh

Using generic bindist...

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   619    0   619    0     0   2021      0 --:--:-- --:--:-- --:--:--  2016
100 8134k  100 8134k    0     0  61985      0  0:02:14  0:02:14 --:--:-- 83362
Installing Stack to: /usr/local/bin/stack...

-------------------------------------------------------------------------------

Stack has been installed to: /usr/local/bin/stack

NOTE: You may need to run 'xcode-select --install' and/or
      'open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg'
      to set up the Xcode command-line tools, which Stack uses.

WARNING: '/Users/takato_horikoshi/.local/bin' is not on your PATH.
    For best results, please add it to the beginning of PATH in your profile.

$ set -x PATH /Users/takato_horikoshi/.local/bin $PATH
```

# GHCi を使ってみる

```sh
$ ghci

Plelude>:?
// わらわらとヘルプ情報が出てくる

Plelude>:!echo unko
unko

Plelude>Prelude> :!echo unko
unko

Prelude> :!pwd
/Users/takato_horikoshi

Prelude> :quit
```

開発に際しては、myfunctino.hs を定義したらば、
`:l` でロードする（myfunction.hs は ghci を起動したフォルダと同じ場所に置いてください）。

myfunction.hs を更新して、 `:l` でロードし直すか、 `:r` を実行してリロードする。
この繰り返しで開発を進める。

# Tips

GHCi のプロンプトをカスタマイズする。

```sh
$ touch ~/.ghci

$ echo :set prompt "ghci> " > ~/.ghci
```
