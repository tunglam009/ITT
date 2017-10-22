﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModVanBanEntity;
    var listOther = ViewBag.Other as List<ModVanBanEntity>;
%>

<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
<script>
    function loadNews(pageIdNews) {
        $('.main_vbtable').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

        $.ajax({
            type: 'post',
            //url: '/Tools/Ajax.aspx?cmd=SearchVB&pageSize=10&totalPage=5&totalItem=1153',
            url: '/Tools/Ajax.aspx/SearchVB',
            dataType: 'html',
            data: {
                "SoKyHieu": $('#txtSoHieu').val(),
                "TuNgayNgayXuatBan": $('#txtTuNgayBanHanh').val(),
                "DenNgayNgayXuatBan": $('#txtDenNgayBanHanh').val(),
                "TuNgayNgayCoHieuLuc": $('#txtTuNgayHieuLuc').val(),
                "DenNgayNgayCoHieuLuc": $('#txtDenNgayHieuLuc').val(),
                "CoQuan": $('#ddlCoQuan').val(),
                "HinhThuc": $('#ddlHinhThuc').val(),
                "LopVanBan": "100",
                "LinhVuc": $('#ddlLinhVuc').val(),
                "TrichYeu": $('#txtTrichYeu').val(),
                "Lang": "1"
            },
            success: (function (html) {
                var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                $('.main_vbtable').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                $('#pagevanbant').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
            })
        });
    }

    function fnSearchVB() {
        var num = Math.floor(Math.random() * 999999);
        var data = {
            "SoKyHieu": $('#txtSoHieu').val(),
            "TuNgayNgayXuatBan": $('#txtTuNgayBanHanh').val(),
            "DenNgayNgayXuatBan": $('#txtDenNgayBanHanh').val(),
            "TuNgayNgayCoHieuLuc": $('#txtTuNgayHieuLuc').val(),
            "DenNgayNgayCoHieuLuc": $('#txtDenNgayHieuLuc').val(),
            "CoQuan": $('#ddlCoQuan').val(),
            "HinhThuc": $('#ddlHinhThuc').val(),
            "LinhVuc": $('#ddlLinhVuc').val(),
            "TrichYeu": $('#txtTrichYeu').val(),
            "Lang": '<%=ViewPage.CurrentLang.ID%>'
        };
        sLink = '/Tools/Ajax.aspx?cmd=SearchVB&SoKyHieu=' + data.SoKyHieu + '&TuNgayNgayXuatBan=' + data.TuNgayNgayXuatBan + '&DenNgayNgayXuatBan=' + data.DenNgayNgayXuatBan + '&TuNgayNgayCoHieuLuc=' + data.TuNgayNgayCoHieuLuc + '&DenNgayNgayCoHieuLuc=' + data.DenNgayNgayCoHieuLuc + '&CoQuan=' + data.CoQuan + '&HinhThuc=' + data.HinhThuc + '&LinhVuc=' + data.LinhVuc + '&TrichYeu=' + data.TrichYeu + '&Lang=' + data.Lang + '&rnd=' + num;

        AjaxRequest.get({
            'url': sLink,
            'onSuccess': function (req) {
                with (req.responseXML.getElementsByTagName("I").item(0)) {
                    var sHtml = getNodeValue(getElementsByTagName("Content"));
                    $('#tbody').html(sHtml);
                    console.log(sHtml);
                }
            },
            'onError': function (req) { }
        });
    }
</script>

<script>
    $(document).ready(function () {
        $("title").html('Văn bản');
        $(".g-b-search").click(function () {
            $(".g-search").toggle('slow', function () {
                if ($("#div_form_search").css("display") == "block") {
                    $("#div_btn_filter").text("Đóng");
                    $("#div_btn_search").show();

                } else if ($("#div_form_search").css("display") == "none") {
                    $("#div_btn_filter").text("Lọc");
                    $("#div_btn_search").hide();
                }
                $("#txtSoHieu").focus();
            });
        });
        $(".btn_clear").click(function () {
            $('#txtSoHieu').val("");
            $('#txtTuNgayBanHanh').val("");
            $('#txtDenNgayBanHanh').val("");
            $('#txtTuNgayHieuLuc').val("");
            $('#txtDenNgayHieuLuc').val("");
            $('#ddlCoQuan').val("");
            $('#ddlHinhThuc').val("");
            $('#ddlLinhVuc').val("");
            $('#txtTrichYeu').val("");
            $('#txtSoHieu').focus();
        });
    });
</script>

<link href="/Content2/style/datetimepicker/jquery-ui-timepicker-addon.css" type="text/css" media="all" rel="stylesheet" />
<link href="/Content2/style/datetimepicker/jquery-ui.css" type="text/css" media="all" rel="stylesheet" />
<script src="/Content2/style/datetimepicker/jquery-1.11.0.min.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui.min.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui-timepicker-addon.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui-sliderAccess.js"></script>
<script src="/Content2/style/datetimepicker/api_buttons.js"></script>
<script src="/Content2/style/datetimepicker/custom.js"></script>
<script src="/Content2/style/js/relation.js"></script>

<link rel="stylesheet" href="/Content2/style/validation/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="/Content2/style/validation/template.css" type="text/css" />
<script src="/Content2/style/js/jquery-1.12.4.min.js"></script>
<script src="/Content2/style/validation/jquery.validationEngine-vi.js" charset="utf-8"></script>
<script src="/Content2/style/validation/jquery.validationEngine.js" charset="utf-8"></script>

<script>
    function setFormSubmitToFalse() {
        setTimeout(function () { _spFormOnSubmitCalled = false; }, 300);
        return true;
    }
    jQuery(document).ready(function () {
        // binds form submission and fields to the validation engine
        jQuery('form').validationEngine({ promptPosition: "topLeft" });
    });

    function SearchButtonClick() {
        setFormSubmitToFalse();
        document.getElementById('btnSearch').click();
    }
    function CancelButtonClick() {
        setFormSubmitToFalse();
        document.getElementById('btnSearch').click();
    }
</script>
<span style="display: none">
    <input type="submit" name="btnSearch" value="Search" onclick="javascript: fnSearchVB()" id="btnSearch" class="btn btn-primary" />
</span>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">
                    <span id="lbTieuDe"><%= ViewPage.CurrentPage.Name %>: <%=item.Name %></span>
                </span>

            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <%--            <div class="top">
                <div id="div_btn_filter" class="btn_filter g-b-search">Lọc</div>
                <div id="div_btn_search" style="display: none" class="btn_filter" onclick="SearchButtonClick()">Tìm kiếm</div>

                <div id="div_form_search" class="content_filter active_ g-search">
                    <ul>
                        <li>
                            <div class="name">Số hiệu</div>
                            <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtSoHieu" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtSoHieu" class="txt_name" type="text"></li>
                        <li>
                            <div class="name">Trích yếu nội dung</div>
                            <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtTrichYeu" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtTrichYeu" class="txt_name" type="text"></li>
                        <li>Ngày ban hành
                        </li>
                        <li class="">
                            <div class="to">
                                <div class="name">Từ</div>
                                <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtTuNgayBanHanh" maxlength="10" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtTuNgayBanHanh" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" type="text">
                            </div>
                            <div class="from">
                                <div class="name">Đến</div>
                                <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtDenNgayBanHanh" maxlength="10" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtDenNgayBanHanh" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" type="text">
                            </div>
                        </li>
                        <li>Ngày hiệu lực
                        </li>
                        <li>
                            <div class="to">
                                <div class="name">Từ</div>
                                <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtTuNgayHieuLuc" maxlength="10" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtTuNgayHieuLuc" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" type="text">
                            </div>
                            <div class="from">
                                <div class="name">Đến</div>
                                <input name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$txtDenNgayHieuLuc" maxlength="10" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_txtDenNgayHieuLuc" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" type="text">
                            </div>
                        </li>
                        <li class="linhvuc">
                            <div class="name">Lĩnh vực</div>
                            <select name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$ddlLinhVuc" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_ddlLinhVuc">
                                <option value="">-Tất cả-</option>
                                <option value="34">Báo chí</option>
                                <option value="35">Xuất bản</option>
                                <option value="36">Bưu chính</option>
                                <option value="37">Viễn thông</option>
                                <option value="38">CNTT, điện tử</option>
                                <option value="55">An toàn thông tin</option>
                                <option value="39">Cơ cấu tổ chức</option>
                                <option value="40">Lĩnh vực khác</option>

                            </select>
                        </li>
                        <li class="hinhthuc">
                            <div class="name">Hình thức văn bản</div>
                            <select name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$ddlHinhThuc" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_ddlHinhThuc">
                                <option value="">-Tất cả-</option>
                                <option value="21">Luật</option>
                                <option value="22">Pháp lệnh</option>
                                <option value="23">Nghị định</option>
                                <option value="24">Chỉ thị</option>
                                <option value="25">Thông tư</option>
                                <option value="26">Quyết định</option>
                                <option value="27">Công văn điều hành</option>
                                <option value="29">Công điện</option>
                                <option value="30">Báo cáo</option>
                                <option value="44">Văn bản hợp nhất</option>
                                <option value="31">Thông báo</option>
                                <option value="32">Nghị quyết</option>

                            </select>
                        </li>
                        <li class="cq">
                            <div class="name">Cơ quan ban hành</div>
                            <select name="ctl00$ctl45$g_66c001ae_aaf4_4df0_9124_0473199d19f3$ctl00$ddlCoQuan" id="ctl00_ctl45_g_66c001ae_aaf4_4df0_9124_0473199d19f3_ctl00_ddlCoQuan">
                                <option value="">-Tất cả-</option>
                                <option value="28">Quốc hội</option>
                                <option value="29">Chủ tịch nước</option>
                                <option value="30">Chính phủ</option>
                                <option value="31">Thủ tướng Chính phủ</option>
                                <option value="32">Bộ Thông tin và Truyền thông</option>
                                <option value="33">Bộ Bưu chính, Viễn thông</option>
                                <option value="34">Bộ Văn hóa - Thông tin</option>
                                <option value="35">Tổng cục Bưu điện</option>
                                <option value="36">Liên bộ, Ngành</option>
                                <option value="37">Khác</option>

                            </select>

                        </li>
                        <li class="button">
                            <div class="btn_filter" onclick="SearchButtonClick()">Tìm kiếm</div>
                            <div class="btn_filter huy">Hủy bỏ</div>
                        </li>
                    </ul>
                </div>

            </div>--%>

            <div class="main_vbtable" style="width: 100%">
                <table style="color: #100404; width: 100%">
                    <tbody>
                        <tr>
                            <td style="width: 150px;"><b>Số hiệu</b></td>
                            <td><%= item.Name %></td>
                        </tr>
                        <tr>
                            <td><b>Trích yếu nội dung</b></td>
                            <td><%= item.Summary %></td>
                        </tr>

                        <tr>
                            <td><b>Ngày ban hành</b></td>
                            <td><%=string.Format("{0:dd/MM/yyyy}", item.NgayBanHanh) %></td>
                        </tr>
                        <tr>
                            <td><b>Ngày có hiệu lực</b></td>
                            <td><%=string.Format("{0:dd/MM/yyyy}", item.NgayCoHieuLuc) %></td>
                        </tr>
                        <tr>
                            <td><b>Ngày hết hiệu lực</b></td>
                            <%if (item.NgayHetHieuLuc != DateTime.MinValue && item.NgayHetHieuLuc != DateTime.MaxValue)
                                {%>
                            <td><%=string.Format("{0:dd/MM/yyyy}", item.NgayHetHieuLuc) %></td>
                            <%}
                                else
                                {%>
                            <td>(Văn bản còn hiệu lực)</td>
                            <%} %>
                        </tr>

                        <tr>
                            <td><b>Hình thức văn bản</b></td>
                            <td><%= HL.Lib.MVC.ViewControl.GetName(item.getMenu1()) %></td>
                        </tr>
                        <tr>
                            <td><b>Lĩnh vực</b></td>
                            <td><%=Utils.ShowTextByType3("VBLinhVuc", ViewPage.CurrentLang.ID, item.MenuIDs, "MenuIDs") %></td>
                        </tr>
                        <tr>
                            <td><b>Cơ quan ban hành</b></td>
                            <td><%= HL.Lib.MVC.ViewControl.GetName(item.getMenu2()) %></td>
                        </tr>
                        <tr>
                            <td><b>Người ký duyệt</b></td>
                            <%--<td>Phạm Hồng Hải - Thứ trưởng Bộ Thông tin và Truyền thông</td>--%>
                            <td><%=item.getNguoiKyDuyet() %></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td><b>Văn bản liên quan</b></td>
                            <td>
                                <%if (!string.IsNullOrEmpty(item.Urls))
                                    {
                                        var s = item.Urls.Split('\n');
                                        for (int i = 0; i < s.Length; i++)
                                        {%>
                                <p><a href="<%=s[i] %>"><%=s[i] %></a></p>
                                <%}
                                %>
                                <%} %>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Download</b></td>
                            <td>
                                <%if (!string.IsNullOrEmpty(item.File))
                                    {
                                        var s = item.File.Split('/');
                                %>
                                <p><a href="<%=item.File.Replace("~/", "/") %>"><%=s[s.Length - 1] %></a> </p>
                                <%} %>
                                <%if (!string.IsNullOrEmpty(item.File1))
                                    {
                                        var s = item.File1.Split('/');
                                %>
                                <p><a href="<%=item.File1.Replace("~/", "/") %>"><%=s[s.Length - 1] %></a> </p>
                                <%} %>
                                <%if (!string.IsNullOrEmpty(item.File2))
                                    {
                                        var s = item.File2.Split('/');
                                %>
                                <p><a href="<%=item.File2.Replace("~/", "/") %>"><%=s[s.Length - 1] %></a> </p>
                                <%} %>
                                <%if (!string.IsNullOrEmpty(item.File3))
                                    {
                                        var s = item.File3.Split('/');
                                %>
                                <p><a href="<%=item.File3.Replace("~/", "/") %>"><%=s[s.Length - 1] %></a> </p>
                                <%} %>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Chi tiết văn bản</b></td>
                            <td><%=item.Content %></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>