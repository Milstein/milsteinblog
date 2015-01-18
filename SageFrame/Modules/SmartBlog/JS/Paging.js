var tempPageNo = 0;
var chooseCase = 0;
var changepaging =0;
var fetchOnce;
(function ($) {
    $.Page = function (Setting) {
        var Options = $.extend({
            Type: 'Table',
            divID: 'GenaralizedPaging',
            PagingID: 'divPaging',
            Columns: ['CodeID', 'Tittle'],
            CountUrl: 'GetCount',
            CountData: {},
            DataUrl: 'GetSnippetList',
            DataParams: {},
            PageNo: 7,
            range: 10,
            Myheader: '',
            Wrapper: 'Li',
            Extra: '',
            AutoWrap: true,
            Format: ['<div><div>', 'CodeID', '</div><div>', 'Tittle', '</div></div>'],
            OnComplete: function (data) {
            }
        }, Setting);
        pa = {
            config: {
                isPostBack: false,
                async: false,
                cache: false,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                data: '{}',
                dataType: 'json',
                baseURL: SageFrameAppPath + '/Modules/SmartBlog/SmartBlogService/SmartBlogService.asmx/',
                method: "",
                url: "",
                ajaxCallMode: 0
            },
            ajaxSuccess: function (msg) {
                switch (pa.config.ajaxCallMode) {

                    case 1:                        
                        break;

                    case 2:                        
		    	        var TotalRow = 0;
                        fetchOnce = msg.d.length;
                        $.each(msg.d, function (index, value) {
                            if (index == 0 && changepaging ==0) {
                                TotalRow = value.Count;
                                $('#' + Options.PagingID).html('');
                                pa.Paging(TotalRow, Options.DataParams.range);
                            }
                        });		    
                        if (Options.AutoWrap == true) {
                            if (Options.Type.toLowerCase() == 'table') {
                                if (Options.Columns.length > 0) {
                                    var Table = '<table width= "100%">';
                                    var trh = '<tr>';
                                    var th = '';
                                    $.each(Options.Columns, function (index, value) {
                                        th += '<td>' + value + '</td>';
                                    });
                                    trh += th;
                                    trh += '</tr>';
                                    $.each(msg.d, function (index, data) {
                                        var tr = '';
                                        tr += '<tr>';
                                        var td = '';
                                        $.each(Options.Columns, function (count, value) {
                                            $.each(data, function (dataindex, datavalue) {
                                                if (dataindex == value) {
                                                    td += '<td>' + datavalue + '</td>';
                                                }
                                            });
                                        });
                                        tr += td;
                                        tr += '</tr>';
                                        trh += tr;
                                    });
                                    Table += trh;
                                    table += '</table>';
                                    $('#tblPost').html(Table);
                                }
                            }
                            else {
                                var div = '';
                                if (msg.d.length == 0) {
                                    $('#tblPost').html('<tr><td><p class="sfNote">No Posts Found</p></td></tr>');
                                    $('#btnApprovePost').hide();
                                    $('#' + Options.PagingID).html('');
                                }
                                else {
                                    div += Options.Myheader;
                                    $.each(msg.d, function (index, data) {
                                        div += '<' + Options.Wrapper + '>';
                                        $.each(Options.Format, function (count, value) {
                                            var test = 0;
                                            $.each(data, function (dataindex, datavalue) {
                                                if (dataindex == value) {
                                                    div += datavalue;
                                                    test = 1;
                                                    return false;
                                                }
                                            });
                                            if (test == 0) {
                                                div += value;
                                            }
                                        });
                                        div += '</' + Options.Wrapper + '>';
                                    });
                                    $('#tblPost').html(div);
                                    $('#tblPost').append(Options.Extra);
                                    $('#tblPost tr').each(function (index, value) {
                                        var styleClass = index % 2 == 0 ? "sfOdd" : "sfEven";
                                        $(this).addClass(styleClass);
                                    });
                                    $('#btnApprovePost').show();
                                }
                            }
                        }
                        else {
                            Options.OnComplete(msg);
                        }
                        break;
                }
            },
            ajaxFailure: function (data) {
            // alert('Web service call not Ok!'); 
            },
            ajaxCall: function (config) {
                $.ajax({
                    type: pa.config.type,
                    contentType: pa.config.contentType,
                    cache: pa.config.cache,
                    async: pa.config.async,
                    url: pa.config.url,
                    data: pa.config.data,
                    dataType: pa.config.dataType,
                    beforeSend: function () {
                        // $('#divAjaxLoading').show();
                    },
                    complete: function () {
                        //$('#divAjaxLoading').hide();
                    },
                    success: function (msg) {
                        pa.ajaxSuccess(msg);
                    },
                    error: function (msg) {
                        pa.ajaxFailure(msg);
                    }
                });
            },           
            GetList: function (click) {                
                Options.DataParams.pageNo = tempPageNo;
                //alert(tempPageNo);
                var PageNo =  Options.DataParams.pageNo;                
		        //Options.DataParams.pageNo = PageNo;
                pa.config.ajaxCallMode = 2;
                pa.config.method = Options.DataUrl;
                pa.config.url = pa.config.baseURL + pa.config.method;
                pa.config.data = JSON2.stringify($.merge(Options.DataParams, { pageNo: parseInt(PageNo) }));
                pa.ajaxCall(pa.config);
                switch (click) {
                    case 'First':
                        $('.Paging').each(function (index, value) {
                            if ($(this).hasClass('click')) {
                                PageNo = $(this).text();
                            }
                        });
                        break;
                    case 'last':
                        $('.Paging').removeClass('click');
                        $('.Paging').last().addClass('click');
                        PageNo = $('.Paging').last().text();
                        break;
                }                
            },
            Paging: function (TotalRow, Range) {            
                var number_Of_Page = 0;
                var remainder = TotalRow % Range;
                if (remainder > 0)
                    number_Of_Page = (TotalRow - remainder) / Range + 1;
                else
                    number_Of_Page = TotalRow / Range;
                var noOfPage = parseInt(number_Of_Page);
                var atOnce = 8;
                var limitPerShow = 15;
                pa.PageList(chooseCase, noOfPage, atOnce, limitPerShow,tempPageNo);
            },
            PageList: function (CurrentCase, noOfPage, atOnce, limitPerShow, CurrentValue) {
                var p = '';                
                if (noOfPage < limitPerShow) {
                    if (noOfPage <= atOnce) {
                        for (var i = 0; i < noOfPage; i++) {
                            p += '<span class="Paging"> ' + (i + 1) + ' </span>';
                        }
                    }
                    else {
                        p += '<span id = "previous"> PREVIOUS </span>';
                        for (var i = 0; i < noOfPage; i++) {
                            p += '<span class="Paging">' + (i + 1) + '</span>';
                        }
                        p += '<span id = "next"> NEXT </span>';
                    }
                }
                else {
                    p += '<span id = "previous"> PREVIOUS </span>';
                    switch (CurrentCase) {
                    
                        case 0:
                            for (var i = 0; i < atOnce; i++) {
                                p += '<span class="Paging">' + (i + 1) + '</span>';
                            }
                            p += '<span class="gap">...</span>';
                            for (var i = 0; i < 2; i++) {
                                p += '<span class="Paging">' + (noOfPage - 1 + i) + '</span>';
                            }
                            break;
                        case 1:
                            for (var i = 0; i < 2; i++) {
                                p += '<span class="Paging">' + (i + 1) + '</span>';
                            }
                            p += '<span class="gap">...</span>';
                            for (var i = 0; i < atOnce; i++) {
                                p += '<span class="Paging">' + ((noOfPage - atOnce) + 1 + i) + '</span>';
                            }
                            break;
                        default:

                            for (var i = 0; i < 2; i++) {
                                p += '<span class="Paging">' + (i + 1) + '</span>';
                            }
                            p += '<span class="gap">...</span>';
                            var start = atOnce - 4;
                            var limit = 10;
                            if (noOfPage - CurrentValue == atOnce) {
                                start = CurrentCase - limit;
                                limit = start + 10;
                            }
                            for (var i = start; i < limit; i++) {
                                p += '<span class="Paging">' + i + '</span>';
                            }
                            p += '<span class="gap">...</span>';
                            for (var i = 0; i < 2; i++) {
                                p += '<span class="Paging">' + (noOfPage - 1 + i) + '</span>';
                            }
                            break;
                    }
                    p += '<span id = "next"> NEXT </span>';
                }
                $('#' + Options.PagingID).html(p);
                $('#next').unbind('click').bind('click', function () {
                    var tempval;
                    var me;
                    $('.Paging').each(function (index, value) {
                        if ($(this).hasClass('click')) {
                            me = $(this);
                            tempval = parseInt(me.text());
                        }
                    });
                    changepaging=0;
                    tempPageNo = tempval + 1;
                    if (me.next().hasClass('gap')) {
                        if (CurrentCase == 0) {
                            if (tempval == atOnce) {
                                //pa.PageList(tempval, noOfPage, atOnce, limitPerShow, (tempval + 1));
                                chooseCase = tempval;
                                pa.GetList('First');
                            }
                        }
                        else if (CurrentCase == 1) { }
                        else {
                            if ((noOfPage - atOnce) < tempval) {
                              //  pa.PageList(1, noOfPage, atOnce, limitPerShow, (tempval + 1));
                                chooseCase = 1;
                                pa.GetList('First');
                            }
                            else {
                                $('.Paging').each(function (index1, value) {
                                    var index = parseFloat($(this).text());
                                    index = index - 1;
                                    changepaging=tempPageNo;
                                    if (index == 0 || index == 1 || index == (noOfPage - 1) || index == (noOfPage - 2)) {
                                        //pa.PageList(tempval, noOfPage, atOnce, limitPerShow, (tempval + 1));
                                    }
                                    else {
                                        $(this).text(parseInt($(this).text()) + 1);
                                    }
                                });
                                pa.GetList('First');
                            }
                        }
                    }
                    else {
                        if (isNaN(me.next().text()) == false) {
                         changepaging = tempPageNo;
                            me.next().addClass('click');
                            me.removeClass('click');
                            pa.GetList('First');
                        }
                    }
                });
                $('#previous').unbind('click').bind('click', function () { 
                    var tempval;
                    var me;
                    changepaging=0;
                    $('.Paging').each(function (index, value) {
                        if ($(this).hasClass('click')) {
                            me = $(this);
                            tempval = parseInt(me.text());
                        }
                    });
                    tempPageNo = tempval - 1;
                    if (me.prev().hasClass('gap')) {
                        if (CurrentCase == 1) {
                            if (tempval == (noOfPage - atOnce + 1)) {
                              //  pa.PageList(tempval, noOfPage, atOnce, limitPerShow, (tempval - 1));
                                chooseCase = tempval;
                                pa.GetList('First');
                            }
                        }
                        else if (CurrentCase == 0) { }
                        else {
                            if ((atOnce + 1) > tempval) {
                             //   pa.PageList(0, noOfPage, atOnce, limitPerShow, (tempval - 1));
                                chooseCase = 0;
                                pa.GetList('First');
                            }
                            else {
                                $('.Paging').each(function (index1, value) {
                                    var index = parseFloat($(this).text());
                                    index = index - 1;
                                    changepaging=tempPageNo;
                                    if (index == 0 || index == 1 || index == (noOfPage - 1) || index == (noOfPage - 2)) {
                                    }
                                    else {
                                        $(this).text(parseInt($(this).text()) - 1);
                                    }
                                });
                                pa.GetList('First');
                            }

                        }
                    }
                    else {
                        if (isNaN(me.prev().text()) == false) {
                            changepaging = tempPageNo;
                            me.prev().addClass('click');
                            me.removeClass('click');
                            pa.GetList('First');
                        }
                    }
                });
                $('.Paging').unbind('click').bind('click', function () {
                    changepaging = 0;
                    if ($(this).attr('class') != "Paging click") {                    
                        var clickValue = parseInt($(this).text());
                        tempPageNo = clickValue;
                      //  myself =$('#'+ $(this).attr('class').replace('Paging','').trim());                         
                        if (clickValue <= atOnce) {                            
                            chooseCase = 0;
                            pa.GetList('First');
                        }
                        else if (clickValue > (noOfPage - atOnce) & clickValue <= noOfPage) {
                        //    pa.PageList(1, noOfPage, atOnce, limitPerShow, clickValue);
                            chooseCase = 1;
                            pa.GetList('First');
                        }
                        else {
                            chooseCase = tempPageNo;
                            changepaging= tempPageNo;
                            $('.Paging').removeClass('click');
                            $(this).addClass('click');
                            pa.GetList('First');
                        }
                    }
                });
                pa.ClassClick(chooseCase, CurrentValue);
                if (noOfPage == 1 && fetchOnce <= Options.DataParams.range) {
                    $('.Paging').hide();
                }
            },
            ClassClick: function (Current, CurrentValue) {
                $('.Paging').removeClass('click');
                if (Current == 0) {
                    if (CurrentValue == 0) {
                        $('.Paging').each(function (index, value) {
                            if (parseInt($(this).text()) == Options.PageNo) {
                                $(this).addClass('click');
                            }
                        });
                    }
                    else {
                        $('.Paging').each(function (index, value) {
                            if (parseInt($(this).text()) == (CurrentValue)) {
                                $(this).addClass('click');
                            }
                        });
                    }
                }
                else if (Current == 1) {
                    $('.Paging').each(function (index, value) {
                        if (parseInt($(this).text()) == CurrentValue) {
                            $(this).addClass('click');
                        }
                    });
                }
                else {
                    $('.Paging').each(function (index, value) {
                        if (parseInt($(this).text()) == CurrentValue) {
                            $(this).addClass('click');
                        }
                    });
                }
                //pa.GetList('First');
            },
            Pages: function (language) {
//                return pa.Count();
		            return pa.GetList('First');
            },
            init: function () {
                var PageNo = Options.PageNo;
                tempPageNo = PageNo;
                return pa.Pages();
            }
        };
        return pa.init();
    };
    $.fn.Paging = function (Setting) {
        return $.Page(Setting);
    };
} (jQuery));




    
