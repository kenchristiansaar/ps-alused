$EesNimi = Read-Host "Sisesta oma eesinimi"
$PereNimi = Read-Host "Sisesta oma perenimi"

$EesNimiMadal = $EesNimi.ToLower()
$PereNimiMadal = $PereNimi.ToLower()

$KasutajaNimi = "$EesNimiMadal.$PereNimiMadal"

try
{
    Remove-LocalUser -Name $KasutajaNimi -ErrorAction Stop | Out-Null
    Write-Host "Kustutatav kasutaja on $KasutajaNimi"
}
catch
{
    Write-Host "Kasutaja kustutamisega tekkis probleem."
    Write-Host "Probleemi detailid: $_"
}