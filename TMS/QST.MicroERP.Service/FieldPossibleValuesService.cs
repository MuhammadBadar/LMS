using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
   public class FieldPossibleValuesService
    {
        #region Class Members/Class Variables

        private FieldPossibleValuesDAL _fpvDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public FieldPossibleValuesService()
        {
            _fpvDAL = new FieldPossibleValuesDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region FieldPossibleValues
        public bool ManagementFieldPossibleValues(FieldPossibleValuesDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.field_possible_values.ToString());
                    check = _fpvDAL.ManageFieldPossibleValues(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _fpvDAL.ManageFieldPossibleValues(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _fpvDAL.AlterFieldPossibleValues(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _fpvDAL.AlterFieldPossibleValues(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _fpvDAL.AlterFieldPossibleValues(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return true;

        }
        public List<FieldPossibleValuesDE> SearchFieldPossibleValuess(FieldPossibleValuesDE mod)
        {
            List<FieldPossibleValuesDE> FieldPossibleValues = new List<FieldPossibleValuesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.FieldId != default)
                    whereClause += $" AND FieldId={mod.FieldId}";
                if (mod.FieldValue != default)
                    whereClause += $" AND FieldValue like ''" + mod.FieldValue + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                FieldPossibleValues = _fpvDAL.SearchFieldPossibleValues(whereClause);

                #endregion

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return FieldPossibleValues;
        }

        #endregion
    }
}
