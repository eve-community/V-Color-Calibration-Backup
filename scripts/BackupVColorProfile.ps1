##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ49I=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlKDjpXc9xxi53fYD0skYsqJ9JWmyIi+7ev4sirXBLgVSl9ihhXoAVipF/cKUJU=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
#retreive the desired path the user wants to save to.
Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $SaveFileDialog.initialDirectory = $initialDirectory
    $SaveFileDialog.filter = "ZIP (*.zip)| *.zip"
    $SaveFileDialog.ShowDialog() | Out-Null
    $SaveFileDialog.filename
}

$calmanPath = 'C:\ProgramData\SpectraCal\CalMAN Client 3\'                       #path to calman files

$wshell = New-Object -ComObject Wscript.Shell
if(test-path $calmanPath -PathType Container) 
{
    #bunch of variables because why not.
    $desiredPath = Get-FileName("Downloads")                                         #where to save the zipped folder to.
    $savePath = ([io.fileinfo]$desiredPath).basename
    $iccSavePath = [io.path]::Combine($savePath,"iccProfiles")
    $databaseSavePath = [io.path]::Combine($savePath,"calmanDatabase")

    Copy-Item -path $calmanPath\Data -Destination $databaseSavePath -Force -Recurse
    Copy-Item -path $calmanPath\ICC -Destination $iccSavePath -Force -Recurse
    Compress-Archive -Path $savePath -Force -CompressionLevel Optimal -DestinationPath $desiredPath

    Remove-Item $savePath -Force -Recurse
    $wshell.Popup("CalMAN data backed up.",0,"Done")
}
else
{
    $wshell.Popup("CalMAN folder missing, client probably not installed. Failed to retreive database.",0,"Done")
}