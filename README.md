# V-Color-Calibration-Backup
Scripts to aid in backuping up the color calibration of the EVE V. Currently the scripts to generate a zip archive with the icc profiles and CalMAN database, or can restore a zip backup made by the backup script onto the V.

## Getting Started
### Prerequisites
```
Powershell 5.0
CalMan Client Software
```

### Installing

To install, simply download or clone the repository and run the backup script. A restoration script is also now included to restore backup zips on the local machine.

## Use

To Back up, either right click on the batch file and click 'Run as Administrator', or open a command prompt/powershell in the downloaded directory and run:
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

* **Matt Hehn** - *Initial Script* - [mjhehn](https://github.com/mjhehn) on GitHub, [Ranth](https://eve.community/u/Ranth) on eve.community

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
