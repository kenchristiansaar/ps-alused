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


$EesNimi = Read-Host "Please enter user firstname"
$PereNimi = Read-Host "Please enter user lastname"

$EesNimiKorge = ( Get-Culture ).TextInfo.ToTitleCase( $EesNimi.ToLower() )
$PereNimiKorge = ( Get-Culture ).TextInfo.ToTitleCase( $PereNimi.ToLower() )
$TaisNimi = "$EesNimiKorge" + " " + "$PereNimiKorge"

$EesNimiMadal = $EesNimi.ToLower()
$PereNimiMadal = $PereNimi.ToLower()

$KasutajaNimi = "$EesNimiMadal.$PereNimiMadal"

$Kasutajanimi = Translit $KasutajaNimi

if (Get-ADUser -Filter {SamAccountName -eq $KasutajaNimi})
    {

        try
        {
            Remove-ADUser -Identity $KasutajaNimi -Confirm:$false -ErrorAction Stop

            Write-Host "User $TaisNimi was remove succesfully"
        }

        catch
        {
            Write-Host "Error! A problem occurred while attempting to remove the user"
            Write-Host "Error details: $_"
        }
    
    }

else
    {
    Write-Host "The user does not exist"
    }