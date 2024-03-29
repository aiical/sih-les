﻿using System;
using System.Collections.Generic;
using com.Sconit.Entity.INV;
using com.Sconit.Entity.ORD;
using com.Sconit.Entity.SCM;
using com.Sconit.Entity.VIEW;
using com.Sconit.Entity.MD;
using com.Sconit.Entity.Exception;

namespace com.Sconit.Service
{
    public interface IHuMgr
    {
        IList<Hu> CreateHu(ReceiptMaster receiptMaster, ReceiptDetail receiptDetail, DateTime effectiveDate);

        IList<Hu> CreateHu(FlowMaster flowMaster, IList<FlowDetail> flowDetailList);

        IList<Hu> CreateHu(OrderMaster orderMaster, IList<OrderDetail> orderDetailList);

        IList<Hu> CreateHu(IpMaster ipMaster, IList<IpDetail> ipDetailList);

        IList<Hu> CreateHu(PickTask pickTask, string lotNo);

        IList<Hu> CreateHu(Item item);

        Hu CreateHu(Item item, string huId);

        Hu CloneHu(Hu oldHu, decimal qty);

        IList<Hu> LoadHus(string[] huIdList);

        IList<Hu> LoadHus(IList<string> huIdList);

        HuStatus GetHuStatus(string huId);

        IList<HuStatus> GetHuStatus(IList<string> huIdList);

        IList<Hu> CreateHu(OrderDetail orderDetail, Boolean isRepack, string manufactureParty, string lotNo, decimal totalQty, decimal unitQty, decimal huQty, string oldHus, string binTo, Boolean isRepackForOrder);

        
    }
}
