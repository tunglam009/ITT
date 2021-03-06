﻿using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModGopYController : CPController
    {
        public ModGopYController()
        {
            //khoi tao Service
            DataService = ModGopYService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModGopYModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModGopYService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModGopYModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModGopYService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModGopYEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.IP = HL.Core.Web.HttpRequest.IP;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModGopYModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModGopYModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModGopYModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModGopYEntity entity = null;

        private bool ValidSave(ModGopYModel model)
        {
            TryUpdateModel(entity);

            //chong hack
            entity.ID = model.RecordID;

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra quyen han
            if ((model.RecordID < 1 && !CPViewPage.UserPermissions.Add) || (model.RecordID > 0 && !CPViewPage.UserPermissions.Edit))
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                ModGopYService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModGopYModel model)
        {
            return ModGopYService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModGopYModel : DefaultModel
    {
        public string SearchText { get; set; }
    }
}

