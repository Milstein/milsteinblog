<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBlogTopPost.ascx.cs" Inherits="Modules_SmartBlog_SmartBlogTopPost" %>
<div class='sfTopPosts  sfSimpleBox'>
        <h2>
            Top Post</h2>
        <ul>
            <asp:Repeater ID="rptTopPost" runat="server" 
                onitemcommand="rptTopPost_ItemCommand" 
                onitemdatabound="rptTopPost_ItemDataBound">
               
                <ItemTemplate>
                  <asp:HiddenField ID="hdnTopPost" runat="server" Value='<%#Eval("PostID") %>' />
                    <li>
                    <span><%#Container.ItemIndex+1%></span>
                        <asp:HyperLink  ID="lnkTopPost" NavigateUrl="" runat="server"  ><%#Eval("PostTitle")%> </asp:HyperLink>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
