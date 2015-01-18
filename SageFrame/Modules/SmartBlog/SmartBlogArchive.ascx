<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBlogArchive.ascx.cs" Inherits="Modules_SmartBlog_SmartBlogArchive" %>
<div class='clsLatestPost sidebarbox'>
        <h2>
            Archives</h2>
        <ul>
            <asp:Repeater ID="rptArchive" runat="server" 
                onitemcommand="rptrArchive_ItemCommand" 
                onitemdatabound="rptrArchive_ItemDataBound">
                <ItemTemplate>
                  <asp:HiddenField ID="hdnArchiveDate" runat="server" Value='<%#Eval("PostArchive") %>' />
                    <li>
                        <asp:HyperLink  ID="lnkArchives" NavigateUrl="" runat="server"  ><%#Eval("PostArchive")%> </asp:HyperLink>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>