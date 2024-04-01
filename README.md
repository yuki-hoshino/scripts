# scripts

### スナップショット作成、削除スクリプト（ns-opsから実行）
* create_snapshot.ps1（$file)
  * vmlist.txtにあるVMのスナップショットを作成する
* delete_snapshot.ps1($file,$date_ymd)
  * vmlist.txtにあるVMのスナップショット「VM名_パラメータの日付」を削除する
* env
  * 1行目：vcenter　URL
  * 2行目：vcenterに接続するアカウント
  * 3行目：vcenterに接続するアカウントのパスワード
* vmlist.txt
  * スナップショットを作成または削除したいVM名の一覧
