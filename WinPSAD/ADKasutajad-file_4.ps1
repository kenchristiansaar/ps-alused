# Adusers.csv asukoht

$file = "C:\ps-alused\WinPSAD\adusers2.csv"

# Importin faili

$users = Import-Csv $file -Encoding Default -Delimiter ";"

# Foreachiga uued read iga kasutaja parameetri jaoks

# Funktsioon muudab t2pit2hed tava ladina t2hestikuks

function Translit {

    param(
        [string] $inputString
        )

        # M22rab karakterid, mida t6lkida

        $Translit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }

        $outputString=""

        foreach ($character in $inputCharacter = $inputString.ToCharArray())
        {
            if ($Translit[$character] -cne $Null)
                {
                    $outputString += $Translit[$character]
                }

            else
                {
                    $outputString += $character
                }
        }
        Write-Output $outputString
    }
                        

foreach ($user in $users){

    # kasutaja nimi on eesnimi.perenimi

    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    
    # Kontrollib kas kasutaja on loodud

    if (Get-ADUser -Filter {SamAccountName -eq $username})

        {
        Write-Host "User $username already exists - can not add this user"
        }

        else {

            try {

    # E-maili loomine

    $upname = $username + "@sv-kool.local"

    # Ekraaninime loomine

    $displayname = $user.FirstName + " " + $user.LastName

    # Parooli genereerimine

    Add-Type -AssemblyName System.Web

    $password = [System.Web.Security.Membership]::GeneratePassword(12,2)

    # AD kasutajate loomine

    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $password -AsPlainText -force) -Enabled $true

        # CSV tabeli loomine

        [PSCustomObject]@{
        Username = $username
        Password = $password
        } | Export-Csv C:\ps-alused\WinPSAD\$username.csv -NoTypeInformation -Delimiter ";" -Append

    Write-Host "New user $username added successfully"
                }

            catch {
                Write-Host "An error has occurred while creating the user"
                Write-Host "Error details: $_"
                  }

              }

}