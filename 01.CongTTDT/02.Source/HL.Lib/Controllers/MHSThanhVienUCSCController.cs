﻿using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.Controllers
{
    public class MHSThanhVienUCSCController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|HSThanhVienUCSC")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.HSThanhVienUCSCState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MHSThanhVienUCSCModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserID;

            var dbQuery = ModHSThanhVienUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            string layout = "";
            string ec = endCode.ToLower();
            if (ec == "them-ho-so-ung-cuu-su-co") layout = "HoSoUCSC";
            else if (ec == "sua-ho-so-ung-cuu-su-co") layout = "HoSoUCSC";
            else if (ec == "ho-so-ung-cuu-su-co") layout = "Index";
            else if (ec == "dang-xuat")
            {
                string currUrl = ViewPage.Request.RawUrl;
                CPLogin.Logout();
                ViewPage.Response.Redirect(currUrl);
            }
            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
                var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModHSThanhVienUCSCService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.HoSo = entity;
                    ViewBag.DauMoi = ModDauMoiUCSCService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                                            .ToSingle();
                    ViewBag.EndCode = endCode;
                    RenderView("../MInfo/HoSoUCSC");
                }
                else
                {
                    ViewPage.Error404();
                }
            }
        }

        public void ActionXoaHoSo(string hoSoId)
        {
            int hsId = HL.Core.Global.Convert.ToInt(hoSoId, 0);
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(hsId > 0, o => o.ID == hsId)
                        .ToSingle();

            if (entity != null)
            {
                var dm = ModDauMoiUCSCService.Instance.CreateQuery()
                            .Where(o => o.HSThanhVienUCSCID == entity.ID)
                            .ToSingle();
                ModHSThanhVienUCSCService.Instance.Delete(entity.ID);
                ModDauMoiUCSCService.Instance.Delete(dm);

                ViewPage.Alert("Xóa hồ sơ thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên hồ sơ này.");
            }
        }

        public void ActionUpdateHoSoUCSC(ModHSThanhVienUCSCEntity entityHs, ModDauMoiUCSCEntity entityDm, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                entityHs.ID = entity.ID;
                entityHs.UserID = entity.UserID;
                entityHs.UserID1 = entity.UserID1;
                entityHs.MenuID = entity.MenuID;
                entityHs.State = entity.State;
                entityHs.Name = entity.Name;
                entityHs.Code = entity.Code;
                entityHs.HeThongThongTinIDs = entity.HeThongThongTinIDs;
                entityHs.Order = entity.Order;
                entityHs.Published = entity.Published;
                entityHs.Published1 = date;
                entityHs.Activity = false;
                ModHSThanhVienUCSCService.Instance.Save(entityHs);

                var dm = ModDauMoiUCSCService.Instance.CreateQuery().Where(o => o.HSThanhVienUCSCID == entity.ID).ToSingle();
                entityDm.ID = dm.ID;
                entityDm.HSThanhVienUCSCID = dm.HSThanhVienUCSCID;
                entityDm.MenuID = dm.MenuID;
                entityDm.State = dm.State;
                entityDm.Name = dm.Name;
                entityDm.Code = dm.Code;
                entityDm.Order = dm.Order;
                entityDm.Published = entity.Published;
                entityDm.Activity = dm.Activity;
                ModDauMoiUCSCService.Instance.Save(entityDm);

                ViewBag.HoSo = entityHs;
                ViewBag.DauMoi = entityDm;

                ViewPage.Alert("Cập nhật hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
            }

            //DateTime date = DateTime.Now;
            //string code = "HSUCSC" + ModHSThanhVienUCSCService.Instance.GetMaxID();
            //entity.Name = code;
            //entity.Code = Data.GetCode(code);
            //entity.UserID = Lib.Global.CPLogin.UserID;
            //entity.Published = date;
            //entity.Activity = false;
            //int id = ModHSThanhVienUCSCService.Instance.Save(entity);

            //WebMenuEntity menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "Chinh").ToSingle();
            //entityDm.HSThanhVienUCSCID = id;
            //entityDm.MenuID = menu.ID;
            //entityDm.Published = date;
            //entityDm.Activity = true;
            //ModDauMoiUCSCService.Instance.Save(entityDm);

            //ViewPage.Alert("Tạo mới hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
            //ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
        }
    }

    public class MHSThanhVienUCSCModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
    }
}
