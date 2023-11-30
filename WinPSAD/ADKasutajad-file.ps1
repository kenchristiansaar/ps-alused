# Adusers.csv asukoht

$file = "C:\Users\Administrator\Desktop\adusers.csv"

# Importin faili

$users = Import-Csv $file -Encoding Default -Delimiter ";"

# Foreachiga uued read iga kasutaja parameetri jaoks

foreach ($user in $users){

    # kasutaja nimi on eesnimi.perenimi

    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    echo $username
    }