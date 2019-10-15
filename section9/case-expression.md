case 式を使うと、変数の指定した値に対するコードブロックを評価できる。
つまり、コード中のどこでもパターンマッチが使える構文ということである。

### 関数のパターンマッチ

Haskell では関数のパターンマッチを以下の様に実装する。
例として、リストの先頭要素を取得する関数 `head` を実装してみる。

```haskell
head' :: [a] -> a
head' [] = error "no head"
head' (x:_) = x
```

### case式によるパターンマッチ

関数のパターンマッチは実際には case 式によるパターンマッチのシンタックスシュガーである。
同様に `head` の実装は以下のようになる。

```haskell
head' : [a] -> a
head' xs = case xs of [] -> error "no head"
                      (x:_) -> x
```

### case式はプログラム中のどこでも使える

関数のパターンマッチは関数お定義の際のみだが、case式は式途中やプログラム中でも使える。

##### 関数の途中で

```haskell
describeList :: [a] -> String
describeList list = "The list is "
                  ++ case list of []   -> "empty"
                                  [x]  -> "a single"
                                  [xs] -> "multiple"
```

##### プログラム中で

```haskell:case-expression.hs
import System.Environment
import System.IO

main = do
   args <- getArgs
   let result = case args of [] -> "args is empty"
                             xs -> foldl (\acc x -> acc ++ x) "args is " xs
   putStrLn result
```

```sh
$ ghc --make /path/to/case-expression.hs                

$ /path/to/case-expression aaa bbb ccc
args is aaa bbb ccc

$ /path/to/case-expression
args is empty
```