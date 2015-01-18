(function($) {
    $.createSmartBlogSetting = function(p) {
        var SmartBlogSetting = {
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
                PostID: "",
                PortalID: SageFramePortalID,
                UserName: SageFrameUserName
            },
            init: function() {
                $("#btnSaveSetting").click(function() {
                    SmartBlogSetting.SaveSetting();
                });
            },
            SaveSetting: function() {
                this.config.method = "SaveSmartBlogSetting";
                this.config.data = this.config.data = JSON2.stringify({
                    SettingKey: "ContinueReadingPage",
                    SettingValue: $("#txtReadMore").val(),
                    PortalID: SmartBlogSetting.config.PortalID,
                    UpdatedBy: SmartBlogSetting.config.UserName,
                    AddedBy: SmartBlogSetting.config.UserName
                });
                this.config.url = this.config.baseURL + this.config.method;
                this.config.ajaxCallMode = 0;
                this.ajaxCall(this.config);
            },
            SettingList: function() {
                var _SettingValue = "";
                var SettingKeys = ["ContinueReadingPage"];
                var SettingValues = [$("#txtReadMore").val()];
                var param = {
                    lstSettings: []
                };
                $.each(SettingKeys, function(index, item) {

                    _SettingValue = SettingValues[index];
                    param.lstSettings.push({
                        "SettingKey": item,
                        "SettingValue": _SettingValue,
                        "PortalID": SmartBlogSetting.config.PortalID,
                        "UpdatedBy": SmartBlogSetting.config.UserName,
                        "AddedBy": SmartBlogSetting.config.UserName
                    });

                });
                return JSON2.stringify(param);
            },

            ajaxSuccess: function(data) {
                switch (SmartBlogSetting.config.ajaxCallMode) {
                    case 0:
                        break;

                }
            },

            ajaxFailure: function() {
                alert('fail');
            },
            ajaxCall: function(config) {
                $.ajax({
                    type: 'POST',
                    async: false,
                    url: SmartBlogSetting.config.url,
                    data: SmartBlogSetting.config.data,
                    dataType: SmartBlogSetting.config.dataType,
                    contentType: SmartBlogSetting.config.contentType,
                    success: SmartBlogSetting.ajaxSuccess,
                    error: SmartBlogSetting.ajaxFailure
                });
            }

        };
        SmartBlogSetting.init();
    };
    $.fn.SageSmartBlogSetting = function(p) {
        $.createSmartBlogSetting(p);
    };
})(jQuery);
 
 