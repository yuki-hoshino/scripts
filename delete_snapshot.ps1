# パラメータ
# date_ymd = 削除したいスナップショット名に含まれる日付（VM名_yyyymmdd）
param($file,$date_ymd)

# vcenter接続情報
$ENV = Get-Content -Path ./env

$VCENTER_URL = $ENV[0]
$VCENTER_USERNAME = $ENV[1]
$VCENTER_PASS = $ENV[2]

# vcenter 接続
Connect-VIServer -Server "$VCENTER_URL" -User "$VCENTER_USERNAME" -Password "$VCENTER_PASS"

$vms = Get-Content -Path $file
for($i=0; $i -lt $vms.Count; $i++){
  $vm = $vms[$i]
  $snapshot_name = ($vm + "_" + $date_ymd)
  if (Get-VM -Name $vm | Get-Snapshot) {
    Get-VM -Name $vm | Get-Snapshot -Name $snapshot_name | Remove-Snapshot -Confirm:$false
    Write-Host $snapshot_name "を削除しました"
  }
}

# vcenter 接続解除
Disconnect-VIServer -Server "$VCENTER_URL" -Confirm:$false

