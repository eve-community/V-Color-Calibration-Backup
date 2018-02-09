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
##L8/UAdDXTlKDjpXc9xxi53fYD0skYsqJ9JWmyIi+7ev4sirXBLgVSl9ihhXOAVipVuAXY9YauN4DZQ8lKfsH5/zVA+LJ
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "ZIP (*.zip)| *.zip"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}

$calmanPath = "C:\ProgramData\SpectraCal\CalMAN Client 3\"                       #path to calman files

$wshell = New-Object -ComObject Wscript.Shell
if(test-path $calmanPath -PathType Container) 
{
    #bunch of variables because why not.
    $archiveLocation = Get-FileName("backup.zip")
    $extractedLocation = ([io.fileinfo]$archiveLocation).basename
    $copyLocation = [io.path]::Combine($extractedLocation,"calmanDatabase\MonitorsDB.2.3.sdf")

    Expand-Archive $archiveLocation -DestinationPath .\ -Force                          #extract the backup folder
    Copy-Item $copyLocation -Destination $calmanPath\Data\ -Force -Recurse #copy database folder to the calman folder
    Remove-Item $extractedLocation -Force -Recurse                                            #remove extracted folder
    $wshell.Popup("CalMAN database restored.",0,"Done")
}
else
{
    $wshell.Popup("CalMAN folder missing, client probably not installed. Failed to restore database.",0,"Done")
}

