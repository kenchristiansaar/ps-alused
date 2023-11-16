$number1 = Read-Host "Enter the first value"
$number2 = Read-Host "Enter the second value"

# Miskip2rast v6rdlus ei t33ta, kui all olevad muutujad pole jutum2rkides.

if("$number1" -gt "$number2")
    {
    Write-Host "The higher number is: "$number1
    }
else
    {
    Write-Host "The higher number is: "$number2
    }