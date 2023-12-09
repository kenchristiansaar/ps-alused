# Faili asukoht

$Fail = "C:\Users\User\ps-alused\Haldus\kasutajad.csv"

# Faili sisu lugemine

$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"

foreach ($kasutaja in $Kasutajad){
    $KasutajaNimi = $kasutaja.KasutajaNimi
    $Taisnimi = $kasutaja.TaisNimi
    $KontoKirjeldus = $kasutaja.KontoKirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    New-LocalUser -Name $KasutajaNimi -Password $Parool -FullName $TaisNimi -Description "$KontoKirjeldus"
    }