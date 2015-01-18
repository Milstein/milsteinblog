<%@ Control Language="C#" ClassName="Unsubsribe" %>
<div id='sfOuterWrapper' class="sfCurve" runat="server">
    <div id='sfHeaders' class='sfOuterwrapper clearfix header'>
        <div class='sfInnerwrapper clearfix'>
            <div class='sfMoreblocks clearfix'>
                <div id="sfLogo" class='sfCol_30'>
                    <div class='sfWrapper'>
                        <asp:PlaceHolder ID='pch_logo' runat='server'></asp:PlaceHolder>
                    </div>
                </div>
                <div id="sfSearch" class='sfCol_70'>
                    <div class='sfWrapper'>
                        <asp:PlaceHolder ID='pch_search' runat='server'></asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id='sfNavigation' class='sfOuterwrapper clearfix'>
        <div class='sfInnerwrapper clearfix'>
            <div class='sfMoreblocks clearfix'>
                <div class='sfWrapper'>
                    <asp:PlaceHolder ID='pch_navigation' runat='server'></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
    <div id='sfMessage' class='sfOuterwrapper clearfix'>
        <div class='sfInnerwrapper clearfix'>
            <div class='sfMoreblocks clearfix'>
                <div class='sfWrapper'>
                    <asp:PlaceHolder ID='pch_message' runat='server'></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
    <div id='sfBodyContent' class='sfOuterwrapper sfCurve clearfix'>
        <div class='sfInnerwrapper clearfix'>
            <div class='clearfix'>
                <div id='sfMainWrapper' class='sfCol_100'>
                    <div class='sfContainer sfCurve'>
                        <div class='sfMainContent sfCurve'>
                            <div class='sfMiddlemaincurrent '>
                                <div class='sfMoreblocks clearfix'>
                                    <div class='sfWrapper'>
                                        <asp:PlaceHolder ID='pch_middlemaincurrent' runat='server'></asp:PlaceHolder>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id='sfCopyright' class='sfOuterwrapper clearfix'>
        <div class='sfInnerwrapper clearfix'>
            <div class='sfMoreblocks clearfix'>
                <div class='sfWrapper'>
                    <asp:PlaceHolder ID='pch_copyright' runat='server'></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
</div>
