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

