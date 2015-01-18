(function ($) {
    $.createSmartBlog = function (p) {
        var SmartBlog = {
            config: {
                isPostBack: false,
                async: true,
                cache: false,
                type: 'POST',
                contentType: "application/json; charset=u0tf-8",
                data: { data: '' },
                dataType: 'json',
                baseURL: SageFrameAppPath + "/Modules/SmartBlog/SmartBlogService/SmartBlogService.asmx/",
                method: "",
                url: "",
                ajaxCallMode: 0,
                Mode: false,
                CultureCode: 'en-US',
                ID: "",
                lstTag: "",
                lstCategory: "",
                lstComment: "",
                lstPost: "",
                PostID: "",
                CommentCount: "",
                ApproveCommentCount: "",
                CommentID: "",
                CategoryID: "",
                TagID: "",
                Flag: false,
                Path: SageFrameAppPath + '/Modules/SmartBlog/',
                SummaryIconPath: SageFrameAppPath + '/Modules/SmartBlog/SummaryIcon/',
                iconPath: SageFrameAppPath,
                SummaryIcon: "",
                Img: "",
                ImagePath: SageFrameAppPath + '/Modules/SmartBlog/images/'
            },
            init: function () {


                var Author = SageFrameUserName;
                if (Author != 'superuser') {

                    $('#btmWPImport').hide();
                }
                else {

                    $('#btmWPImport').show();
                }

                $('#divNewPost').hide();
                $('#btnPost').hide();
                $('#btnNewPost').show();

                //$('#btnApprove').hide();
                $('#btnCancel').hide();
                $('#divComment').hide();
                $('#divEditcomment').hide();
                $('#divWPImport').hide();
                SmartBlog.GetPost('A');
                SmartBlog.InitializeCKEditor();
                SmartBlog.IconUploaderSummary();

                $("#btmWPImport").on("click", function () {
                    $('#divWPImport').show();
                    $('#divNewPost').hide();
                });

                if (SageFrameUserName == "superuser") {
                    var html = "";
                    html += '<label id="imgPost" class="sfBtn">Unapprove Posts</label>';
                    $("#divUnPublishPost").html(html);
                }
                $("#imgPost").on("click", function () {
                    SmartBlog.GetPost('U');
                    $('#divDisplayPost').show();
                    $('#divNewPost').hide();
                    $('#btnPost').hide();
                    $('#btnNewPost').hide();
                    $('#btmWPImport').hide();
                    $('#btnCancel').hide();
                    $('#divComment').hide();
                    $('#divEditcomment').hide();
                    $('#btnCancel').show();
                });

                $("#btnSaveComment").on("click", function () {
                    SmartBlog.UpdateComment(SmartBlog.config.CommentID);
                    $('#divComment').show();
                    $('#divEditcomment').hide();
                    SmartBlog.GetCommentByPostID('M');

                });

                $("#btnApprovePost").on("click", function () {
                    SmartBlog.config.lstComment = "";
                    var ApprovePost = $('#divDisplayPost').find('input.sfCheckbox:checked');
                    $.each(ApprovePost, function (index, item) {
                        if ($(this).prop("checked")) {
                            var GetApprovedPost = new Array();
                            GetApprovedPost = $(this).prop("id").split("_");
                            SmartBlog.config.lstPost += GetApprovedPost[1] + ',';
                        }
                    });
                    SmartBlog.ApprovePost(SmartBlog.config.lstPost);

                    SmartBlog.GetPost('A');


                });
                $("body").on("click", "#btnApprove", function () {
                    SmartBlog.config.lstComment = "";
                    var ApproveComment = $('#divComment').find('input.sfCheckbox:checked');
                    $.each(ApproveComment, function (index, item) {
                    
                        if ($(this).prop("checked")) {
                            var GetApprovedComment = new Array();
                            GetApprovedComment = $(this).prop("id").split("_");
                            SmartBlog.config.lstComment += GetApprovedComment[1] + ',';
                        }
                    });
                    SmartBlog.ApproveComment(SmartBlog.config.lstComment);
                    SmartBlog.GetCommentByPostID('M');

                });
                $("body").on("click", "#btnUnapprove", function () {
                    SmartBlog.config.lstComment = "";
                    var UnapproveComment = $('#divComment').find('input.sfCheckbox:not(:checked)');
                    $.each(UnapproveComment, function (index, item) {
                        var GetunapprovedComment = new Array();
                        GetunapprovedComment = $(this).prop("id").split("_");
                        SmartBlog.config.lstComment += GetunapprovedComment[1] + ',';

                    });
                    SmartBlog.UnapproveComment(SmartBlog.config.lstComment);
                    SmartBlog.GetCommentByPostID('M');

                });
                $("body").on("click", "#tblComment tbody .edit", function () {
                    var Comment = $(this).parents('tr').find("td:eq(1)").html();
                    var GetCommentID = new Array();
                    GetCommentID = $(this).prop("id").split("_");
                    SmartBlog.config.CommentID = GetCommentID[1];
                    $('#divComment').hide();
                    $('#divEditcomment').show();
                    $('#txtEditComment').val(Comment);
                });
                $("body").on("click", "#tblComment tbody .delete", function () {
                    var GetCommentID = new Array();
                    GetCommentID = $(this).prop("id").split("_");
                    SmartBlog.config.CommentID = GetCommentID[1];
                    SmartBlog.DeleteComment(SmartBlog.config.CommentID);
                    SmartBlog.GetCommentByPostID('M');
                });

                $("body").on("click", "#tblPost tbody .delete", function () {
                    var $self = $(this);
                    jConfirm('Are you sure you want to delete Post ?', 'Confirmation Dialog', function (r) {
                        if (r) {
                            var GetPostID = new Array();
                            GetPostID = $self.prop("id").split("_");
                            var PostID = GetPostID[1] == "-1" ? "0" : GetPostID[1];
                            SmartBlog.DeletePost(PostID);
                            SmartBlog.GetPost('A');
                        }
                    });

                });
                $("body").on("click", "#tblPost tbody .edit", function () {
                    var GetPostID = new Array();
                    var Author = SageFrameUserName;
                    GetPostID = $(this).prop("id").split("_");
                    var PostID = GetPostID[1] == "-1" ? "0" : GetPostID[1];
                    SmartBlog.GetPostByPostID(PostID);
                    SmartBlog.config.PostID = PostID;
                    $('#divNewPost').show();
                    $('#divDisplayPost').hide();
                    $('#btnNewPost').show();

                    if (Author != 'superuser') {

                        $('#btmWPImport').hide();
                    }
                    else {

                        $('#btmWPImport').show();
                    }
                    $('#btnUpdate').show();
                    $('#btnCancel').show();
                });
                $("body").on("click", "#tblPost tbody .comment", function () {
                    var GetPostID = new Array();
                    GetPostID = $(this).prop("id").split("_");
                    SmartBlog.config.PostID = GetPostID[1] == "-1" ? "0" : GetPostID[1];
                    SmartBlog.GetCommentByPostID('M');
                    $('#divNewPost').hide();
                    $('#divDisplayPost').hide();
                    $('#btnNewPost').hide();
                    $('#btmWPImport').hide();
                    $('#btnCancel').show();
                });
                $("body").on("click", "#tblPost tbody .apprcomment", function () {
                    SmartBlog.config.Flag = true;
                    var GetPostID = new Array();
                    GetPostID = $(this).prop("id").split("_");
                    SmartBlog.config.PostID = GetPostID[1] == "-1" ? "0" : GetPostID[1];
                    SmartBlog.GetCommentByPostID('V');
                    $('#divNewPost').hide();
                    $('#divDisplayPost').hide();
                    $('#btnNewPost').hide();
                    $('#btmWPImport').hide();
                    $('#btnCancel').show();
                });
                $("#btnNewPost").on("click", function () {
                    SmartBlog.ClearControl();
                    $('#divNewPost').show();
                    $('#divDisplayPost').hide();
                    $('#btnPost').show();
                    $('#btnUpdate').hide();
                    $('#btnCancel').show();
                    $('#divWPImport').hide();
                    SmartBlog.LoadCultureList();
                });

                $("#btnCancel").on("click", function () {
                    SmartBlog.ClearControl();
                    $('#btnPost').hide();
                    $('#btnNewPost').show();
                    $('#btnCancel').hide();
                    $('#divNewPost').hide();
                    $('#divComment').hide();
                    $('#divEditcomment').hide();
                    $('#divDisplayPost').show();
                    $('#divWPImport').hide();
                    var Author = SageFrameUserName;
                    if (Author != 'superuser') {

                        $('#btmWPImport').hide();
                    }
                    else {

                        $('#btmWPImport').show();
                    }
                    SmartBlog.config.PostID = "";
                    SmartBlog.GetPost('A');

                });

                $("#divIconSummary .delete").on("click", function () {
                    var IconName = SmartBlog.config.SummaryIcon;
                    SmartBlog.DeleteSummaryIcon(IconName);
                    $('#divIconSummary').remove();

                });
                var v = $("#form1").validate({
                    ignore: ':hidden',
                    rules: {
                        txtTitle: { required: true },
                        txtPost: { required: true },
                        txtSummary: { required: true }
                    },
                    messages: {
                        txtTitle: "Please enter a Post Title",
                        txtPost: "Please enter a Post description",
                        txtSummary: "Please enter a Post Summary"
                    }

                });

                $("#btnPost").on("click", function () {
                    if ($('#txtPost').val() != "") {
                        SmartBlog.config.lstCategory = "";
                        SmartBlog.config.lstTag = "";
                        var CateGorychecks = $('#divAddCategory').find('input.sfCheckbox:checked');
                        var Tagchecks = $('#divAddTag').find('input.sfCheckbox:checked');
                        $.each(CateGorychecks, function (index, item) {
                            if ($(this).prop("checked")) {
                                var GetCategory = new Array();
                                GetCategory = $(this).prop("id").split("_");
                                //SmartBlog.config.lstCategory.push($(this).prop("id"));
                                SmartBlog.config.lstCategory += GetCategory[1] + ',';
                            }
                        });
                        $.each(Tagchecks, function (index, item) {
                            if ($(this).prop("checked")) {
                                var GetTag = new Array();
                                GetTag = $(this).prop("id").split("_");
                                SmartBlog.config.lstTag += GetTag[1] + ',';
                            }
                        });
                        SmartBlog.SavePost('A');
                        SmartBlog.ClearControl();
                        var Author = SageFrameUserName;
                        if (Author == 'superuser')
                            SageFrame.messaging.show("Post publish successfully.", "Success");
                        else
                            SageFrame.messaging.show("Post saved successfully.It goes for moderation review.", "Success");
                    }
                    else {
                        SageFrame.messaging.show("Empty post should not be submit.", "Error");
                        return false;
                    }
                });


                $("#btnUpdate").on("click", function () {

                    if ($('#txtPost').val() != "") {
                        SmartBlog.config.lstCategory = "";
                        SmartBlog.config.lstTag = "";
                        var CateGorychecks = $('#divAddCategory').find('input.sfCheckbox:checked');
                        var Tagchecks = $('#divAddTag').find('input.sfCheckbox:checked');
                        $.each(CateGorychecks, function (index, item) {
                            if ($(this).prop("checked")) {
                                var GetCategory = new Array();
                                GetCategory = $(this).prop("id").split("_");
                                //SmartBlog.config.lstCategory.push($(this).prop("id"));
                                SmartBlog.config.lstCategory += GetCategory[1] + ',';
                            }
                        });
                        $.each(Tagchecks, function (index, item) {
                            if ($(this).prop("checked")) {
                                var GetTag = new Array();
                                GetTag = $(this).prop("id").split("_");
                                SmartBlog.config.lstTag += GetTag[1] + ',';
                            }
                        });
                        SmartBlog.SavePost(SmartBlog.config.PostID);
                        SmartBlog.GetPost('A');
                        $('#divNewPost').hide();
                        $('#divDisplayPost').show();
                        $('#btnNewPost').hide();
                        $('#btnCancel').hide();
                    }
                    else {
                        SageFrame.messaging.show("Empty post should not be update.", "Error");
                        return false;
                    }
                });

                $("#divAddTag").hover(function () {
                    $(this).find('.delete').show();
                }, function () {
                    $(this).find('.delete').hide();
                });
                $("#divAddTag .delete").on("click", function () {
                    var GetTagID = new Array();
                    GetTagID = $(this).prop("id").split("_");
                    var delID = GetTagID[1];
                    SmartBlog.DeleteTagCategory('T', delID);
                    $(this).prev('label').remove();
                    $(this).prev('input:checkbox').remove();
                    $(this).remove();

                });
                $("#divAddCategory").hover(function () {
                    $(this).find('.delete').show();
                }, function () {
                    $(this).find('.delete').hide();
                });
                $("#divAddCategory .delete").on("click", function () {
                    var GetCategoryID = new Array();
                    GetCategoryID = $(this).prop("id").split("_");
                    var delID = GetCategoryID[1];
                    SmartBlog.DeleteTagCategory('C', delID);
                    $(this).prev('label').remove();
                    $(this).prev('input:checkbox').remove();
                    $(this).remove();

                });

                $('#txtTag').keyup(function (e) {
                    if ($(this).val().length > 0) {
                        $('#lblEmptyTag').remove();
                    }
                });

                $("#btnAddTag").on("click", function () {
                    if ($('#txtTag').val() == "") {
                        var container = "";
                        var html = "";
                        container = $('#divAddTag');
                        html = '<label id="lblEmptyTag" class="sfError">Tag fieled should not be blank.</label>';
                        container.html($(html));
                        $('#txtTag').focus('');
                        return false;

                    }
                    else {
                        SmartBlog.SaveTag();
                        SmartBlog.GetID("T");
                        SmartBlog.AddCheckbox($('#txtTag').val(), "T");
                        $('#txtTag').val('');
                        $('#txtTag').focus('');
                    }


                });
                $('#txtCategory').keyup(function (e) {
                    if ($(this).val().length > 0) {
                        $('#lblEmptyCategory').remove();
                    }
                });
                $("#btnAddCategory").on("click", function () {
                    if ($('#txtCategory').val() == "") {
                        var container = "";
                        var html = "";
                        container = $('#divAddCategory');
                        html = '<label id="lblEmptyCategory" class="sfError">Category fieled should not be blank.</label>';
                        container.html($(html));
                        $('#txtCategory').focus();

                        return false;

                    }
                    else {
                        SmartBlog.SaveCategory();
                        SmartBlog.GetID("C");
                        SmartBlog.AddCheckbox($('#txtCategory').val(), "C");
                        $('#txtCategory').val('');
                        $('#txtCategory').focus();
                    }
                });
            },
            InitializeCKEditor: function () {
                $('#txtPost').ckeditor("config");
            },
            ClearControl: function () {
                $('#txtTitle').val('');
                $('#txtPost').val('');
                $('#divAddTag').html('');
                $('#divAddCategory').html('');
                $('#txtSummary').val('');
                $('#divIconSummary').html('');
                $('#txtAuthor').html('');
            },
            LoadCultureList: function () {
                this.config.method = "loadCultureList";
                var Author = SageFrameUserName;
                this.config.data = "{}",
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 20;
                this.ajaxCall(this.config);
            },
            BindCultureList: function (data) {
                var html = '';
                var lstCulture = data.d;
                $.each(lstCulture, function (index, item) {
                    if (item.LanguageCode == "en-US")
                        html += '<option selected="selected" value=' + item.LanguageCode + '>' + item.LanguageName + '</option>';
                    else
                        html += '<option value=' + item.LanguageCode + '>' + item.LanguageName + '</option>';

                });
                $('#slcCulture').html(html);
            },
            GetPost: function (Mode) {
                var Author = SageFrameUserName;


                var Columns = '';
                var Format = '';
                var Extra = '';
                switch (Mode) {
                    case 'A':
                        Columns = '<tr><th>S.N.</th><th>Title</th><th>Edit</th><th>Comment</th><th>Approve</th><th>Delete</th></tr>';
                        Format = ['<td>', 'RowNum', '</td><td>', 'PostTitle', '</td><td><img src="' + SageFrame.utils.GetAdminImage("imgEdit.png") + '" id="del_', 'PostID', '" class="edit">',
                 '</td><td><img src="' + SmartBlog.config.ImagePath + 'unapproveComment.png"  id="com_', 'PostID', '" class="comment">', 'UnApproveComment', '</td><td><img src="' + SmartBlog.config.ImagePath + 'ApproveComment.png" id="apprcom_', 'PostID', '" class="apprcomment">',
                 'ApproveComment', '</td><td><img src="' + SageFrame.utils.GetAdminImage("imgdelete.png") + '" id="edit_', 'PostID', '" class="delete"></td>'];
                        break;
                    case 'U':
                        Columns = '<tr><th>S.N.</th><th>Title</th><th>Author</th><th>Approve</th><th>Delete</th><th>Edit</th></tr>';
                        Format = ['<td>', 'RowNum', '</td><td>', 'PostTitle', '</td><td>', 'Author', '</td><td><input type="checkbox" id="appr_', 'PostID', '" class="sfCheckbox"></td><td><img src="' + SageFrame.utils.GetAdminImage("imgdelete.png") + '" id="edit_', 'PostID', '" class="delete"></td><td><img src="' + SageFrame.utils.GetAdminImage("imgEdit.png") + '" id="del_', 'PostID', '" class="edit"></td>'];
                        Extra = '<input type="button" id="btnApprovePost" class="sfBtn" value="Approve Post" title="Apprrove Post">';
                        break;
                }
                var autoWrap = true;
                $(this).Paging({
                    Type: '',
                    divID: 'divDisplayPost',
                    PagingID: 'divPaging',
                    Columns: ['PostID', 'PostDescription', 'PostTitle', 'PostSummary'],
                    CountUrl: 'GetCount',
                    CountData: { Author: Author, Mode: Mode },
                    DataUrl: 'GetPost',
                    DataParams: { Author: Author, Mode: Mode, range: '10', secureToken: secureToken, SageFrameUserName: SageFrameUserName, userModuleID: userModuleID, PortalID: portalID },
                    PageNo: 1,
                    range: 5,
                    Wrapper: 'tr',
                    Myheader: Columns,
                    Format: Format,
                    Extra: Extra,
                    AutoWrap: autoWrap,
                    OnComplete: function () {

                    }
                });
            },
            BindPost: function (data) {
                var html = '';
                var lstPost = data.d;
                html += '<table id="tblPost" width="100%">';
                html += '<tr>';
                html += '<th>' + "S.N." + '</th>';
                html += '<th>' + "Title" + '</th>';
                html += '<th>' + "Edit" + '</th>';
                html += '<th>' + "Comment" + '</th>';
                html += '<th>' + "Approve" + '</th>';
                html += '<th>' + "Delete" + '</th>';
                html += '</tr>';

                $.each(lstPost, function (index, item) {
                    if (item != "") {
                        var editid = 'edit_' + item.PostID;
                        var delid = 'del_' + item.PostID;
                        var comid = 'com_' + item.PostID;
                        var apprcomid = 'apprcom_' + item.PostID;
                        var styleClass = index % 2 == 0 ? 'class="sfOdd"' : "sfEven";
                        html += '<tr ' + styleClass + '>';
                        html += '<td >' + parseInt(index + 1) + '</td>';
                        html += '<td>' + item.PostTitle + '</td>';
                        html += '<td><img class="edit" id=' + delid + ' src=' + SageFrame.utils.GetAdminImage("imgEdit.png") + '></td>';
                        html += '<td><img class="comment" id=' + comid + '  src="' + SageFrameAppPath + '/Modules/SmartBlog/images/comment.png">' + item.UnApproveComment + '</td>';
                        html += '<td><img class="apprcomment" id=' + apprcomid + ' src="' + SageFrameAppPath + '/Modules/SmartBlog/images/ApproveComment.png">' + item.ApproveComment + '</td>';
                        html += '<td><img class="delete" id=' + editid + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '></td>';
                        html += '</tr>';
                    }
                });
                html += '</table>';
                $('#divDisplayPost').html(html);
            },
            BindUnaAppprovePost: function (data) {

                var html = '';
                var lstPost = data.d;
                if (lstPost != "") {
                    html += '<table id="tblPost" width= "100%">';
                    html += '<thead><tr>';
                    html += '<td><h1>' + "S.N." + '</td>';
                    html += '<td><h1>' + "Title" + '</td>';
                    html += '<td><h1>' + "Author" + '</td>';
                    html += '<td><h1>' + "Approve" + '</td>';
                    html += '<td><h1>' + "Delete" + '</td>';
                    html += '<td><h1>' + "Edit" + '</td>';
                    html += '</thead></tr>';
                    html += '<tbody>';

                    $.each(lstPost, function (index, item) {
                        if (item != "") {
                            var editid = 'edit_' + item.PostID;
                            var delid = 'del_' + item.PostID;
                            var apprid = 'appr_' + item.PostID;
                            var apprcomid = 'apprcom_' + item.PostID;
                            var styleClass = index % 2 == 0 ? 'class="sfOdd"' : "sfEven";
                            html += '<tr>';
                            html += '<td ' + styleClass + '>' + parseInt(index + 1) + '</td>';
                            html += '<td ' + styleClass + '>' + item.PostTitle + '</td>';
                            html += '<td ' + styleClass + '>' + item.Author + '</td>';
                            html += '<td><input type="checkbox" class="sfCheckbox"  id=' + apprid + '></td>';
                            html += '<td><img class="delete" id=' + editid + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '></td>';
                            html += '<td><img class="edit" id=' + delid + ' src=' + SageFrame.utils.GetAdminImage("imgEdit.png") + '></td>';
                            html += '</tr>';
                        }
                    });
                    html += '</tbody></table>';
                    html += '<input type="button" title="Apprrove Post" value="Approve Post" class="sfBtn" id="btnApprovePost" />';
                    $('#divDisplayPost').html(html);
                }
                else {
                    //$('#divDisplayPost').html('There is not any post for approved');
                }
            },
            //-----Crud operation of Post-----
            SavePost: function (Mode) {


                this.config.method = "AddUpdatePost";
                this.config.data = JSON2.stringify({
                    Flag: Mode,
                    PostTitle: $('#txtTitle').val(),
                    PostDescription: $('#txtPost').val(),
                    Tags: SmartBlog.config.lstTag,
                    Category: SmartBlog.config.lstCategory,
                    PostSummary: $('#txtSummary').val(),
                    SummaryIcon: $('#lblImgSummary').text() == "" ? SmartBlog.config.SummaryIcon : $('#lblImgSummary').text(),
                    Author: $('#txtAuthor').val(),
                    Culture: $('#slcCulture option:selected').val(),
                    PortalID: portalID,
                    PostURL: postURL,
                    secureToken: secureToken,
                    SageFrameUserName: SageFrameUserName,
                    userModuleID: userModuleID,
                    AddedBy: SageFrameUserName
                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 4;
                this.ajaxCall(this.config);
            },

            DeletePost: function (PostID) {
                this.config.method = "DeletePost";
                this.config.data = JSON2.stringify({ PostID: PostID });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 6;
                this.ajaxCall(this.config);
            },
            GetPostByPostID: function (PostID) {
                this.config.method = "GetPostByPostID";
                var Author = SageFrameUserName;
                this.config.data = JSON2.stringify({ PostID: PostID });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 8;
                this.ajaxCall(this.config);

            },
            BindPostByPostID: function (data) {
                SmartBlog.LoadCultureList();
                var lstPost = data.d;
                $('#divAddCategory').html('');
                $('#divAddTag').html('');
                $.each(lstPost, function (index, item) {
                    var html = "";
                    var htmlT = "";
                    var htmlS = "";
                    $('#lblImgSummary').text('');
                    $('#txtTitle').val(item.PostTitle);
                    $('#txtPost').val(item.PostDescription);
                    $('#txtAuthor').val(item.Author);
                    var GetCategory = new Array();
                    var Tags = new Array();
                    GetCategory = item.Categories.split(",");
                    GetTag = item.Tags.split(",");
                    $.each(GetCategory, function (index, itemC) {
                        SmartBlog.GetTagCategoryID('C', itemC, item.PostID);

                        if (itemC != "")
                            html += '<input type="checkbox" class="sfCheckbox" disabled="disabled"  checked="checked" id="' + itemC + "_" + SmartBlog.config.CategoryID + '" value="' + itemC + '" /> <label for="' + itemC + "_" + SmartBlog.config.CategoryID + '">' + itemC + '</label><img class="delete"  style="display: none;" id=img_' + SmartBlog.config.CategoryID + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '>';
                    });
                    $('#divAddCategory').html(html);
                    $.each(GetTag, function (index, itemT) {
                        SmartBlog.GetTagCategoryID('T', itemT, item.PostID);

                        if (itemT != "")
                            htmlT += '<input type="checkbox" class="sfCheckbox" disabled="disabled" checked="checked" id="' + itemT + "_" + SmartBlog.config.TagID + '" value="' + itemT + '" /> <label for="' + itemT + "_" + SmartBlog.config.TagID + '">' + itemT + '</label><img class="delete"  style="display: none;" id=img_' + SmartBlog.config.TagID + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '>';
                    });
                    $('#divAddTag').html(htmlT);
                    $('#txtSummary').val(item.PostSummary);
                    var IconPath = SmartBlog.config.SummaryIconPath + item.SummaryIcon;
                    //htmlS += '<image id="' + item.PostSummary + '" src="'+IconPath+'" />');
                    htmlS = '<img class="sfSummaryIcon" id="' + item.SummaryIcon + '" src="' + IconPath + '" >';
                    var Culture = item.Culture;
                    $('#slcCulture option:selected').removeAttr('selected');
                    $('#slcCulture').val(Culture);


                    $("#slcCulture option[value=" + Culture + "]").prop("checked", "checked");

                    $('#divUploadSummaryIcon').html(htmlS);
                    $('#divUploadSummary [type=file]').after('<label id="lblImgSummary" class="sfSummary"><br>' + item.SummaryIcon + '</label>');

                });


            },
            DeleteSummaryIcon: function (IconPath) {
                this.config.method = "DeleteSummaryIcon";
                this.config.data = JSON2.stringify({
                    IconPath: IconPath
                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 19;
                this.ajaxCall(this.config);
            },
            //-----End-----

            //-----Utils-----
            AddCheckbox: function (Name, Mode) {
                var container = "";
                var id = "";
                if (Mode == "C")
                    container = $('#divAddCategory');
                else
                    container = $('#divAddTag');
                var inputs = container.find('input');
                id = Name + '_' + SmartBlog.config.ID;
                delID = "img_" + SmartBlog.config.ID;
                var html = '<input type="checkbox" class="sfCheckbox" disabled="disabled" checked="checked"  id="' + id + '" value="' + Name + '" /> <label for="' + id + '">' + Name + '</label><img class="delete"  style="display: none;" id=' + delID + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '>';
                container.append($(html));
            },

            GetPostID: function getURLParameter(name) {
                return decodeURI((RegExp(name + '=' + '(.+?)(&|$)').exec(location.search) || [, null])[1]);
            },
            //-----End-Utils-----

            //-----Tag & Category-----
            SaveCategory: function () {
                this.config.method = "SaveCategory";
                this.config.data = JSON2.stringify({ CategoryName: $('#txtCategory').val() });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 0;
                this.ajaxCall(this.config);
            },
            SaveTag: function () {
                this.config.method = "SaveTag";
                this.config.data = JSON2.stringify({ TagName: $('#txtTag').val() });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 1;
                this.ajaxCall(this.config);
            },
            GetID: function (Mode) {
                this.config.method = "GetID";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ Flag: Mode });
                this.config.ajaxCallMode = 3;
                this.ajaxCall(this.config);
            },

            GetTagCategoryID: function (Mode, TCName, PostID) {
                this.config.method = "GetTagCategoryID";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ Flag: Mode, TCName: TCName, PostID: PostID });
                this.config.ajaxCallMode = 14;
                this.ajaxCall(this.config);
            },
            DeleteTagCategory: function (Mode, ID) {
                this.config.method = "DeleteTagCategoryByID";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ Flag: Mode, ID: ID });
                this.config.ajaxCallMode = 15;
                this.ajaxCall(this.config);
            },

            //----- End - Tag & Category -----



            //-----Comment-----
            GetCommentByPostID: function (Mode) {
                var Author = SageFrameUserName;
                $(this).Paging({
                    Type: '',
                    divID: 'tblComment',
                    PagingID: 'divCommentPaging',
                    CountUrl: 'GetPostCount',
                    CountData: {
                        PostID: SmartBlog.config.PostID,
                        Mode: Mode
                    },
                    DataUrl: 'GetCommentByPostID',
                    DataParams: {
                        PostID: SmartBlog.config.PostID,
                        Mode: Mode,
                        range: '10'
                    },
                    PageNo: 1,
                    range: 5,
                    Wrapper: 'tr',
                    AutoWrap: false,
                    OnComplete: function (data) {
                        SmartBlog.BindCommentByCommentID(data);
                    }
                });

                //                this.config.method = "GetCommentByPostID";
                //                this.config.data = JSON2.stringify({
                //                    PostID: SmartBlog.config.PostID,
                //                    Mode: Mode
                //                });
                //                this.config.url = this.config.baseURL + this.config.method;
                //                this.config.ajaxCallMode = 9;
                //                this.ajaxCall(this.config);
            },
            BindCommentByCommentID: function (data) {
                $('#divComment').show();
                var lstPosts = data.d;
                var html = '';
                if (lstPosts.length > 0) {
                    html += '<tr>';
                    html += '<th>S.N.</th>';
                    html += '<th>Comment</th>';
                    html += '<th>User</th>';
                    html += '<th>Approve</th>';
                    html += '<th>Delete</th>';
                    html += '<th>Edit</th></tr>';
                    $.each(lstPosts, function (index, item) {
                        if (item != "") {
                            var editid = 'edit_' + item.CommentID;
                            var delid = 'del_' + item.CommentID;
                            var comid = 'com_' + item.CommentID + '_' + item.PostID;
                            var styleClass = index % 2 == 0 ? 'class="sfOdd"' : "sfEven";
                            html += '<tr ' + styleClass + '>';
                            html += '<td >' + item.RowNum + '</td>';
                            html += '<td  >' + item.Comment + '</td>';
                            html += '<td  >' + item.UserName + '</td>';
                            if (item.IsApproved == 'True')
                                html += '<td><input type="checkbox" class="sfCheckbox" checked="checked" id=' + comid + '></td>';
                            else
                                html += '<td><input type="checkbox" class="sfCheckbox"  id=' + comid + '></td>';
                            html += '<td><img class="delete" id=' + delid + ' src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '></td>';
                            html += '<td><img class="edit" id=' + editid + ' src=' + SageFrame.utils.GetAdminImage("imgedit.png") + '></td>';
                            html += '</tr>';
                        }
                    });
                    var btn = '';
                    $('#tblComment').html(html);
                    if (SmartBlog.config.Flag == true) {
                        btn += '<input type="button" title="Unapprrove" value="Unapprove Comment" class="sfBtn" id="btnUnapprove" />';
                        SmartBlog.config.Flag = false;
                    }
                    else {
                        btn += '<input type="button" title="Aprrove" value="Approve Comment" class="sfBtn" id="btnApprove" />';
                    }

                    $('#tblComment').append(btn);
                }
                else {
                    $('#tblComment').html('<tr><td><label class="sfFormlabel">There is not any comment in your post.</label></td></tr>');
                }
            },
            GetCommentCount: function (PostID) {
                this.config.method = "GetCommentCount";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ PostID: PostID });
                this.config.ajaxCallMode = 10;
                this.ajaxCall(this.config);
            },
            GetApproveCommentCount: function (PostID) {
                this.config.method = "GetApproveCommentCount";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ PostID: PostID });
                this.config.ajaxCallMode = 16;
                this.ajaxCall(this.config);
            },
            ApproveComment: function (CommentIDs) {
                this.config.method = "ApproveComment";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ CommentIDs: CommentIDs });
                this.config.ajaxCallMode = 11;
                this.ajaxCall(this.config);
            },
            ApprovePost: function (PostIDs) {
                this.config.method = "ApprovePost";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ PostIDs: PostIDs });
                this.config.ajaxCallMode = 18;
                this.ajaxCall(this.config);
            },
            UnapproveComment: function (CommentIDs) {
                this.config.method = "UnapproveComment";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ CommentIDs: CommentIDs });
                this.config.ajaxCallMode = 11;
                this.ajaxCall(this.config);
            },
            UpdateComment: function (CommentID) {
                this.config.method = "UpdateComment";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ CommentID: CommentID, Comment: $('#txtEditComment').val() });
                this.config.ajaxCallMode = 12;
                this.ajaxCall(this.config);
            },
            DeleteComment: function (CommentID) {
                this.config.method = "DeleteComment";
                this.config.url = this.config.baseURL + this.config.method;
                this.config.data = JSON2.stringify({ CommentID: CommentID });
                this.config.ajaxCallMode = 13;
                this.ajaxCall(this.config);
            },
            //-----End-Comment-----

            //-----Sumarry Pic-Uploader------
            IconUploaderSummary: function () {
                var uploadFlag = false;
                var upload = new AjaxUpload($('#fupIconSummary'), {
                    action: SmartBlog.config.Path + 'UploadHandler.ashx',
                    name: 'myfile[]',
                    multiple: false,
                    data: {},
                    autoSubmit: true,
                    responseType: 'json',
                    onChange: function (file, ext) {
                    },
                    onSubmit: function (file, ext) {
                        ext = ext.toLowerCase();
                        if (ext == "png" || ext == "jpg" || ext == "gif" || ext == "bmp" || ext == "JPEG" || ext == "jpeg" || ext == "ico") {
                            return true;
                        }
                        else {
                            alert('Alert Message<p>Not a valid image file!</p>');
                            return false;
                        }
                    },
                    onComplete: function (file, response) {
                        var Eximage = file.split(" ").join("_");
                        var filePath = SmartBlog.config.iconPath + "/Modules/SmartBlog/SummaryIcon/" + Eximage;
                        SmartBlog.config.SummaryIcon = Eximage;
                        $('#lblImgSummary').text('');
                        //$('#divUploadSummary [type=file]').after("<label id='lblImgSummary' class='sfSummary'><br>" + Eximage + "</label>");
                        //$('#divUploadSummary [type=file]').text(Eximage);
                        var html = '<div id="divIconSummary"><label id="lblImgSummary" class="sfSummary"><br>' + Eximage + '</label><br/><img class="sfSummaryIcon" title=' + Eximage + ' src="' + filePath + '" ><span class="deleteIcon"><img class="delete" src=' + SageFrame.utils.GetAdminImage("imgdelete.png") + '></span></div>';
                        $('div.sfUploadedFilesSummary').html(html);
                    }
                });
            },
            //-----End Sumarry Pic-Uploader -----
            ajaxSuccess: function (data) {
                switch (SmartBlog.config.ajaxCallMode) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 3:
                        SmartBlog.config.ID = data.d;
                        break;
                    case 4:
                        break;
                    case 5:
                        SmartBlog.BindPost(data);
                        break;
                    case 6:
                        break;
                    case 7:
                        break;
                    case 8:
                        SmartBlog.BindPostByPostID(data);
                        break;
                    case 9:
                        SmartBlog.BindCommentByCommentID(data);
                        break;
                    case 10:
                        //SmartBlog.config.CommentCount = data.d;
                        break;
                    case 11:

                        break;
                    case 12:
                        break;
                    case 13:
                        break;
                    case 14:
                        var ID = data.d;
                        $.each(ID, function (index, item) {

                            if (item.Category = 'C' && item.CategoryID != 0)
                                SmartBlog.config.CategoryID = item.CategoryID;
                            if (item.Category = 'T' && item.TagID != 0)
                                SmartBlog.config.TagID = item.TagID;
                        });
                        break;
                    case 15:
                        break;
                    case 16:
                        //SmartBlog.config.ApproveCommentCount = data.d;
                        break;
                    case 17:
                        SmartBlog.BindUnaAppprovePost(data);
                        break;
                    case 18:
                        break;
                    case 19:
                        break;
                    case 20:
                        SmartBlog.BindCultureList(data);
                        break;
                }
            },

            ajaxFailure: function () {
                //alert('fail');
            },
            ajaxCall: function (config) {
                $.ajax({
                    type: 'POST',
                    async: false,
                    url: SmartBlog.config.url,
                    data: SmartBlog.config.data,
                    dataType: SmartBlog.config.dataType,
                    contentType: SmartBlog.config.contentType,
                    success: SmartBlog.ajaxSuccess,
                    error: SmartBlog.ajaxFailure
                });
            }

        };
        SmartBlog.init();
    };
    $.fn.SageSmartBlog = function (p) {
        $.createSmartBlog(p);
    };
})(jQuery);
 
 