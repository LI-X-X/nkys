using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ManagementApp
{
    public partial class Form1 : Form
    {
        managementEntities db = new managementEntities();
        public Form1()
        {
            InitializeComponent();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DepartmentController departmentController = new DepartmentController();
            dataGridView1.DataSource = departmentController.GetDepartments(db);

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
