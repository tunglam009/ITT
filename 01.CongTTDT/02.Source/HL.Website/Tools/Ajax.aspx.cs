﻿using HL.Lib.Global;
using HL.Lib.Models;
using HL.Lib.MVC;
using System;

namespace HL.Website.Tools
{
    public partial class Ajax : System.Web.UI.Page
    {
        public string sHTML = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "text/xml";
            string cmd = HL.Core.Web.HttpQueryString.GetValue("cmd").ToString();

            if (cmd == "GuiGopY")
            {
                var dtid = HL.Core.Web.HttpQueryString.GetValue("duthaoid");
                int duthaoid = HL.Core.Global.Convert.ToInt(dtid, 0);
                string name = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("name")).Trim();
                string email = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("email")).Trim();
                //string phone = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("phone")).Trim();
                string title = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("title")).Trim();
                //string content = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("content")).Trim();
                string content = HL.Core.Web.HttpQueryString.GetValue("content").ToString();
                string sFile = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("sFile")).Trim();
                return;

                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(content))
                {
                    string filePath = "";
                    try
                    {
                        ModGopYEntity entity = new ModGopYEntity()
                        {
                            DuThaoID = duthaoid,
                            Name = name,
                            Email = email,
                            //Phone = phone,
                            //Mobile = phone,
                            Title = title,
                            Content = content,
                            IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"],
                            Published = DateTime.Now
                        };
                        string[] fileTmp;
                        if (!string.IsNullOrEmpty(sFile))
                        {
                            fileTmp = sFile.Split('.');
                            int c = fileTmp.Length;
                            for (int i = 0; i < c; i++)
                            {
                                filePath = AppDomain.CurrentDomain.BaseDirectory + "/Data/upload/files/GopY/" + email.Replace("@", "_");
                                HL.Lib.Global.File.Base64ToFile(fileTmp[i], filePath, title + "_" + duthaoid);
                                entity.Files = filePath + title + "_" + duthaoid;
                            }
                        }
                        ModGopYService.Instance.Save(entity);
                        sHTML = "Bạn đã gửi góp ý thành công!<br />Góp ý của bạn sẽ phải được xem xét, kiểm duyệt trong thời gian sớm nhất.";
                    }
                    catch (Exception ex)
                    {
                        sHTML = "";
                        HL.Lib.Global.File.Delete(filePath + title + "_" + duthaoid);
                    }
                }
            }
            else if (cmd == "SearchVB")
            {
                string SoKyHieu = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("SoKyHieu")).Trim();
                DateTime TuNgayNgayXuatBan = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("TuNgayNgayXuatBan"));
                DateTime DenNgayNgayXuatBan = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("DenNgayNgayXuatBan"));
                DateTime TuNgayNgayCoHieuLuc = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("TuNgayNgayCoHieuLuc"));
                DateTime DenNgayNgayCoHieuLuc = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("DenNgayNgayCoHieuLuc"));
                int CoQuan = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("CoQuan"));
                int HinhThuc = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("HinhThuc"));
                int LinhVuc = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("LinhVuc"));
                string TrichYeu = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("TrichYeu")).Trim();
                int Lang = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("Lang"));

                try
                {
                    var dbQuery = ModVanBanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true);

                    if (!string.IsNullOrEmpty(SoKyHieu))
                    {
                        dbQuery.Where(o => o.Name.Contains(SoKyHieu));
                    }

                    if (TuNgayNgayXuatBan != DateTime.MinValue && TuNgayNgayXuatBan != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayBanHanh >= TuNgayNgayXuatBan);
                    }

                    if (DenNgayNgayXuatBan != DateTime.MinValue && DenNgayNgayXuatBan != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayBanHanh <= DenNgayNgayXuatBan);
                    }

                    if (TuNgayNgayCoHieuLuc != DateTime.MinValue && TuNgayNgayCoHieuLuc != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayCoHieuLuc >= TuNgayNgayCoHieuLuc);
                    }

                    if (DenNgayNgayCoHieuLuc != DateTime.MinValue && DenNgayNgayCoHieuLuc != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayCoHieuLuc <= DenNgayNgayCoHieuLuc);
                    }

                    if (LinhVuc > 0)
                    {
                        dbQuery.Where(o => o.MenuIDs.Contains(LinhVuc.ToString()));
                    }

                    if (CoQuan > 0)
                    {
                        dbQuery.Where(o => o.MenuID1 == CoQuan);
                    }

                    if (HinhThuc > 0)
                    {
                        dbQuery.Where(o => o.MenuID2 == HinhThuc);
                    }

                    if (!string.IsNullOrEmpty(TrichYeu))
                    {
                        dbQuery.Where(o => o.Summary.Contains(TrichYeu));
                    }

                    dbQuery.OrderByDesc(o => o.Order);
                    dbQuery.Take(10).Skip(10 * 0);
                    var listItem = dbQuery.ToList();

                    int c = listItem != null ? listItem.Count : 0;
                    int i = 0;
                    for (i = 0; i < c; i++)
                    {
                        string url = new ViewPage().GetURL(listItem[i].MenuID1, listItem[i].Code);
                        if (Lang == 1)
                        {
                            url = "vn/" + url;
                        } else if (Lang == 2)
                        {
                            url = "en/" + url;
                        }
                        string cls = "";
                        if (i % 2 != 0)
                        {
                            cls = "even";
                        }
                        sHTML += "<tr class=\"" + cls + "\">";
                        sHTML += "<td>" + listItem[i].Name + "</td>";
                        sHTML += "<td>" + HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu1()) + "</td>";
                        sHTML += "<td>" + HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu2()) + "</td>";
                        sHTML += "<td>" + Utils.ShowTextByType3("VBLinhVuc", 1, listItem[i].MenuIDs, "MenuIDs") + "</td>";
                        sHTML += "<td><a href='/" + url + ".aspx'>" + listItem[i].Summary + "</a></td>";
                        sHTML += "<td>" + string.Format("{0:dd/MM/yyyy}", listItem[i].NgayBanHanh) + "</td>";
                        sHTML += "</tr>";
                    }
                }
                catch (Exception ex)
                {

                }
            }

        }
    }
}