$(function () {
    var data = [];

    $.ajax(
                    {
                        type: 'POST',
                        url: SageFrameAppPath + '/Modules/SmartBlog/SmartBlogService/SmartBlogService.asmx/GetPostTag',
                        data: '{}',
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            debugger;
                            if (msg.d != "") {
                                $('#tagCloud').html('');
                                $('#tagCloud').html('<h2>Tag Cloud</h2>');
                                var TagCloud = msg.d;
                                $.each(TagCloud, function (indx, item) {


                                    var randomVal = Math.floor(Math.random() * 10);
                                    randomVal = randomVal < 3 ? randomVal + 2 : randomVal;

                                    var Tag = item.TagName;
                                    var TagUrl = item.TagUrl;
                                    if (Tag != null && Tag != "") {
                                        data.push({ tag: Tag, freq: randomVal, tagUrl: TagUrl });

                                    }
                                });
                            }

                        },
                        error: function () {
                            //alert('Some Thing Wrong P :)');
                        }
                    });



    //create list for tag links
    $("<ul>").attr("id", "tagList").appendTo("#tagCloud");

    //create tags
    $.each(data, function (i, val) {
        //Get Current URl
        var pathname = window.location.pathname + "?Tag=" + val.tagUrl;

        //create item
        var li = $("<li>");

        //create link
        $("<a>").text(val.tag).attr({ title: "See all pages tagged with " + val.tag, href: pathname }).appendTo(li);

        //set tag size
        li.children().css("fontSize", (val.freq / 10 < 1) ? val.freq / 10 + 1 + "em" : (val.freq / 10 > 2) ? "2em" : val.freq / 10 + "em");

        //add to list
        li.appendTo("#tagList");

    });



});
