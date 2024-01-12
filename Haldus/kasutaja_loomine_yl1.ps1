$EesNimi = Read-Host "Sisesta oma eesinimi"
$PereNimi = Read-Host "Sisesta oma perenimi"

$EesNimiMadal = $EesNimi.ToLower()
$PereNimiMadal = $PereNimi.ToLower()

$EesNimiKorge = ( Get-Culture ).TextInfo.ToTitleCase( $EesNimi.ToLower() )
$PereNimiKorge = ( Get-Culture ).TextInfo.ToTitleCase( $PereNimi.ToLower() )
$TaisNimi = "$EesNimiKorge" + " " + "$PereNimiKorge"

$KontoKirjeldus = "Lokaalne konto"

$KasutajaNimi = "$EesNimiMadal.$PereNimiMadal"

$Parool = "Parool1!" | ConvertTo-SecureString -AsPlainText -Force

try
{
    New-LocalUser -Name $KasutajaNimi -Password $Parool -FullName $TaisNimi -Description "$KontoKirjeldus" -ErrorAction Stop | Out-Null
    Write-Host "Loodav kasutaja on $KasutajaNimi"
}
catch
{
    Write-Host "Kasutaja loomisega tekkis probleem"
    Write-Host "Probleemi detailid: $_"
}