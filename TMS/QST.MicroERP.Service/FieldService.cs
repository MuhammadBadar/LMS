using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
   public class FieldService
    {
        #region Class Members/Class Variables

        private FieldDAL _fieldDAL;
        private CoreDAL _corDAL;
        private FieldPossibleValuesService _fvpSvc;

        #endregion
        #region Constructors
        public FieldService()
        {
            _fieldDAL = new FieldDAL();
            _corDAL = new CoreDAL();
            _fvpSvc = new FieldPossibleValuesService();
        }

        #endregion
        #region Field
        public bool ManagementField(FieldDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.field.ToString());
                    check = _fieldDAL.ManageField(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _fieldDAL.ManageField(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _fieldDAL.AlterField(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _fieldDAL.AlterField(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _fieldDAL.AlterField(mod, mod.Id);
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
        public List<FieldVM> GetFieldPossibleValues()
        {
            FieldVM fieldSC = new FieldVM { IsActive = true };
            List<FieldVM> Field = SearchFields(fieldSC);
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();

                #region Get FPVs 
                foreach (var line in Field)
                {
                    FieldPossibleValuesDE fvp = new FieldPossibleValuesDE { FieldId = line.Id };    
                    line.FPV = _fvpSvc.SearchFieldPossibleValuess(fvp);
                }
                #endregion
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }

            return Field;
        }
        public List<FieldVM> SearchFields(FieldVM mod)
        {
            List<FieldVM> Field = new List<FieldVM>();
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
                if (mod.TypeId != default)
                    whereClause += $" AND TypeId={mod.TypeId}";
                if (mod.Type != default)
                    whereClause += $" AND Type like ''" + mod.Type + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Field = _fieldDAL.SearchFields(whereClause);

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
            return Field;
        }

        #endregion
    }
}
