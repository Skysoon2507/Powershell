
# Récupération du chemin racine et début recherche
$chemin = Read-Host "Entrer le dossier a analyser " 

$a = Get-ChildItem "$chemin" -Directory -Recurse | Where-Object -FilterScript {($_.GetFiles().Count -eq 0) -and $_.GetDirectories().Count -eq 0} | Select-Object -ExpandProperty FullName  

# Affichage du résultat

Write-Host "Il existe" $a.Count "dossiers vides" `n


$question = Read-Host "Ecrire les chemins des dossiers vides dans un fichier oui / non" 

if ($question -eq "oui") {
    $repertoire = Read-Host "Entrer le repertoire pour creer le fichier "
    $repertoire += "\chemins_dossiers_vides.txt"
    New-Item -Path "$repertoire" -ItemType File
    $b = Out-String -InputObject $a 
    Add-Content -Path "$repertoire" "$b"    
}


$question2 = Read-Host "Voulez vous supprimer ces dossiers vides oui / non "

if ($question2="oui") {
    Get-ChildItem "$chemin" -Directory -Recurse | Where-Object -FilterScript {($_.GetFiles().Count -eq 0) -and $_.GetDirectories().Count -eq 0} | Remove-Item
}

#
#$compteur=0
#function boucle() {
    
 #   foreach ($dossier in $temp) {
  #      $temp = Get-ChildItem "$chemin" -Directory
   #     if (($dossier.GetFiles().Count -eq 0) -and $dossier.GetDirectories().Count -eq 0) {
    #        $compteur+=1
      #      Write-Output $compteur
       # }   
        #else {
         #   boucle $temp
        #}
 #   }  
 #   Write-Output $compteur
#}

#boucle $chemin



