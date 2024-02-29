<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="1" style="background-color:lightcoral" align="center" >
                
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="txtname" runat="server" Width="150px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:TextBox ID="txtemail" runat="server" Width="150px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><asp:TextBox ID="txtcity" runat="server" Width="150px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><asp:TextBox ID="txtsalary" runat="server" Width="150px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btninsert" runat="server" Text="Insert" OnClick="btninsert_Click" Height="30px" BackColor="#0066cc" Font-Size="Large" /></td>
                </tr>

                <tr>
                    <td>
                        <asp:GridView ID="grdview" runat="server" AutoGenerateColumns="false" OnRowCommand="grdview_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="student Id">
                                <ItemTemplate>
                                    <%#Eval("id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="student Name">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="student Email">
                                    <ItemTemplate>
                                        <%#Eval("email") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="student City">
                                    <ItemTemplate>
                                        <%#Eval("city") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <%#Eval("salary") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="P" CommandArgument=' <%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="Q" CommandArgument=' <%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
