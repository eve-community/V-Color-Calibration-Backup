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