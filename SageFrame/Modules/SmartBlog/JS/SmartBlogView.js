var Offset;
var commentOffset = 0;
var current = 1;
var max = 0;
var totalBlog = $('.spnTotal').text();
var arr = [];
var arrCat = [];
var range = 5;
var totalComment = '';
var commentpage = 1;
var postViewID;
var BlogView = {
    config: {
        isPostBack: false,
        async: false,
        cache: false,
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        data: '',
        dataType: 'json',
        baseURL: ServicePath + "SmartBlogService/SmartBlogService.asmx/",
        method: "",
        url: "",
        ajaxCallMode: 0,
        UserModuleID: '<%=UserModuleID %>',
        PortalID: '<%=PortalID %>'

    },

    HideAll: function () {

        $('.clsComment').hide();
        $('.commentList').hide();
        $('.commentView').hide();
        $('.DivCommentView').hide();
    },

    Init: function () {

        //$("#DivPostView").show();
        var v = $("#form1").validate({
            ignore: ':hidden',
            rules: {
                txtUserName: { required: true },

                txtComment: { required: true }
            },

            messages: {
                txtUserName: "User name is required.",

                txtComment: "Comment is required."
            }
        });

        Offset = 0;
        $(window).scrollTop(0);
        $("#divDetails").hide();
        $("#divBlogs").hide();
        if (document.location.search.length) {
            var querypostTitle = document.location.search.split('/'); // query string with post title
            var querystring = querypostTitle[0].split('=');
            var queryname = $.trim(querystring[0].replace('?', ''));
            if (querystring[1].match('%20')) {
                querystring[1] = $.trim(querystring[1].replace('%20', ' '));
            }
            var queryValue = querystring[1];
            if (queryname == 'date') {
                var querystring_Full = document.location.search.split('&');
                var querystring_I = querystring_Full[0].split('=');
                var querystring_II = querystring_Full[1].split('=');
                var queryname_II = querystring_II[0];
                var queryValue_II = querystring_II[1];
                var queryValue_I = querystring_I[1];
                if (queryname_II == 'month') {
                    $("#divBlogs").show();
                    this.LoadBlogListByDate(queryValue_I, queryValue_II);
                }
            }
            else if (queryname == 'Tag') {
                $("#divBlogs").show();
                $("#divPostViewByTag").show();
                $("#DivPostView").hide();

                BlogView.LoadBlogListByTag(queryValue);
            }
            else {
                $("#divDetails").show();
                $("#divBlogs").hide();
            }
        }
        else {

            $("#divDetails").hide();
            $("#divBlogs").show();

        }
        var blogs = $('div.sfNewArticle');
        $.each(blogs, function () {

            if ($.trim($(this).find('li.sfTag').html()) == "" || $.trim($(this).find('li.sfTag').html()) == "null") {
                $(this).find('li.sfTag').hide();
            }
            if ($.trim($(this).find('li.sfCateogory').html()) == "" || $.trim($(this).find('li.sfCateogory').html()) == "null") {
                $(this).find('li.sfCateogory').hide();
            }
        });

        $("body").on("click", '.btnPostComment', function () {

            if (v.form()) {
                var html = "";
                var Author = SageFrameUserName;
                $('#lblCommetModration').remove();
                var id = $(this).prop('id').replace("btnPostComment_", "");

                BlogView.PostComment(id);

                $('#txtUserName_' + id).val('');
                $('#txtComment_' + id).val('');
                $('#divComment_' + id).hide();
                if (Author !== "superuser" || Author !== "anonymoususer") {
                    jAlert('Your Comment goes for modration.', 'Comment success');
                }
                //$('#divCommentNotification').show();
                //                if (Author == "superuser") {
                //                    SmartBlogReadDetails.GetPostByPostID(SmartBlogReadDetails.config.PostID);
                //                    SmartBlogReadDetails.GetPostCommentByPostID('V');
                //                }
                //                else {
                //                    //html += '<label id="lblCommetModration">Thanks For Comment.Your Comment goes for modration.</label>';
                //                    jAlert('Your Comment goes for modration.', 'Comment success');
                //                    $('#divCommentNotification').append(html);
                //                    $('#btnPostComment').hide();
                //                }
            }
            else {
                return false;
            }
        });

        $('body').on('click', '.btnComment', function () {
        
            BlogView.HideAll();
            var postID = $(this).prop('id').replace("setComment_", "");
            $(".DivCommentView").empty();
            $('#divComment_' + postID).show();
            var Author = SageFrameUserName;
            if (Author === 'anonymoususer')
                $('#trEmail_' + postID).show();
            else
                $('#trEmail_' + postID).hide();
                


        });

        $('body').on('click', '.btnPost', function () {
     
       var postViewID = $(this).prop('id').replace("showPost_", "");
       totalComment = $(this).attr('value');
            if ($('#DivCommentView_' + postViewID).is(':hidden')) {
        
            commentOffset = 0;
            commentpage = 1;
          
           
           

            BlogView.HideAll();


            BlogView.LoadCommentByPost(postViewID);
            }

        });
    },
    AjaxCall: function (config) {
        $.ajax({
            type: this.config.type,
            contentType: this.config.contentType,
            cache: this.config.cache,
            url: this.config.url,
            data: this.config.data,
            async: this.config.async,
            dataType: this.config.dataType,
            success: BlogView.AjaxSuccess,
            error: BlogView.AjaxFailure
        });
    },
    AjaxSuccess: function (data) {

        switch (BlogView.config.ajaxCallMode) {
            case 1:
                if (data.d.length > 0) {

                    BlogView.BindPost(data);
                }
                break;
            case 2:

                break;

            case 3:
                if (data.d.length > 0) {
                 
                    BlogView.BindComment(data);
                    var postid = $('#divPostID').attr('value');
                    $('#DivCommentView_' + postid).show();
                    $('.DivCommentView').scrollTop(0);

                }
                else {

                    alert('No Comments to Display !!!');
                    BlogView.HideAll();
                }
                break;

            case 4:
                if (data.d.length > 0) {

                    BlogView.BindPostByTag(data);
                }
                break;

            case 5:
                if (data.d.length > 0) {
                    BlogView.BindPostByDate(data);

                }
        }
    },

    PostComment: function (postID) {
        var IsApproved = "";
        var Author = SageFrameUserName;

        if (Author == "superuser")
            IsApproved = '1';
        else
            IsApproved = '0';
        this.config.method = "PostComment";
        this.config.data = JSON2.stringify({
            PostID: postID,
            Comment: $('#txtComment_' + postID).val(),
            Email: $('#txtEmail_' + postID).val(),
            IsApproved: IsApproved,
            UserName: $('#txtUserName_' + postID).val(),
            User: Author,
            PostURL: postURL,
            secureToken: secureToken,
            SageFrameUserName: SageFrameUserName,
            userModuleID: userModuleID,
            PortalID: portalID

        });
        this.config.url = this.config.baseURL + this.config.method;
        this.config.ajaxCallMode = 2;
        this.AjaxCall(this.config);
    },
    AjaxFailure: function () { },
    LoadBlogList: function () {
        BlogView.config.method = "SmartBlogViewPost";
        BlogView.config.data = JSON.stringify({ pageNo: current, range: range, PassURL: passURL, secureToken: secureToken, SageFrameUserName: SageFrameUserName, userModuleID: userModuleID, PortalID: portalID });
        BlogView.config.url = BlogView.config.baseURL + BlogView.config.method;
        BlogView.config.ajaxCallMode = 1;
        BlogView.AjaxCall(BlogView.config);

    },
    LoadBlogListByTag: function (tag) {
        BlogView.config.method = "SmartBlogGetPostByTag";
        BlogView.config.data = JSON.stringify({ Tag: tag, offset: Offset, PassURL: passURL });
        BlogView.config.url = BlogView.config.baseURL + BlogView.config.method;
        BlogView.config.ajaxCallMode = 4;
        BlogView.AjaxCall(BlogView.config);

    },
    LoadBlogListByDate: function ($postDate, $postMonth) {
        BlogView.config.method = "SmartBlogGetPostByDate";
        BlogView.config.data = JSON.stringify({ postDate: $postDate, postMonth: $postMonth, offSet: Offset, PassURL: passURL });
        BlogView.config.url = BlogView.config.baseURL + BlogView.config.method;
        BlogView.config.ajaxCallMode = 5;

        BlogView.AjaxCall(BlogView.config);
    },
    BindPost: function (data) {
        var bloghtml = "";
        $("#DivPostView").show();
        $("#DivPostView").append(data.d);
    },

    BindPostByTag: function (data) {
        var bloghtml = "";
        $("#divPostViewByTag").append(data.d);
        totalBlog = $('#divTotal span').text();
        BlogView.BindCommentWithScroll();
    },



    LoadCommentByPost: function (postid) {

        BlogView.config.method = "GetPostCommentByPostID";

        BlogView.config.data = JSON.stringify({ PostID: postid, Mode: 'V', pageNo: commentpage, range: range });

        BlogView.config.url = BlogView.config.baseURL + BlogView.config.method;
        BlogView.config.ajaxCallMode = 3;
        BlogView.AjaxCall(BlogView.config);


    },

    BindComment: function (data) {
        var bloghtml = "";
        $(".DivCommentView").append(data.d);
        BlogView.BindCommentWithScroll();


    },

    BindPostByDate: function (data) {

        var bloghtml = "";
        $('#divPostViewByTag').show();
        $("#divPostViewByTag").append(data.d);

    },

    BindCommentWithScroll: function () {
        $('.DivCommentView').on('scroll', function () {
  
            var total = commentOffset * range + range;
            var outerHeight = $(this)[0].scrollHeight;


            var iScrollHeight = $(this).scrollTop();

            var iHeight = $(this).innerHeight();

            if (iHeight + iScrollHeight + (50 * commentOffset) >= outerHeight) {

                if (total < totalComment) {

                    commentOffset = commentOffset + 1;
                    commentpage = commentpage + 1;
                    var loading = document.getElementById('loadingDiv');


                    loading.style.display = '';
                    var postViewID = $(this).prop('id').replace("DivCommentView_", "");


                    LoadMoreComment(postViewID);
                }
            }
        });
    }

};

$(function () {
    $(window).scroll(function () {

        var total = Offset * range + range;
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {

            if (total < totalBlog) {
                Offset = Offset + 1;
                current = current + 1;
                var loading = document.getElementById('loadingDiv');
                if (loading.style.display == '')
                    return; //already loading
                loading.style.display = '';

                LoadCallback();
            }
        }

    });

    BlogView.BindCommentWithScroll();

    BlogView.Init();
});

function LoadMoreElements() {
    //Do a server callback to load
    //more elements
    //alert('hi');
    //setTimeout(LoadCallback(), 350);
    LoadCallback();
}

function LoadMoreComment(postViewID) {

    var loading = document.getElementById('loadingDiv');
    loading.style.display = 'none';
    BlogView.LoadCommentByPost(postViewID);

}


function LoadCallback() {
    var loading = document.getElementById('loadingDiv');
    loading.style.display = 'none';
    if (document.location.search.length) {
        //alert(document.location.search);
        // query string exists

        var querystring = document.location.search.split('=');


        var queryname = $.trim(querystring[0].replace('?', ''));
        if (querystring[1].match('%20')) {
            querystring[1] = $.trim(querystring[1].replace('%20', ' '));
        }



        var queryValue = querystring[1];
        if (queryname == 'date') {

            var querystring_Full = document.location.search.split('&');
            var querystring_I = querystring_Full[0].split('=');
            var querystring_II = querystring_Full[1].split('=');
            var queryname_II = querystring_II[0];
            var queryValue_II = querystring_II[1];
            var queryValue_I = querystring_I[1];
            if (queryname_II == 'month') {
                $("#divBlogs").show();
                BlogView.LoadBlogListByDate(queryValue_I, queryValue_II);
            }
        }

        else if (queryname == 'Tag') {

            $("#divBlogs").show();
            $("#divPostViewByTag").show();
            $("#DivPostView").hide();
            $('#divTotal span').remove();

            BlogView.LoadBlogListByTag(queryValue);
        }
        else {
            $("#divDetails").show();
            $("#divBlogs").hide();
        }
    } else {
        // no query string exists
        $("#divDetails").hide();
        $("#divBlogs").show();
        BlogView.LoadBlogList();
    }

    var blogs = $('div.sfNewArticle');
    $.each(blogs, function () {
        if ($.trim($(this).find('li.sfTag').html()) == "" || $.trim($(this).find('li.sfTag').html()) == "null") {
            $(this).find('li.sfTag').hide();
        }
        if ($.trim($(this).find('li.sfCateogory').html()) == "" || $.trim($(this).find('li.sfCateogory').html()) == "null") {
            $(this).find('li.sfCateogory').hide();
        }
        //        if ($.trim($(this).find('p a img').prop("src").indexOf("noArticle")) > -1) {
        //            $(this).find("p img").remove();
        //        }
    });
}
