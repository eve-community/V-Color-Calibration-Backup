# V-Color-Calibration-Backup
Scripts/Utilities to aid in backuping up the color calibration of the EVE V. Currently just a simple powershell script to generate a zip archive with the icc profiles and CalMAN database.

## Getting Started

Due to being unsigned, the current script may require you to change Powershell's execution policy in order to run it. Information on Powershell's execution policies can be found [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-5.1&viewFallbackFrom=powershell-Microsoft.PowerShell.Core).

### Prerequisites
```
Developed in Powershell 5.0 (script may run in other versions)
```

### Installing

To install, simply download or clone the repository and run the script. 

```
.\VColorProfileBackup.ps1
```

If you receive a warning regarding execution policy you may need to change policy to something less restrictive.

## Use

The script in its default state will copy the database and icc profile files and zip them up into an archive called "VColorCalibrationn.zip" placed in your Downloads folder. There is a line currently commented out in the script to directly path the zip into your OneDrive folder if you have configured OneDrive in Windows 10. Otherwise you can simply change the "desiredLocation" variable to set where the .zip file goes.

## Authors

* **Matt Hehn** - *Initial Script* - [mjhehn](https://github.com/mjhehn)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
