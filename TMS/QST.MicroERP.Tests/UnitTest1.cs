using NUnit.Framework;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Service;
using QST.MicroERP.Services;
using System;
using System.Collections.Generic;

namespace QST.MicroERP.Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

      //  [Test]
        public void _Service_Feature_Crud()
        {
            FeatureSearchCriteria featSC = new FeatureSearchCriteria();
            FeatureService featSvc = new FeatureService();
            #region Delete Previous Feature



            List<FeatureDE> search = featSvc.SearchFeatures(featSC);
            foreach (var sr in search)
            {
                sr.DBoperation = DBoperations.Delete;
                featSvc.ManagementFeature(sr);
            }
            //verify from db
            search = featSvc.SearchFeatures(featSC);
            Assert.Zero(search.Count);

            #endregion
            #region Add Feature

            FeatureDE feat = new FeatureDE
            {
                Name = "Invoice",
                Description = "Desc..",
                DBoperation = DBoperations.Insert,
                IsActive = true,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today
            };
            Assert.IsTrue(featSvc.ManagementFeature(feat));
            FeatureDE featr = new FeatureDE
            {
                Name = "Sale Order",
                Description = "Desc..",
                DBoperation = DBoperations.Insert,
                IsActive = true,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today
            };
            Assert.IsTrue(featSvc.ManagementFeature(featr));
            //verify from db
            search = featSvc.SearchFeatures(featSC);
            // Assert.AreEqual(1, search[0].Id);
            Assert.AreEqual(2, search.Count);

            #endregion
            #region Update Feature

            feat.Name = "Invoice";
            feat.DBoperation = DBoperations.Update;
            Assert.IsTrue(featSvc.ManagementFeature(feat));
            //verify from db
            search = featSvc.SearchFeatures(featSC);
            Assert.AreEqual("Invoice", search[0].Name);

            #endregion
            #region Deactivate Feature

            feat.DBoperation = DBoperations.DeActivate;
            Assert.IsTrue(featSvc.ManagementFeature(feat));
            //verify from db
            search = featSvc.SearchFeatures(featSC);
            Assert.AreEqual(false, search[0].IsActive);

            #endregion
            #region Activate Feature

            feat.DBoperation = DBoperations.Activate;
            Assert.IsTrue(featSvc.ManagementFeature(feat));
            //verify from db
            search = featSvc.SearchFeatures(featSC);
            Assert.AreEqual(true, search[0].IsActive);

            #endregion
            #region Search Feature

            List<FeatureDE> Search = new List<FeatureDE>();

            FeatureSearchCriteria featSC_test = new FeatureSearchCriteria { Id = 1 };
            Search = featSvc.SearchFeatures(featSC_test);
            Assert.AreEqual("Invoice", Search[0].Name);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual(true, Search[0].IsActive);

            featSC_test = new FeatureSearchCriteria { Name = "Invoice" };
            Search = featSvc.SearchFeatures(featSC_test);
            Assert.AreEqual("Invoice", Search[0].Name);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual(true, Search[0].IsActive);



            featSC_test = new FeatureSearchCriteria { IsActive = true };
            Search = featSvc.SearchFeatures(featSC_test);
            Assert.AreEqual("Invoice", Search[0].Name);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual(true, Search[0].IsActive);

            #endregion

        }
      //  [Test]
        public void _Service_Permissions_Crud()
        {
            PermissionsSearchCriteria permsSC = new PermissionsSearchCriteria();
            PermissionsService permsSvc = new PermissionsService();
            #region Delete ResourcePermissions

            var search = permsSvc.SearchPermissions(permsSC);
            foreach (var sr in search)
            {
                sr.DBoperation = DBoperations.Delete;
                permsSvc.ManagementPermissions(sr);
            }

            //verify from db
            search = permsSvc.SearchPermissions(permsSC);
            Assert.Zero(search.Count);

            #endregion
            #region Add 

            PermissionDE perms = new PermissionDE
            {
                UserId = "080e264b-a35d-47fa-bc02-77e94e461bb8",
                RoleId = "eec2d7a0-1e7f-4932-8de6-d34080d038e5",
                PermissionValue = ((int)Permissions.Deny),
                FeatureId = 1,
                DBoperation = DBoperations.Insert,
                IsActive = false,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today

            };

            Assert.IsTrue(permsSvc.ManagementPermissions(perms));
            PermissionDE perm = new PermissionDE
            {
                UserId = "1f7dcdd7-f3af-4685-bb9c-3860b5e4c305",
                RoleId = "a67febed-dc5d-4253-999e-f3db0f0687f2",
                PermissionValue = ((int)Permissions.ReadOnly),
                FeatureId = 2,
                DBoperation = DBoperations.Insert,
                IsActive = true,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today,

            };
            Assert.IsTrue(permsSvc.ManagementPermissions(perm));
            //verify from db
            search = permsSvc.SearchPermissions(permsSC);
            Assert.AreEqual(1, search[0].Id);

            #endregion
            #region Update 

            search[0].DBoperation = DBoperations.Update;
            search[0].IsActive = true;
            Assert.IsTrue(permsSvc.ManagementPermissions(search[0]));
            //verify from db
            search = permsSvc.SearchPermissions(permsSC);
            Assert.AreEqual(true, search[0].IsActive);

            #endregion
            #region Deactivate 

            perms.DBoperation = DBoperations.DeActivate;
            Assert.IsTrue(permsSvc.ManagementPermissions(perms));
            //verify from db
            search = permsSvc.SearchPermissions(permsSC);
            Assert.AreEqual(false, search[0].IsActive);

            #endregion
            #region Activate 

            perms.DBoperation = DBoperations.Activate;
            Assert.IsTrue(permsSvc.ManagementPermissions(perms));
            //verify from db
            search = permsSvc.SearchPermissions(permsSC);
            Assert.AreEqual(true, search[0].IsActive);

            #endregion
            #region Search

            List<PermissionDE> Search = new List<PermissionDE>();
            PermissionsSearchCriteria perms_SC = new PermissionsSearchCriteria { Id = 1 };
            Search = permsSvc.SearchPermissions(perms_SC);
            Assert.AreEqual(1, Search[0].FeatureId);


            perms_SC = new PermissionsSearchCriteria { FeatureId = 1 };
            Search = permsSvc.SearchPermissions(perms_SC);
            Assert.AreEqual(1, Search[0].Id);




            #endregion

        }
        [Test]
        public void _Service_ManageCompany_Crud()
        {
            ManageCompanyDE mngCom = new ManageCompanyDE();
            ManageCompanyService comSvc = new ManageCompanyService();
            #region Delete Company

            var search = comSvc.SearchCompany(mngCom);
            foreach (var sr in search)
            {
                sr.DBoperation = DBoperations.Delete;
                comSvc.ManagementCompany(sr);
            }

            //verify from db
            search = comSvc.SearchCompany(mngCom);
            Assert.Zero(search.Count);

            #endregion
            #region Add 

            ManageCompanyDE com = new ManageCompanyDE
            {
                Name="ASD",
                CityId = ((int)Cities.Lahore),
                ProvinceId = ((int)Provinces.Punjab),
                CountryId = ((int)Countries.Pakistan),
                WhatsApp = "12345678987",
                Cell = "12345678987",
                Telephone = "12345678987",
                AddressLine1 = "ABCD",
                AddressLine2 = "WXYZ",
                ContactPerson = "abc",
                DBoperation = DBoperations.Insert,
                IsActive = false,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today

            };

            Assert.IsTrue(comSvc.ManagementCompany(com));
            ManageCompanyDE cmpny = new ManageCompanyDE
            {
                Name = "BSD",
                CityId = ((int)Cities.Lahore),
                ProvinceId = ((int)Provinces.Punjab),
                CountryId = ((int)Countries.Pakistan),
                WhatsApp = "12345678987",
                Cell = "12345678987",
                Telephone = "12345678987",
                AddressLine1 = "ABCD",
                AddressLine2 = "WXYZ",
                ContactPerson = "abc",
                DBoperation = DBoperations.Insert,
                IsActive = true,
                CreatedById = 1,
                CreatedOn = DateTime.Today,
                ModifiedById = 1,
                ModifiedOn = DateTime.Today,

            };
            Assert.IsTrue(comSvc.ManagementCompany(cmpny));
            //verify from db
            search = comSvc.SearchCompany(mngCom);
            Assert.AreEqual(1, search[0].Id);

            #endregion
            #region Update 

            search[0].DBoperation = DBoperations.Update;
            search[0].IsActive = true;
            Assert.IsTrue(comSvc.ManagementCompany(search[0]));
            //verify from db
            search = comSvc.SearchCompany(mngCom);
            Assert.AreEqual(true, search[0].IsActive);

            #endregion
            #region Deactivate 

            com.DBoperation = DBoperations.DeActivate;
            Assert.IsTrue(comSvc.ManagementCompany(com));
            //verify from db
            search = comSvc.SearchCompany(mngCom);
            Assert.AreEqual(false, search[0].IsActive);

            #endregion
            #region Activate 

            com.DBoperation = DBoperations.Activate;
            Assert.IsTrue(comSvc.ManagementCompany(com));
            //verify from db
            search = comSvc.SearchCompany(mngCom);
            Assert.AreEqual(true, search[0].IsActive);

            #endregion
            #region Search

            List<ManageCompanyDE> Search = new List<ManageCompanyDE>();
            ManageCompanyDE mngCompny = new ManageCompanyDE { Id = 1 };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);


            mngCompny = new ManageCompanyDE { ContactPerson = "abc" };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);

            mngCompny = new ManageCompanyDE { Cell = "12345678987" };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);

            mngCompny = new ManageCompanyDE { AddressLine2 = "WXYZ" };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);

            mngCompny = new ManageCompanyDE { Name = "ASD" };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);

            mngCompny = new ManageCompanyDE { CountryId = 1003001 };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);

            mngCompny = new ManageCompanyDE { CityId = 1001001 };
            Search = comSvc.SearchCompany(mngCompny);
            Assert.AreEqual(1, Search[0].Id);
            Assert.AreEqual("abc", Search[0].ContactPerson);
            Assert.AreEqual("12345678987", Search[0].Cell);
            Assert.AreEqual("12345678987", Search[0].WhatsApp);
            Assert.AreEqual("12345678987", Search[0].Telephone);
            Assert.AreEqual("WXYZ", Search[0].AddressLine2);
            Assert.AreEqual("ASD", Search[0].Name);
            Assert.AreEqual("ABCD", Search[0].AddressLine1);
            Assert.AreEqual(1001001, Search[0].CityId);
            Assert.AreEqual(1003001, Search[0].CountryId);
            Assert.AreEqual(1002001, Search[0].ProvinceId);




            #endregion

        }
      
        
    }
}