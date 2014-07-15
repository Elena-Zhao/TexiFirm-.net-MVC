using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaxiFirm.Models.Backup
{
    public class BackupHandle
    {
        public DataClasses1DataContext data = new DataClasses1DataContext();


        public int AddNewBackup(string description)
        {
            return data.backupDatabase(description);
        
        }

        //分页得到备份页面
        public List<Backup> GetbackupByPage(MyPage page)
        {

            page.CountPerPage = 10;
            page.WholePage = (int)data.getBackupInformationPageCount(page.CountPerPage);
            var table = data.getBackupInformationByPage(page.CurrentPage, page.CountPerPage);
            List<Backup> backups = new List<Backup>();
            foreach (var col in table)
            {

                Backup backup = new Backup();
                backup.BackupId = col.backup_set_id;
                backup.BackupSize =(decimal) col.backup_size;
                backup.BackupTime = (DateTime)col.backup_finish_date;
                backup.Description =( col.description==null?"无":col.description);
                backup.Name = col.name;
                backup.Version = (int)col.database_version;
                backup.CreationTime =(DateTime) col.database_creation_date;
             

                backups.Add(backup);

            }

            return backups;
        }

        //通过描述分页得到客户页面
        public List<Backup> GetBackupByDescriptionByPage(MyPage page, string BackupDescription)
        {
            BackupDescription = "%" + BackupDescription + "%";
            page.CountPerPage = 10;
            page.WholePage = (int)data.getBackupByDescriptionPageCount(page.CountPerPage, BackupDescription);
            var table = data.getBackupByDescriptionByPage(page.CurrentPage, page.CountPerPage, BackupDescription);
            List<Backup> backups = new List<Backup>();

            foreach (var col in table)
            {

                Backup backup = new Backup();
                backup.BackupId = col.backup_set_id;
                backup.BackupSize = (decimal)col.backup_size;
                backup.BackupTime = (DateTime)col.backup_finish_date;
                backup.Description = col.description;
                backup.Name = col.name;
                backup.Version = (int)col.database_version;
                backup.CreationTime = (DateTime)col.database_creation_date;
                backups.Add(backup);

            }

            return backups;
        }
    }
}