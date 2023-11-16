Write-Host "Select country: " -ForegroundColor Yellow
Write-Host "1 : India" -ForegroundColor Cyan
Write-Host "2 : Australia" -ForegroundColor Cyan
Write-Host "3 : China" -ForegroundColor Cyan

$country = Read-Host "Please select a country"

if("$country" -eq 1)
    {
    Write-Host "India's capital is New Delhi!" -ForegroundColor Green
    }
elseif("$country" -eq "2")
    {
    Write-Host "Australia's capital is Canberra!" -ForegroundColor Green
    }
elseif("$country" -eq "3")
    {
    Write-Host "China's capital is Beijing!" -ForegroundColor Green
    }
else
    {
    Write-Host "Please select a country from the list provided." -ForegroundColor Red
    }