using System;
using com.Sconit.Entity.PRD;
using System.ComponentModel.DataAnnotations;
using com.Sconit.Entity.SYS;

namespace com.Sconit.Entity.ORD
{
    [Serializable]
    public partial class OrderBomDetail : EntityBase, IAuditable
    {
        #region O/R Mapping Properties

        public Int32 Id { get; set; }
        public string OrderNo { get; set; }
        public com.Sconit.CodeMaster.OrderType OrderType { get; set; }
        public com.Sconit.CodeMaster.OrderSubType OrderSubType { get; set; }
        [Display(Name = "OrderBomDetail_OrderDetailId", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public Int32 OrderDetailId { get; set; }
        public Int32 OrderDetailSequence { get; set; }
        public Int32 Sequence { get; set; }
        public string Bom { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 21)]
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_Item", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string Item { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 41)]
        [Display(Name = "OrderBomDetail_ReferenceItemCode", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ReferenceItemCode { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 31)]
        [Display(Name = "OrderBomDetail_ItemDescription", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ItemDescription { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 71)]
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_Uom", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string Uom { get; set; }  //Bom��λ
        public string BaseUom { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 81)]
        [Display(Name = "OrderBomDetail_ManufactureParty", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ManufactureParty { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 91)]
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_Operation", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public Int32 Operation { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 131)]
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_OpReference", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string OpReference { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 61)]
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_OrderedQty", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public Decimal OrderedQty { get; set; }
        public Decimal BackflushedQty { get; set; }
        public Decimal BackflushedRejectQty { get; set; }
        public Decimal BackflushedScrapQty { get; set; }
        public Decimal UnitQty { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 51)]
        [Display(Name = "OrderBomDetail_BomUnitQty", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public Decimal BomUnitQty { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 171)]
        [Display(Name = "OrderBomDetail_Location", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string Location { get; set; }
        public Boolean IsPrint { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_BackFlushMethod", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public com.Sconit.CodeMaster.BackFlushMethod BackFlushMethod { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessageResourceName = "Errors_Common_FieldRequired", ErrorMessageResourceType = typeof(Resources.ErrorMessage))]
        [Display(Name = "OrderBomDetail_FeedMethod", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public com.Sconit.CodeMaster.FeedMethod FeedMethod { get; set; }
        public Boolean IsScanHu { get; set; }
        
        [Display(Name = "OrderBomDetail_IsAutoFeed", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public Boolean IsAutoFeed { get; set; }

        public DateTime EstimateConsumeTime { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 181)]
        [Display(Name = "OrderBomDetail_ReserveNo", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ReserveNo { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 191)]
        [Display(Name = "OrderBomDetail_ReserveLine", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ReserveLine { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 101)]
        [Display(Name = "OrderBomDetail_ZOPWZ", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ZOPWZ { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 111)]
        [Display(Name = "OrderBomDetail_ZOPID", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ZOPID { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 121)]
        [Display(Name = "OrderBomDetail_ZOPDS", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string ZOPDS { get; set; }

        [Export(ExportName = "OrderBomDetail", ExportSeq = 11)]
        [Display(Name = "OrderBomDetail_AUFNR", ResourceType = typeof(Resources.ORD.OrderBomDetail))]
        public string AUFNR { get; set; }
        public string ICHARG { get; set; }
        public string BWART { get; set; }
        public Int32 CreateUserId { get; set; }
        public string CreateUserName { get; set; }
        public DateTime CreateDate { get; set; }
        public Int32 LastModifyUserId { get; set; }
        public string LastModifyUserName { get; set; }
        public DateTime LastModifyDate { get; set; }
        public Int32 Version { get; set; }
        public string AssemblyProdLine { get; set; }
        public bool IsCreateOrder { get; set; }
        public string DISPO { get; set; }
        public string BESKZ { get; set; }
        public string SOBSL { get; set; }
        public Int32 JointOperation { get; set; }
        public string RefOpRef { get; set; }
        #endregion

        public override int GetHashCode()
        {
            if (Id != 0)
            {
                return Id.GetHashCode();
            }
            else
            {
                return base.GetHashCode();
            }
        }

        public override bool Equals(object obj)
        {
            OrderBomDetail another = obj as OrderBomDetail;

            if (another == null)
            {
                return false;
            }
            else
            {
                return (this.Id == another.Id);
            }
        }
    }

}
