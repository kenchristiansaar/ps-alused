# Adusers.csv asukoht

$file = "C:\Users\Administrator\Desktop\adusers.csv"

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
    

    # E-maili loomine

    $upname = $username + "@sv-kool.local"

    echo $upname
    }