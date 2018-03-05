# V-Color-Calibration-Backup
A client or scripts to aid in backuping up the color calibration of the EVE V. Currently the scripts and client generate a zip archive with the icc profiles and CalMAN database, or can restore a zip backup made by the backup script onto the V.

## Getting Started
### Prerequisites
```
CalMan Client 3 Software installed
.Net framework 4.5-4.6

OR

Powershell 4.0+ (to run the scripts)
```

### Building the exe

To build, simply download or clone the repository and build from the Visual Studio solution (2017 was used for development).

## Use (application)
Simple run vColorBackup.exe, and select whether you'd like to backup or restore your configuration.

## Use (scripts)

To Back up, go the scripts folder and either right click on the batch file and click 'Run as Administrator', or open a command prompt/powershell in the downloaded directory and run:
```
.\backup.bat
```

or, to restore the calibration files right click and run as admin, or run:

```
.\restore.bat
```

Either batch script invokes the relevant powershell script that does the bulk of the work (or you can invoke these powershell scripts directly, but be aware that these scripts are unsigned and not allowed to run under default powershell execution policy).

The script in its default state will copy the database and icc profile files and zip them up into an archive and location of your choosing. It is recommended to upload the zip to a cloud storage provider (like OneDrive which is included by default in Windows 10 and is found in the OneDrive folder of your user account once set up).

The restoration script will ask you to select your .zip backup and will replace the monitor database back where CalMAN expects it to be. ICC profiles are saved in the backup archive, but are not used in this sort of restoration.

## Authors

* **Matt Hehn** - *Initial Script and client* - [mjhehn](https://github.com/mjhehn) on GitHub, [Ranth](https://eve.community/u/Ranth) on eve.community

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
