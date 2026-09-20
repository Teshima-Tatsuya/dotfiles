---
name: git-workflow
description: Git/GitHub conventions for this user - ghq directory layout under ~/src, ghq for clone, gh for auth/PR/issues, and what to do when push or auth fails. Use for any clone, branch, commit, push or PR task.
---

git / GitHub 運用ルール。clone・ブランチ・コミット・push・PR のいずれかを行うときは必ず従うこと。

## 1. フォルダ構造 (ghq)

- ルートは `~/src`（`git config --global ghq.root` で設定済み）。
- リポジトリの配置先は `~/src/github.com/<owner>/<repo>`。
- 一覧は `ghq list -p`、パス取得は `ghq list -e -p <repo>`。
- リポジトリを `~` 直下や任意の場所に置かない。

## 2. ツールの使い分け

| 用途 | 使うもの |
|---|---|
| clone・取得 | `ghq get <owner>/<repo>`（`gh repo clone` や素の `git clone` は使わない） |
| 認証・PR・issue・checks | `gh`（`gh pr create` / `gh pr view` / `gh pr checks` など） |
| commit・branch・push | `git` |

- `gh` 用のエイリアス（`gh get` など）は作らない。使い分けで運用する。

## 3. リモート・認証

- リモートは SSH 形式: `git@github.com:<owner>/<repo>.git`。
- HTTPS のリモートを見つけたら SSH に直す（`git remote set-url origin git@github.com:<owner>/<repo>.git`）。
- `gh` の認証は対話ログインが必要（ユーザーが `! gh auth login` を実行する）。未ログインなら PR 系コマンドの前にユーザーへ依頼する。

## 4. ブランチと PR

- ブランチ名は内容が分かる kebab-case（例: `enable-remote-control-at-startup`）。
- PR は `gh pr create` で作る。
- 既存リポジトリの作業ツリーが dirty のときは、何が未コミットかを先に確認し、自分が変更していない差分を含める場合はその旨を伝える。

## 5. コミット

- コミッター名・メールは `~/.gitconfig`（dotfiles からのシンボリックリンク）で設定済み。未設定でも推測して設定しない。ユーザーに聞く。
- 秘密情報（`.env`、鍵、トークン）は絶対にステージしない。dotfiles は公開リポジトリ。
- 末尾の `Co-Authored-By` などの帰属行は、セッションが指示する正しいモデル名のものを使う。特定のモデル名を固定で書かない。
- コミット手順の詳細は `commit` スキルを参照。

## 6. 失敗したとき

- push・認証・hook が失敗またはブロックされたら、迂回しない。トークンを URL に埋め込む、1Password など別の場所から認証情報を探す、といった方法は使わない。何をしようとして何が起きたかを報告し、ユーザーに判断を仰ぐ。

## 7. dotfiles 固有の注意

- 場所: `~/src/github.com/Teshima-Tatsuya/dotfiles`（デフォルトブランチは `master`）。
- 次のファイルはここへのシンボリックリンク。編集すると追跡対象のリポジトリが変わる。
  - `~/.gitconfig`
  - `~/.claude/settings.json`
  - `~/.claude/CLAUDE.md`
- Edit ツールはシンボリックリンクへの書き込みを拒否する。リンク先（上記 dotfiles 内のパス）を直接編集する。
- リポジトリを移動・改名するときは、必ず上記リンクを張り直す。
