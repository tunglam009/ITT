﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Them-bc-ban-dau-su-co.aspx"));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModBaoCaoBanDauSuCoEntity entityBc = ViewBag.BaoCao as ModBaoCaoBanDauSuCoEntity ?? new ModBaoCaoBanDauSuCoEntity();
    string endCode = ViewBag.EndCode;
%>

<style>
    .textstyle1 {
        border: none !important;
        border-bottom: 1px dotted !important;
        padding: 0 !important;
    }

    .name {
        width: 30% !important;
    }

    .input {
        width: 70% !important;
    }

    .radio_loaitaikhoan td {
        padding-right: 10px;
    }

    .radio_loaitaikhoan input {
        margin: 0 4px 0 0 !important;
    }

    .QAcustom {
        color: white !important;
        float: left;
        background: #015ab4 none repeat scroll 0 0 !important;
    }

    .hidediv {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #000;
        -ms-opacity: 0.7;
        opacity: 0.7;
        display: none;
        z-index: 10000;
    }

    .wait {
        padding: 5px;
        background-color: #fff;
        width: 300px;
        border: 1px solid #333;
        position: fixed;
        display: none;
        top: 30%;
        left: 40%;
        z-index: 10001;
        text-align: center;
        line-height: 20px;
        background: #d4d4d4;
        -ms-border-radius: 6px;
        border-radius: 6px;
        -ms-opacity: 0.8;
        opacity: 0.8;
    }

    .Waiting {
        display: inline !important;
    }
</style>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">

                <form method="post" enctype="multipart/form-data">
                    <div class="g-search">
                        <div class="box_content_input">
                            <div class="WordSection1">

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                </p>

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; mso-border-right-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                            </p>
                                        </td>
                                        <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <a name="chuong_pl_4">
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mẫu số 03</span>
                                                    </b>
                                                </a><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                </p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <a name="chuong_pl_4_name">
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
                                        </b>
                                    </a><b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO SỰ CỐ</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân báo cáo sự cố (*)</span>
                                    <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityBc.ToChuc_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                                    <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityBc.ToChuc_DiaChi %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=entityBc.ToChuc_DienThoai %>" />
                                        Email (*) 
                                    <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=entityBc.ToChuc_Email %>" />
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>NGƯỜI LIÊN HỆ</span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Họ và tên (*)</span>
                                    <input name="NguoiLienHe_Ten" maxlength="255" id="NguoiLienHe_Ten" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_Ten %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Chức vụ:</span>
                                    <input name="NguoiLienHe_ChucVu" maxlength="255" id="NguoiLienHe_ChucVu" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_ChucVu %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span>
                                    <input name="NguoiLienHe_DienThoai" maxlength="255" id="NguoiLienHe_DienThoai" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Email (*)</span>
                                    <input name="NguoiLienHe_Email" maxlength="255" id="NguoiLienHe_Email" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_Email %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                                    </b>
                                </p>

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên đơn vị vận hành hệ thống thông tin (*): </span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <input name="ChiTiet_TenDonVi" maxlength="255" id="ChiTiet_TenDonVi" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenDonVi %>" placeholder="Điền tên đơn vị vận hành hoặc được thuê vận hành hệ thống thông tin " />
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Cơ quan chủ quản:</span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <input name="ChiTiet_CoQuan" maxlength="255" id="ChiTiet_CoQuan" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_CoQuan %>" placeholder="Điền tên cơ quan chủ quản" />
                                                    </span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 2'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên hệ thống bị sự cố</span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <input name="ChiTiet_CoQuan" maxlength="255" id="ChiTiet_CoQuan" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_CoQuan %>" placeholder="Điền tên hệ thống bị sự cố và tên miền, địa chỉ ip liên quan" />
                                                    </span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 3'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Phân loại cấp độ của hệ thống thông tin (nếu có)</span>
                                            </p>
                                        </td>
                                        <td width="75" valign="top" style='width: 56.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>C&#7845;p
                            &#273;&#7897; 1<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 56.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>C&#7845;p
                            &#273;&#7897; 2<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="75" valign="top" style='width: 56.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>C&#7845;p
                            &#273;&#7897; 3<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 57.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>C&#7845;p
                            &#273;&#7897; 4<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="75" valign="top" style='width: 56.1pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>C&#7845;p
                            &#273;&#7897; 5<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 4'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tổ chức cung cấp dịch vụ an toàn thông tin (nếu có):</span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <input name="ChiTiet_TenToChucCungCap" maxlength="255" id="ChiTiet_TenToChucCungCap" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenToChucCungCap %>" placeholder="Điền tên nhà cung cấp ở đây" />
                                                    </span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 5'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên nhà cung cấp dịch vụ kết nối bên ngoài (nếu có)</span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <input name="ChiTiet_TenNCC_BenNgoai" maxlength="255" id="ChiTiet_TenNCC_BenNgoai" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenNCC_BenNgoai %>" placeholder="Điền tên nhà cung cấp ở đây" />
                                                    </span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
                                        <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Điền tên nhà cung cấp ở đây</span>
                                            </p>
                                        </td>
                                        <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <input name="ChiTiet_TenNCC" maxlength="255" id="ChiTiet_TenNCC" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenNCC %>" placeholder="Điền thông tin ở đây" />
                                                    </span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                </p>

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mô tả sơ bộ về sự cố (*)</span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
                                        <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Đề nghị cung cấp một bản tóm tắt ngắn gọn về sự cố, bao gồm đánh giá sơ bộ cuộc t ấ n công đã xảy ra chưa và bất kỳ các nguy cơ d ẫ n đến khả năng phá hoại hoặc gián đoạn dịch vụ. Cũng vui lòng xác định mức độ nhạy cảm của thông tin liên quan hoặc những đối tượng bị ảnh hưởng bởi sự cố</span>
                                                </i>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <textarea name="ChiTiet_MoTa" maxlength="255" id="ChiTiet_MoTa" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.ChiTiet_MoTa %></textarea>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                </p>

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="188" valign="top" style='width: 140.8pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Ngày phát hiện sự cố (*) (dd/mm/yy)</span>
                                            </p>
                                        </td>
                                        <td width="45" style='width: 33.45pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <input name="ChiTiet_NgayGioPhatHien" maxlength="255" id="ChiTiet_NgayGioPhatHien" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_NgayGioPhatHien %>" />
                                            </p>
                                        </td>
                                        <td width="52" style='width: 38.7pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                            </p>
                                        </td>
                                        <td width="175" style='width: 131.2pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thời gian phát hiện (*):</span>
                                            </p>
                                        </td>
                                        <td width="147" style='width: 109.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                                    <input name="ChiTiet_NgayGioPhatHien" maxlength="255" id="ChiTiet_NgayGioPhatHien" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_NgayGioPhatHien %>" />
                                                </span>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>giờ
                                                    <input name="ChiTiet_NgayGioPhatHien" maxlength="255" id="ChiTiet_NgayGioPhatHien" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_NgayGioPhatHien %>" />
                                                    phút
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>HIỆN TRẠNG SỰ CỐ (*)</span>
                                    </b>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="302" valign="top" style='width: 226.75pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>&#272;ã
                            &#273;&#432;&#7907;c x&#7917; lý<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="302" valign="top" style='width: 3.15in; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9633;</span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ch&#432;a
                            &#273;&#432;&#7907;c x&#7917; lý<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <o:p>&nbsp;</o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>CÁCH THỨC PHÁT HIỆN *</span>
                                    </b><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Đánh dấu những cách thức được sử dụng để phát hiện sự cố)</span>
                                    </i><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Qua h&#7879;
                th&#7889;ng phát hi&#7879;n xâm nh&#7853;p
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-spacerun: yes'></span></span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                Ki&#7875;m tra d&#7919; li&#7879;u l&#432;u l&#7841;i (Log File)<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                Nh&#7853;n &#273;&#432;&#7907;c thông báo t&#7915;:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>................................................................................................. </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                Khác, &#273;ó là
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-tab-count: 1 dotted'>......................................................................................................................</span><o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>ĐÃ GỬI THÔNG BÁO SỰ CỐ CHO *</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Thành
                viên m&#7841;ng l&#432;&#7899;i ch&#7883;u trách nhi&#7879;m &#7913;ng c&#7913;u
                s&#7921; c&#7889; cho t&#7893; ch&#7913;c, cá nhân<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; ISP
                &#273;ang tr&#7921;c ti&#7871;p cung c&#7845;p d&#7883;ch v&#7909;<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                C&#417; quan &#273;i&#7873;u ph&#7889;i<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN BỔ SUNG VỀ HỆ THỐNG XẢY RA SỰ CỐ </span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Hệ điều hành</span>
                                    <input name="TTThem_HeDieuHanh" maxlength="255" id="TTThem_HeDieuHanh" class="textstyle1" type="text" value="<%=entityBc.TTThem_HeDieuHanh %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Version</span>
                                    <input name="TTThem_Version" maxlength="255" id="TTThem_Version" class="textstyle1" type="text" value="<%=entityBc.TTThem_Version %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Các dịch vụ có trên hệ thống
                <i style='mso-bidi-font-style: normal'>(Đánh dấu những dịch vụ được sử dụng trên hệ thống)</i>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Web
                server
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                        <span style='mso-spacerun: yes'></span>&#9633; Mail server
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                        <span style='mso-spacerun: yes'></span>&#9633;
                Database server<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                D&#7883;ch v&#7909; khác, &#273;ó là
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>.......................................................................................................... </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;
                Các biện pháp an toàn thông tin đã triển khai <i style='mso-bidi-font-style: normal'>(Đánh dấu những biện pháp đã triển khai)</i>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                Antivirus
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                Firewall
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                H&#7879; th&#7889;ng phát hi&#7879;n xâm nh&#7853;p<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Khác:<o:p></o:p></span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Các địa chỉ IP của hệ thống <i style='mso-bidi-font-style: normal'>(Liệt kê địa chỉ IP sử dụng trên Internet, không liệt kê địa chỉ IP nội bộ)</i></span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <textarea name="TTThem_DanhSachIP" maxlength="255" id="TTThem_DanhSachIP" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_DanhSachIP %></textarea>
                                        </span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Các tên miền của hệ thống </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <textarea name="TTThem_DanhSachTenMien" maxlength="255" id="TTThem_DanhSachTenMien" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_DanhSachTenMien %></textarea>
                                        </span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Mục đích chính sử dụng hệ thống</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <textarea name="TTThem_MucDichSuDung" maxlength="255" id="TTThem_MucDichSuDung" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_MucDichSuDung %></textarea>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Thông tin gửi kèm</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Nh&#7853;t
                ký h&#7879; th&#7889;ng
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633;
                M
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7851;</span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                u
                virus / mã &#273;&#7897;c
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-spacerun: yes'></span>
                                    </span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                        <span style='mso-spacerun: yes'></span>&#9633; Khác:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>…………………………………..<o:p></o:p></span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Các thông tin cung cấp trong thông báo sự cố này đều phải được giữ bí mật: &#9633; Có &#9633;
                Không
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>KIẾN NGHỊ, ĐỀ XUẤT HỖ TRỢ</span>
                                    </b>
                                </p>

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mô tả về đề xuất, kiến nghị</span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
                                        <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Đề nghị cung cấp tóm lược về các kiến nghị và đề xuất hỗ trợ ứng cứu (nếu có)</span>
                                                </i>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                                                <textarea name="Content" maxlength="255" id="Content" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.Content %></textarea>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THỜI GIAN THỰC HIỆN BÁO CÁO SỰ CỐ</span>
                                    </b><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>*:</span>
                                    <input name="ThoiGianThucHien" maxlength="255" id="ThoiGianThucHien" class="textstyle1" type="text" value="<%=entityBc.ThoiGianThucHien %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(ngày/tháng/năm/giờ/phút)</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                            </p>
                                        </td>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>CÁ NHÂN/NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Ký tên, đóng dấu)</span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Chú thích:</span>
                                    </i><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                        <i style='mso-bidi-font-style: normal'>1. Phần (*) là những thông tin bắt buộc. Các phần còn lại có thể loại bỏ nếu không có thông tin.</i>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Sử dụng tiêu đề (subject) bắt đầu bằng "[TBSC]" khi gửi thông báo qua email</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Tham khảo thêm tại website của VNCERT (www.vncert.gov vn)</span>
                                    </i>
                                </p>

                            </div>

                            <div class="button">
                                <input type="hidden" name="endCode" value="<%=endCode %>" />
                                <%if (!string.IsNullOrEmpty(endCode))
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateDangKyUCSC]" value="Cập nhật" type="submit" />
                                <%}
                                    else
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddDangKyUCSC]" value="Lưu" type="submit" />
                                <%}%>

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách đăng ký" />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
