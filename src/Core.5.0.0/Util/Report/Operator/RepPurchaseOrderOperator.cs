﻿namespace com.Sconit.Utility.Report.Operator
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using com.Sconit.Entity.ORD;
    using com.Sconit.Entity;
    using com.Sconit.PrintModel.ORD;

    public class RepPurchaseOrderOperator : RepTemplate1
    {
        public RepPurchaseOrderOperator()
        {
            //明细部分的行数
            this.pageDetailRowCount = 35;
            //列数   1起始
            this.columnCount = 12;
            //报表头的行数  1起始
            this.headRowCount = 15;
            //报表尾的行数  1起始
            this.bottomRowCount = 2;
        }

        /**
         * 填充报表
         * 
         * Param list [0]OrderHead
         * Param list [0]IList<OrderDetail>           
         */

        protected override bool FillValuesImpl(String templateFileName, IList<object> list)
        {
            try
            {
                if (list == null || list.Count < 2) return false;

                PrintOrderMaster orderHead = (PrintOrderMaster)(list[0]);
                IList<PrintOrderDetail> orderDetails = (IList<PrintOrderDetail>)(list[1]);

                orderDetails = orderDetails.OrderBy(o => o.Sequence).ThenBy(o => o.Item).ToList();

                if (orderHead == null
                    || orderDetails == null || orderDetails.Count == 0)
                {
                    return false;
                }

                this.barCodeFontName = this.GetBarcodeFontName(2, 8);
                this.CopyPage(orderDetails.Count);

                this.FillHead(orderHead);


                int pageIndex = 1;
                int rowIndex = 0;
                int rowTotal = 0;
                foreach (PrintOrderDetail orderDetail in orderDetails)
                {
                    // No.	
                    this.SetRowCell(pageIndex, rowIndex, 0, "" + orderDetail.Sequence);

                    //零件号 Item Code
                    this.SetRowCell(pageIndex, rowIndex, 1, orderDetail.Item);

                    //参考号 Ref No.
                    //this.SetRowCell(pageIndex, rowIndex, 2, orderDetail.ReferenceItemCode);

                    //描述Description
                    this.SetRowCell(pageIndex, rowIndex, 3, orderDetail.ItemDescription);

                    //单位Unit
                    this.SetRowCell(pageIndex, rowIndex, 4, orderDetail.Uom);

                    //单包装UC
                    this.SetRowCell(pageIndex, rowIndex, 5, orderDetail.UnitCount.ToString("0.####"));

                    //需求 Request	包装
                    //int UCs = (int)Math.Ceiling(orderDetail.OrderedQty / orderDetail.UnitCount);
                    //this.SetRowCell(pageIndex, rowIndex, 6, UCs.ToString());

                    //需求 Request	零件数
                    this.SetRowCell(pageIndex, rowIndex, 6, orderDetail.OrderedQty.ToString("0.####"));

                    //单价
                    //decimal unitPrice = orderDetail.UnitPrice.HasValue ? orderDetail.UnitPrice.Value : 0M;
                    //string up = unitPrice.ToString("0.####");
                    //if (orderDetail.IsProvisionalEstimate)
                    //{
                    //    up = "*" + up;
                    //}

                    //this.SetRowCell(pageIndex, rowIndex, 7, up);
                    ////金额
                    //this.SetRowCell(pageIndex, rowIndex, 8, (orderDetail.OrderedQty * unitPrice).ToString("0.####"));

                    ////发货数
                    //this.SetRowCell(pageIndex, rowIndex, 9,orderDetail.ShippedQty.ToString("0.####"));

                    ////实收 Received	零件数
                    //this.SetRowCell(pageIndex, rowIndex, 10,  orderDetail.ReceivedQty.ToString("0.####"));

                    //批号/备注
                    //this.SetRowCell(pageIndex, rowIndex, 11, orderDetail.Remark);

                    if (this.isPageBottom(rowIndex, rowTotal))//页的最后一行
                    {
                        pageIndex++;
                        rowIndex = 0;
                    }
                    else
                    {
                        rowIndex++;
                    }
                    rowTotal++;
                }

                this.sheet.DisplayGridlines = false;
                this.sheet.IsPrintGridlines = false;
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }


        /*
         * 填充报表头
         * 
         * Param repack 报验单头对象
         */
        private void FillHead(PrintOrderMaster orderHead)
        {
            //订单号:
            string orderCode = Utility.BarcodeHelper.GetBarcodeStr(orderHead.OrderNo, this.barCodeFontName);
            this.SetRowCell(2, 8, orderCode);
            //Order No.:
            this.SetRowCell(3, 8, orderHead.OrderNo);
            if (orderHead.SubType ==(short)com.Sconit.CodeMaster.OrderSubType.Return)
            {
                this.SetRowCell(0, 3, "退货");
            }
            if (orderHead.Priority == (short)com.Sconit.CodeMaster.OrderPriority.Normal)
            {
                this.SetRowCell(4, 5, "");
            }
            else
            {
                this.SetRowCell(3, 5, "");
            }

            //制单时间 Create Time:
            this.SetRowCell(4, 9, orderHead.CreateDate.ToString("yyyy-MM-dd HH:mm:ss"));

            //供应商代码 Supplier Code:	
            this.SetRowCell(6, 3, orderHead.PartyFrom);
            //开始时间 Start Time:
            this.SetRowCell(6, 8, orderHead.StartTime.ToString("yyyy-MM-dd HH:mm:ss"));


            //供应商名称 Supplier Name:		
            this.SetRowCell(7, 3, orderHead.PartyFromName);
            //窗口时间 Window Time:
            this.SetRowCell(7, 8, orderHead.WindowTime.ToString("yyyy-MM-dd HH:mm:ss"));

            //供应商地址 Address:	
            this.SetRowCell(8, 3, orderHead.ShipFromAddr);
            //货币:
            this.SetRowCell(8, 8, orderHead.Currency);

            //供应商联系人 Contact:	
            this.SetRowCell(9, 3, orderHead.ShipFromContact);
            //物流协调员 Follow Up:
            this.SetRowCell(9, 8, orderHead.ShipToContact);

            //供应商电话 Telephone:		
            this.SetRowCell(10, 3, orderHead.ShipFromTel);
            //YFV电话 Telephone:
            this.SetRowCell(10, 8, orderHead.ShipToTel);

            //供应商传真 Fax:	
            this.SetRowCell(11, 3, orderHead.ShipFromFax);
            //YFV传真 Fax:
            this.SetRowCell(11, 8, orderHead.ShipToFax);

            //系统号 SysCode:
            //this.SetRowCell(++rowNum, 3, "");
            //版本号 Version:
            //this.SetRowCell(rowNum, 8, "");
        }

        /**
           * 需要拷贝的数据与合并单元格操作
           * 
           * Param pageIndex 页号
           */
        public override void CopyPageValues(int pageIndex)
        {
            this.CopyCell(pageIndex, 50, 1, "B51");
            this.CopyCell(pageIndex, 50, 5, "F51");
            this.CopyCell(pageIndex, 50, 9, "J51");
            this.CopyCell(pageIndex, 51, 0, "A52");
        }
    }
}
