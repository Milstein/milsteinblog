(function ($) {
    $.createSmartBlogReadDetailsReadDetails = function (p) {

        var range = 5;
        var commentpage = 1;
        var postViewID;
        var commentOffset = 0;

        var totalComment = 0;
        var SmartBlogReadDetails = {
            config: {
                isPostBack: false,
                async: true,
                cache: false,
                type: 'POST',
                contentType: "application/json; charset=u0tf-8",
                data: '',
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
                PostID: ""
            },

            init: function () {

                var v = $("#form1").validate({
                    ignore: ':hidden',
                    rules: {
                        txtUserName: { required: true },
                        txtEmail: { required: true, email: true },
                        txtComment: { required: true }
                    },
                    messages: {
                        txtUserName: "User name is required.",
                        txtEmail: "Email is required and must be in valid pattern.",
                        txtComment: "Comment is required."
                    }

                });

                $('#divCommentNotification').html('');
                $('#lblCommetModration').remove();
                var Author = SageFrameUserName;
                if (Author === 'anonymoususer')
                    $('#trEmail').show();
                else
                    $('#trEmail').hide();




                var PostID = "";

                SmartBlogReadDetails.config.PostID = SmartBlogReadDetails.GetPostID(PostID);
                if (!isNaN(SmartBlogReadDetails.config.PostID)) {
                    if (SmartBlogReadDetails.config.PostID != "null") {

                        SmartBlogReadDetails.GetPostByPostID(SmartBlogReadDetails.config.PostID);
                        var mode = Mode;
                        if (mode = 'V') {
                            $("#DivPostView").hide();


                        }
                        else {
                            $("#divBlogDetails").hide();
                        }
                        // SmartBlogReadDetails.GetPostCommentByPostID('V');
                    }
                }

                $("#btnBack").click(function () {
                    parent.history.back();
                    return false;
                });

                $("#btnComment").click(function () {

                    SmartBlogReadDetails.HideAll();
                    $("#divComment").show();
                    $("#divDisplayComment").empty();

                });

                $('#btnShowPost').on('click', function () {
                    commentOffset = 0;
                    commentpage = 1;

                    SmartBlogReadDetails.HideAll();
                    postViewID = SmartBlogReadDetails.GetPostID(PostID);
                    var comment = SmartBlogReadDetails.LoadCommentByPost(postViewID);

                    if (comment == 1) {
                        $("#divDisplayComment").show();
                        $('#divDisplayComment').scrollTop(0);
                    }

                    else {
                        $("#divDisplayComment").hide();
                    }
                });

                $("#btnPostComment").click(function () {
                    if (v.form()) {
                        var html = "";
                        var Author = SageFrameUserName;
                        $('#lblCommetModration').remove();
                        SmartBlogReadDetails.PostComment();
                        //SmartBlogReadDetails.SendCommentNotification();
                        $('#txtUserName').val('');
                        $('#txtComment').val('');
                        $('#divComment').hide();
                        $('#divCommentNotification').show();
                        if (Author == "superuser") {
                            SmartBlogReadDetails.GetPostByPostID(SmartBlogReadDetails.config.PostID);
                            SmartBlogReadDetails.GetPostCommentByPostID('V');
                        }
                        else {
                            //html += '<label id="lblCommetModration">Thanks For Comment.Your Comment goes for modration.</label>';
                            jAlert('Your Comment goes for modration.', 'Comment success');
                            $('#divCommentNotification').append(html);
                            $('#btnPostComment').hide();
                        }
                    }
                    else {
                        return false;
                    }
                });
            },


            HideAll: function () {
                $("#divComment").hide();
                $("#divDisplayComment").hide();
            },

            //-----GetPost-----
            GetPostByPostID: function (PostID) {
                this.config.method = "GetPostByPostID";
                this.config.data = JSON2.stringify({ PostID: PostID });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 0;
                this.ajaxCall(this.config);

            },

            BindPostByPostID: function (data) {

                var lstPost = data.d;
                $.each(lstPost, function (index, item) {
                    $('.topTools .date').html(item.BlogPostDate);
                    if (item.Tags == "")
                        $('.topTools .tag').remove();
                    else
                        $('.topTools .tag').html(item.Tags);
                    if (item.Categories == "")
                        $('.topTools .category').remove();
                    else
                        $('.topTools .category').html(item.Categories);
                    $('.topTools .author').html(item.Author);
                    //$('.topTools .author').html('Bijay');
                    $('.title').html('<h1>' + item.PostTitle + '</h1>');
                    $('.desc').html(item.PostDescription);
                    $('.spnCommentCount').html + (item.ApproveComment);
                    if (item.ApproveComment >= 1) {
                        $('#btnShowPost').show();
                    }
                    else {
                        $('#btnShowPost').hide();
                    }
                    totalComment = item.ApproveComment;

                });
            },
            //-----End-GetPost-----

            //-----Utils-----
            GetPostID: function (name) {

                var querystring = decodeURI((RegExp(name + '=' + '(.+?)(&|$)').exec(location.search) || [, null])[1]);
                var postID = querystring.split('/');
                postID = postID[0];

                return postID;

            },
            //-----End-Utils-----

            //-----Comment-----
            PostComment: function () {
                var IsApproved = "";
                var Author = SageFrameUserName;
                if (Author == "superuser")
                    IsApproved = '1';
                else
                    IsApproved = '0';
                this.config.method = "PostComment";
                this.config.data = JSON2.stringify({
                    PostID: SmartBlogReadDetails.config.PostID,
                    Comment: $('#txtComment').val(),
                    Email: $('#txtEmail').val(),
                    IsApproved: IsApproved,
                    UserName: $('#txtUserName').val(),
                    User: Author,
                    PostURL: postURL
                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 2;
                this.ajaxCall(this.config);
            },

            GetPostCommentByPostID: function (Mode) {
                this.config.method = "GetPostCommentByPostID";
                this.config.data = JSON2.stringify({
                    PostID: SmartBlogReadDetails.config.PostID,
                    Mode: Mode,
                    pageNo: commentpage,
                    range: range


                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 3;
                this.ajaxCall(this.config);
            },

            BindCommentByCommentID: function (data) {
                $('#divDisplayComment').html('');
                var lstComment = data.d;
                var html = '';
                $.each(lstComment, function (index, item) {
                    if (item != "") {
                        html += '<img src="images/avatar-default.jpg" height="50px">';
                        html += '<table id="tblComment" cellspacing="0" cellpadding="0" border="0" width="100%">';
                        html += '<tbody>';
                        var UserName = item.UserName == "" ? "Anonymous" : item.UserName;
                        var styleClass = index % 2 == 0 ? 'class="sfOdd"' : "sfEven";
                        html += '<tr>';
                        html += '<td>' + item.Comment + '</td>';
                        html += '</tr>';
                        html += '<tr><td>';
                        html += '<span class="CommentUser">' + UserName + '</span>';
                        html += '<span class="CommentDate">' + item.Date + '</span>';
                        html += '</td></tr>';
                        html += '</tbody></table><br/><div class="clear"></div>';
                    }
                });
                $('#divDisplayComment').html(html);
            },
            SendCommentNotification: function () {
                this.config.method = "SendCommentNotification";
                this.config.data = JSON2.stringify({
                    PostTitle: $('.title h1 u').html(),
                    PostAuthor: $('span.author').text()
                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 4;
                this.ajaxCall(this.config);
            },
            //-----End-Comment-----
            ajaxSuccess: function (data) {
                switch (SmartBlogReadDetails.config.ajaxCallMode) {
                    case 0:
                        SmartBlogReadDetails.BindPostByPostID(data);
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        if (data.d.length > 0) {
                            SmartBlogReadDetails.BindComment(data);

                        }

                        else {
                            alert('No Comments to Display !!! ');

                        }

                        break;
                    case 4:
                        break;

                }
            },
            ajaxFailure: function () {
                alert('fail');
            },
            ajaxCall: function (config) {
                $.ajax({
                    type: 'POST',
                    async: false,
                    url: SmartBlogReadDetails.config.url,
                    data: SmartBlogReadDetails.config.data,
                    dataType: SmartBlogReadDetails.config.dataType,
                    contentType: SmartBlogReadDetails.config.contentType,
                    success: SmartBlogReadDetails.ajaxSuccess,
                    error: SmartBlogReadDetails.ajaxFailure
                });
            },


            LoadCommentByPost: function (postid) {

                SmartBlogReadDetails.config.method = "GetPostCommentByPostID";

                SmartBlogReadDetails.config.data = JSON.stringify({ PostID: postid, Mode: 'V', pageNo: commentpage, range: range, secureToken: secureToken, SageFrameUserName: SageFrameUserName, userModuleID: userModuleID, PortalID: portalID });

                SmartBlogReadDetails.config.url = SmartBlogReadDetails.config.baseURL + SmartBlogReadDetails.config.method;
                SmartBlogReadDetails.config.ajaxCallMode = 3;
                SmartBlogReadDetails.ajaxCall(SmartBlogReadDetails.config);
                return 1;
            },

            BindComment: function (data) {
                var bloghtml = "";

                $("#divDisplayComment").append(data.d);
            }

        };

        $('#divDisplayComment').bind('scroll', function () {



            var total = commentOffset * range + range;
            var outerHeight = $(this)[0].scrollHeight;


            var iScrollHeight = $(this).scrollTop();

            var iHeight = $(this).innerHeight();
            //  alert(outerHeight + ' ' + iScrollHeight + ' ' + iHeight);
            if (iHeight + iScrollHeight + (50 * commentOffset) >= outerHeight) {

                if (total < totalComment) {

                    commentOffset = commentOffset + 1;
                    commentpage = commentpage + 1;
                    var loading = document.getElementById('loadingDiv');


                    loading.style.display = '';


                    LoadMoreComment(SmartBlogReadDetails.config.PostID);
                }
            }
        });

        function LoadMoreComment(postViewID) {

            var loading = document.getElementById('loadingDiv');
            loading.style.display = 'none';
            SmartBlogReadDetails.LoadCommentByPost(postViewID);

        }

        SmartBlogReadDetails.init();
    };
    $.fn.SageSmartBlogReadDetails = function (p) {
        $.createSmartBlogReadDetailsReadDetails(p);
    };

})(jQuery);
 
 