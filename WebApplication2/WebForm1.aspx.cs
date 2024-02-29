using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-J2GUTE4L\\VINODPC;initial catalog=db_3222;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            display();
        }

        public void display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from StudentReg", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grdview.DataSource = dt;
            grdview.DataBind();
        }
        protected void grdview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "P")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from StudentReg where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                display();
            }
            else if (e.CommandName == "Q")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from StudentReg where id='" + e.CommandArgument + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtname.Text = dt.Rows[0]["email"].ToString();
                txtname.Text = dt.Rows[0]["city"].ToString();
                txtname.Text = dt.Rows[0]["salary"].ToString();
                btninsert.Text = "Update";
                ViewState["xyz"] = e.CommandArgument;

            }
        }
    

        protected void btninsert_Click(object sender, EventArgs e)
        {
            if (btninsert.Text == "Insert")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into StudentReg(name,email,city,salary)values('" + txtname.Text + "','" + txtemail.Text + "','" + txtcity.Text + "','" + txtsalary.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                display();

            }
            else if (btninsert.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update StudentReg set name='" + txtname.Text + "',email='" + txtemail.Text + "',city='" + txtcity.Text + "',salary='" + txtsalary.Text + "' where id='" + ViewState["xyz"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                display();
            }
            txtname.Text = "";
            txtemail.Text = "";
            txtcity.Text = "";
            txtsalary.Text = "";
            btninsert.Text = "Insert";


        }
    }
    }
