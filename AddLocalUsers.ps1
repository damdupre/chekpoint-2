Write-Host "--- Début du script ---"
#ajout de la fonction log
function Log
{
    param([string]$FilePath,[string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}
Function Random-Password ($length = 6)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Script"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"
#modification du nombre de ligne ignorée zt des champ selectionner
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","fonction","description" -Encoding UTF8  | Select-Object -Skip 1

#création du roupe utilisateur
new-LocalGroup "Utilisateur"

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    #modification de la variable
    If (-not (Get-LocalUser -Name $Name ))
    {
   
    #ajout de la ligne description etmodification de l'expiration du mot de passe
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = $Nom
            FullName             = $Prenom
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
            Description          = $Description
       }
       else
       {
       write-host -ForegroundColor red "l'utilisateur $Name existe déja"

        } 

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateur" -Member $Name
       #modification de la ligne pour affichage du mot de passe en vert
        write-host -ForegroundColor green "L'utilisateur $Name a été crée avec le mot de passe $pass"
    }
}

pause
Write-Host "--- Fin du script ---"
read-host "Appuyer sur ENTRE pour continuer ......."

