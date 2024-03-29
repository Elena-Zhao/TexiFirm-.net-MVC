﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TaxiFirm.Models.License;

namespace TaxiFirm.Models.Driver
{
    public class Driver
    {
        //driver表中的属性
        public int Employee_id { get; set; }
        public int Health { get; set; }
        public string License_id { get; set; }
        //employee继承属性
        public string password { get; set; }
        public int firm_id { get; set; }
        public string name { get; set; }
        public string id_card { get; set; }
        public DateTime birthday { get; set; }
        public bool gender { get; set; }
        public string telephone { get; set; }
        public string emoloyee_address { get; set; }
        public TaxiFirm.Models.Firm.Firm firm { get; set; }
        public string plateNumber { get; set; }
        public TaxiFirm.Models.License.License license { get; set; }
        public Driver() {
        }

        public int getAge()
        {
            int age = 0;
            DateTime today = new DateTime();
            today = DateTime.Now;
            if ((birthday.Month < today.Month) || ((birthday.Month == today.Month) && (birthday.Day < today.Day)))
            {
                age = today.Year - birthday.Year;
                if (age > 0)
                {
                    return age;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                age = (today.Year - birthday.Year) - 1;
                if (age > 0)
                {
                    return age;
                }
                else
                {
                    return 0;
                }
            }
        }
        public string getGenderToString()
        {
            if (gender)
            {
                return "男";
            }
            else
            {
                return "女";
            }
        }
        public string getConditionToString()
        {
            if (Health<=60)
            {
                return "危险";
            }
            else if (Health<=80)
            {
                return "良好";
            }
            else
            {
                return "健康";
            }
        }
    }
}