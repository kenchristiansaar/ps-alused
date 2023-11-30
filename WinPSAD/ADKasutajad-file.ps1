# Adusers.csv asukoht

$file = "C:\Users\Administrator\Desktop\adusers.csv"

# Importin faili

$users = Import-Csv $file -Encoding Default -Delimiter ";"

# Foreachiga uued read iga kasutaja parameetri jaoks

foreach ($user in $users){
    echo $user
    }