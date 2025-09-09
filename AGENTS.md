# Repository Guidelines

このリポジトリは個人の dotfiles（エディタ/シェル/WM 等の設定と補助スクリプト）を管理します。小さく明確な変更と、再現可能な動作確認を心掛けてください。

## プロジェクト構成
- `config/`: XDG 系設定（`alacritty/`, `dunst/`, `hypr/`, `i3/`, `i3status/`, `mako/`, `rofi/`, `waybar/`, `wofi/`）。
- ルート直下: `.vimrc`, `.tmux.conf`, `.zshrc`, `.gitconfig`, `.gvimrc`, `.xinitrc`, `.Xresources`, `init.lua`, `minimal_vimrc` など。
- `scripts/`: 補助スクリプト（例: `hypr-dpms-off.sh`, `screenshot-full.sh`, `build-nvim.sh`）。
- その他: `vsnip/`（スニペット）、`.vim/`, `.tmux/`, `surfingkeys.js`。

## ビルド・テスト・開発コマンド
- `make help`: 利用可能ターゲットの一覧。
- `make init`: `$HOME` に必要なシンボリックリンクを作成（上書きに注意）。
- シェルスクリプト検証: `shellcheck scripts/*.sh` / 整形: `shfmt -i 2 -sr -d scripts`（修正は `-w`）。
- エディタ設定のスモークテスト（任意）: `nvim --headless -u minimal_vimrc +qall` / `vim -Nu minimal_vimrc +qall`。

## コーディング規約・命名
- EditorConfig 準拠: 改行 `LF`、インデント 2 スペース（`Makefile` はタブ）、末尾空白削除。
- シェル: `#!/usr/bin/env bash` 推奨、`set -euo pipefail` を検討。ファイル名はケバブケース（例: `do-something.sh`）。
- Python 等はスネークケース（例: `tool_name.py`）。
- 設定追加は原則 `config/<tool>/` に置き、必要なら `Makefile` の `init` にリンク処理を追記。

## テスト方針
- 変更したスクリプトに `shellcheck` を実施、整形差分が出ないことを確認（`shfmt -d`）。
- 主要な起動パスはヘッドレスで起動可否のみを確認（上記スモークテスト）。

## コミット/PR ルール
- コミット見出しは `[feat]`, `[fix]`, `[refactor]`, `[mod]` 等の接頭辞＋命令形で簡潔に（50〜72 文字目安）。
- 本文に動機/影響/手動確認手順を箇条書き。破壊的変更は `BREAKING:` を明記。
- PR には概要、関連 Issue、スクリーンショット/ログ（必要時）、動作確認環境、`make init` の影響範囲を記載。

## セキュリティ/設定の注意
- 認証情報や個人情報をコミットしない（`~/.ssh`, トークン等）。
- 既存のユーザ固有値（例: `.gitconfig`）に変更が及ぶ場合は理由とロールバック手順を明記。

## エージェント向け補足
- この AGENTS.md の適用範囲はリポジトリ全体です。より深い階層に AGENTS.md がある場合はそちらを優先します。
- 無関係なファイルには触れず、変更は最小限かつ局所的に。破壊的操作（削除/大規模移動）は事前相談。

