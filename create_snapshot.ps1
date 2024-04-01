# パラメータ
param($file)

# vcenter接続情報
$ENV = Get-Content -Path ./env

$VCENTER_URL = $ENV[0]
$VCENTER_USERNAME = $ENV[1]
$VCENTER_PASS = $ENV[2]

# スナップショット名につける日付
$date_ymd = Get-Date -Format "yyyyMMdd"

# vcenter 接続
Connect-VIServer -Server "$VCENTER_URL" -User "$VCENTER_USERNAME" -Password "$VCENTER_PASS"

# スナップショット作成
$vms = Get-Content -Path $file
for($i=0; $i -lt $vms.Count; $i++){
  $vm = $vms[$i]
  $snapshot_name = ($vm + "_" + $date_ymd)
  Get-VM -Name $vm | New-Snapshot -Name $snapshot_name -Confirm:$false
  Write-Host $snapshot_name "を作成しました"
}

# vcenter 接続解除
Disconnect-VIServer -Server "$VCENTER_URL" -Confirm:$false

