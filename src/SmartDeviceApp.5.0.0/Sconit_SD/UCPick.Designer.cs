﻿namespace com.Sconit.SmartDevice
{
    partial class UCPick
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblBarCode = new System.Windows.Forms.Label();
            this.tbBarCode = new System.Windows.Forms.TextBox();
            this.btnOrder = new System.Windows.Forms.Button();
            this.dgPickTask = new System.Windows.Forms.DataGrid();
            this.lblMessage = new System.Windows.Forms.Label();
            this.btnBack = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblBarCode
            // 
            this.lblBarCode.Location = new System.Drawing.Point(3, 1);
            this.lblBarCode.Name = "lblBarCode";
            this.lblBarCode.Size = new System.Drawing.Size(100, 20);
            this.lblBarCode.Text = "条码:";
            // 
            // tbBarCode
            // 
            this.tbBarCode.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tbBarCode.Location = new System.Drawing.Point(42, 0);
            this.tbBarCode.MaxLength = 50;
            this.tbBarCode.Name = "tbBarCode";
            this.tbBarCode.Size = new System.Drawing.Size(151, 23);
            this.tbBarCode.TabIndex = 15;
            this.tbBarCode.KeyUp += new System.Windows.Forms.KeyEventHandler(this.tbBarCode_KeyUp);
            // 
            // btnOrder
            // 
            this.btnOrder.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOrder.Location = new System.Drawing.Point(197, 1);
            this.btnOrder.Name = "btnOrder";
            this.btnOrder.Size = new System.Drawing.Size(40, 20);
            this.btnOrder.TabIndex = 16;
            this.btnOrder.Text = "拣货";
            this.btnOrder.Click += new System.EventHandler(this.btnOrder_Click);
            this.btnOrder.KeyUp += new System.Windows.Forms.KeyEventHandler(this.tbBarCode_KeyUp);
            // 
            // dgPickTask
            // 
            this.dgPickTask.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.dgPickTask.Location = new System.Drawing.Point(3, 45);
            this.dgPickTask.Name = "dgPickTask";
            this.dgPickTask.RowHeadersVisible = false;
            this.dgPickTask.Size = new System.Drawing.Size(234, 246);
            this.dgPickTask.TabIndex = 17;
            // 
            // lblMessage
            // 
            this.lblMessage.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Regular);
            this.lblMessage.ForeColor = System.Drawing.Color.Red;
            this.lblMessage.Location = new System.Drawing.Point(3, 26);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(234, 16);
            this.lblMessage.Text = "123456789012345678901234567890";
            // 
            // btnBack
            // 
            this.btnBack.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnBack.Location = new System.Drawing.Point(197, 23);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(40, 20);
            this.btnBack.TabIndex = 21;
            this.btnBack.Text = "返回";
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // UCPick
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.Controls.Add(this.btnBack);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.dgPickTask);
            this.Controls.Add(this.btnOrder);
            this.Controls.Add(this.tbBarCode);
            this.Controls.Add(this.lblBarCode);
            this.Name = "UCPick";
            this.Size = new System.Drawing.Size(240, 320);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblBarCode;
        public System.Windows.Forms.TextBox tbBarCode;
        private System.Windows.Forms.Button btnOrder;
        private System.Windows.Forms.DataGrid dgPickTask;
        private System.Windows.Forms.Label lblMessage;
        private System.Windows.Forms.Button btnBack;
    }
}
