if($args.Count -ne 3 ){
    echo ""
    echo "Sisestage järgmised parameetrid tühikutega: Kasutajanimi Ees_Perenimi Konto_kirjeldus"
}
else {
    $KasutajaNimi = $args[0]
    $TaisNimi = $args[1]
    $Kontokirjeldus = $args[2]
    $KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
    New-LocalUser "$KasutajaNimi" -Password $KasutajaParool -FullName "$TaisNimi" -Description "$Kontokirjeldus"
    }