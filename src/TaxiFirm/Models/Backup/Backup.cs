using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaxiFirm.Models.Backup
{
    public class Backup
    {
        public int BackupId { set; get; }
        public string Name { set; get; }
        public string Description { get; set; }
        public DateTime BackupTime { get; set; }
        public int Version { get; set; }
        public decimal  BackupSize { get; set; }
        public DateTime CreationTime { get; set; }

        public Backup() { }
    }
}