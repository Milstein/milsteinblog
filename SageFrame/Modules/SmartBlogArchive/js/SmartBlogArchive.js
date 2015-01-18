var $archiveManagement;

$(function () {
    $archiveManagement = {
        config: {
            isPostBack: false,
            async: false,
            cache: false,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            data: '{}',
            dataType: 'json',
            baseURL: ArchiveServicePath + "Services/SmartBlogArchiveService.asmx/",
            method: "",
            url: "",
            ajaxCallMode: 0,
            ArchiveURL: '<%=ArchiveURL %>',
            MonthlyArchiveUrlI: '<%=MonthlyArchiveUrlI %>',
            MonthlyArchiveUrlII: '<%=MonthlyArchiveUrlII %>'
        },
        ajaxCall: function (config) {
            $.ajax({
                type: $archiveManagement.config.type,
                contentType: $archiveManagement.config.contentType,
                cache: $archiveManagement.config.cache,
                async: $archiveManagement.config.async,
                url: $archiveManagement.config.url,
                data: $archiveManagement.config.data,
                dataType: $archiveManagement.config.dataType,
                success: $archiveManagement.ajaxSuccess,
                error: $archiveManagement.ajaxFailure
            });
        },
        LoadDateArchive: function () {
            this.config.url = this.config.baseURL + "SmartBlogGetArchive";
            this.config.data = JSON2.stringify({});
            this.config.ajaxCallMode = 1;
            this.ajaxCall(this.config);
        },
        ShowArchiveList: function (msg) {
           
            var $year = 0;
            var $openlist = 0;
            var $archivehtml = '';
            var $month = '';
            $.each(msg.d, function (index, Data) {
                if ($year == Data.PostArchive) {
                    if ($month != Data.postArchiveInMonth) {
                        $archivehtml += '<br />';
                        $archivehtml += '<li><a href="' + MonthlyArchiveUrlI + Data.PostArchive + MonthlyArchiveUrlII + Data.postArchiveInMonth + '">' + Data.postArchiveInMonth + " " + "(" + (Data.monthlyPosts) + ")" + '</a></li>';
                    }
                }
                else {
                    if ($openlist != 0) {
                        $archivehtml += '</ul>';
                        $archivehtml += '</li>';
                        $archivehtml += '</div>';
                    }
                    $openlist = 0;
                    $archivehtml += '<div><li class="years">';
                    $archivehtml += '<strong>' + Data.PostArchive + " " + "(" + Data.Posts + ")" + '</strong>';

                    $archivehtml += '<ul class="months">';
                    $archivehtml += '<li><a href="' + MonthlyArchiveUrlI + Data.PostArchive + MonthlyArchiveUrlII + Data.postArchiveInMonth + '">' + Data.postArchiveInMonth + " " + "(" + Data.monthlyPosts + ")" + '</a></li>';
                    $openlist++;
                }
                $year = Data.PostArchive;
                $month = Data.postArchiveInMonth;
            });

            $("#ulblogDate").html($archivehtml);
        },
        ajaxSuccess: function (msg) {
            switch ($archiveManagement.config.ajaxCallMode) {
                case 0:
                    break;
                case 1:
                    $archiveManagement.ShowArchiveList(msg);
                    break;
            }
        },
        hideMonth: function () {
            $('.months').slideUp();
        },
        expandMonth: function () {
            $('.years').on('click', function () {
                $(this).find('.months').slideToggle();
            });
        },
        ajaxFailure: function () {
            switch ($archiveManagement.config.ajaxCallMode) {
                case 0:
                    break;
                case 1:
                    alert('Error in loading archive list');
                    break;
            }
        },
        init: function (config) {
            $archiveManagement.LoadDateArchive();
            $archiveManagement.hideMonth();
            $archiveManagement.expandMonth();
        }
    };
    $archiveManagement.init();
});