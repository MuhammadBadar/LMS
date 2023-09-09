﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;

namespace QST.MicroERP.Services
{
    public class CoreService
    {
        #region Class Variables
        private CoreDAL _corDAL;
        #endregion
        #region Constructors
        public CoreService()
        {
            _corDAL = new CoreDAL();
        }
        #endregion
        #region Enums
        public List<EnumValueDE> GetEnumValues(EnumType type)
        {

            return _corDAL.GetEnumValues(type);
        }
        public bool ManageEnumValue(EnumValueDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                _corDAL.ManageEnumValue(mod);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion

    }
}
