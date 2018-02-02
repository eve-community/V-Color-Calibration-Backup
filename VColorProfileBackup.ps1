#bunch of variables because why not.
$calmanPath = 'C:\ProgramData\SpectraCal\CalMAN Client 3\'                       #path to calman files
$userPath = $env:USERPROFILE
$desiredLocation = "Downloads"                                                   #where to save the zipped folder to. Uncomment line below to save it to onedrive if it's set up on your PC.
#$desiredLocation = "OneDrive"
$calFolderName = "VColorCalibration"                                             #Name of the zip/

$savePath = [io.path]::Combine($userPath, $desiredLocation, $calFolderName)
$iccSavePath = [io.path]::Combine($savePath,"iccProfiles")
$databaseSavePath = [io.path]::Combine($savePath,"calmanDatabase")

Copy-Item $calmanPath\Data -Destination $databaseSavePath -Force -Recurse
Copy-Item $calmanPath\ICC -Destination $iccSavePath -Force -Recurse

Compress-Archive -Path $savePath -Force -CompressionLevel Optimal -DestinationPath $savePath

Remove-Item $savePath -Force -Recurse                                           #clean up the folder left over after the zip