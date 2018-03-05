using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.IO.Compression;

namespace vColorBackup
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }

    }

    

    static class VConfigMethods
    {
        static public void backup()
        {
            String calmanPath = @"C:\ProgramData\SpectraCal\CalMAN Client 3\";
            if(!Directory.Exists(calmanPath))
            {
                MessageBox.Show("CalMAN folder missing, client probably not installed. Failed to retreive database.", "Backup Error");
                return;
            }

            String desiredPath = "";
            using (SaveFileDialog dialog = new SaveFileDialog())
            {
                dialog.Filter = "ZIP (*.zip)| *.zip";
                dialog.RestoreDirectory = true;
                dialog.FileName = "VConfigBackup.zip";
                if (dialog.ShowDialog() == DialogResult.OK)
                {
                    desiredPath = dialog.FileName;
                }
            }
            Console.WriteLine(desiredPath);
            String savePath = Path.GetFileName(desiredPath);
            String iccPath = Path.Combine(savePath, "iccProfiles");
            String dbPath = Path.Combine(savePath, "cailmanDatabase");


            //https://stackoverflow.com/questions/58744/copy-the-entire-contents-of-a-directory-in-c-sharp
            //Now Create all of the directories
            if(!Directory.Exists(savePath))
                Directory.CreateDirectory(savePath);
            foreach (string dirPath in Directory.GetDirectories(calmanPath, "*", SearchOption.AllDirectories))
                if (!Directory.Exists(savePath))
                    Directory.CreateDirectory(dirPath.Replace(calmanPath, savePath));

            //Copy all the files & Replaces any files with the same name
            foreach (string newPath in Directory.GetFiles(calmanPath, "*.*",
                SearchOption.AllDirectories))
                File.Copy(newPath, newPath.Replace(calmanPath, savePath), true);
            ZipFile.CreateFromDirectory(savePath, desiredPath);
            Directory.Delete(savePath, true);
        }

        static public void restore()
        {
            String calmanPath = @"C:\ProgramData\SpectraCal\CalMAN Client 3\";
            if (!Directory.Exists(calmanPath))
            {
                MessageBox.Show("CalMAN folder missing, client probably not installed.", "Restore Error");
                return;
            }

            String archivePath = "";
            using (OpenFileDialog dialog = new OpenFileDialog())
            {
                dialog.Filter = "ZIP (*.zip)| *.zip";
                dialog.RestoreDirectory = true;
                dialog.FileName = "VConfigBackup.zip";
                if (dialog.ShowDialog() == DialogResult.OK)
                {
                    archivePath = dialog.FileName;
                }
            }
            Console.WriteLine(archivePath);
            String folderPath = Path.GetFileName(archivePath);
            ZipFile.ExtractToDirectory(archivePath, folderPath);
            foreach (string newPath in Directory.GetFiles(folderPath, "*.*", SearchOption.AllDirectories))
                File.Copy(newPath, newPath.Replace(folderPath, calmanPath), true);
            Directory.Delete(folderPath, true);
        }
    }
}


