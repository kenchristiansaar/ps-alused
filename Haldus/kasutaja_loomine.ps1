$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "kasutaja1" -Password $KasutajaParool -FullName "Esimene kasutaja" -Description "Local Account - kasutaja1"