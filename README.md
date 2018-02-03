# V-Color-Calibration-Backup
Scripts/Utilities to aid in backuping up the color calibration of the EVE V. Currently just a simple powershell script to generate a zip archive with the icc profiles and CalMAN database.

## Getting Started

Due to being unsigned, the current script may require you to change Powershell's execution policy in order to run it. Information on Powershell's execution policies can be found [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-5.1&viewFallbackFrom=powershell-Microsoft.PowerShell.Core).

### Prerequisites
```
Powershell 5.0
CalMan Client Software
```

### Installing

To install, simply download or clone the repository and run the backup script. A restoration script is also now included to restore backup zips on the local machine.

```
.\BackupVColorProfile.ps1
```

or

```
.\RestoreVColorProfile.ps1
```

If you receive a warning regarding execution policy you may need to change policy to something less restrictive.

## Use

The script in its default state will copy the database and icc profile files and zip them up into an archive and location of your choosing. It is recommended to upload the zip to a cloud storage provider (like OneDrive which is included by default in Windows 10 and is found in the OneDrive folder of your user account once set up).

The restoration script will ask you to select your .zip backup and will replace the monitor database back where CalMAN expects it to be. ICC profiles are saved in the backup archive, but are not used in this sort of restoration.

## Authors

* **Matt Hehn** - *Initial Script* - [mjhehn](https://github.com/mjhehn)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
