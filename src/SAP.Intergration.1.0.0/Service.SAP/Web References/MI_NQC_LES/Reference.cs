﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.296
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// 此源代码是由 Microsoft.VSDesigner 4.0.30319.296 版自动生成。
// 
#pragma warning disable 1591

namespace com.Sconit.Service.SAP.MI_NQC_LES {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="MI_NQC_LESBinding", Namespace="http://www.sih.cq.cn/sap/mm/08")]
    public partial class MI_NQC_LESService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback MI_NQC_LESOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public MI_NQC_LESService() {
            this.Url = global::com.Sconit.Service.SAP.Properties.Settings.Default.com_Sconit_Service_SAP_MI_NQC_LES_MI_NQC_LESService;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event MI_NQC_LESCompletedEventHandler MI_NQC_LESCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://sap.com/xi/WebService/soap1.1", RequestElementName="ZSIH_MM_NQC", RequestNamespace="urn:sap-com:document:sap:rfc:functions", ResponseElementName="ZSIH_MM_NQC.Response", ResponseNamespace="urn:sap-com:document:sap:rfc:functions", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void MI_NQC_LES([System.Xml.Serialization.XmlArrayAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)] [System.Xml.Serialization.XmlArrayItemAttribute("item", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable=false)] ref ZSNQC[] IT_DATA) {
            object[] results = this.Invoke("MI_NQC_LES", new object[] {
                        IT_DATA});
            IT_DATA = ((ZSNQC[])(results[0]));
        }
        
        /// <remarks/>
        public void MI_NQC_LESAsync(ZSNQC[] IT_DATA) {
            this.MI_NQC_LESAsync(IT_DATA, null);
        }
        
        /// <remarks/>
        public void MI_NQC_LESAsync(ZSNQC[] IT_DATA, object userState) {
            if ((this.MI_NQC_LESOperationCompleted == null)) {
                this.MI_NQC_LESOperationCompleted = new System.Threading.SendOrPostCallback(this.OnMI_NQC_LESOperationCompleted);
            }
            this.InvokeAsync("MI_NQC_LES", new object[] {
                        IT_DATA}, this.MI_NQC_LESOperationCompleted, userState);
        }
        
        private void OnMI_NQC_LESOperationCompleted(object arg) {
            if ((this.MI_NQC_LESCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.MI_NQC_LESCompleted(this, new MI_NQC_LESCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="urn:sap-com:document:sap:rfc:functions")]
    public partial class ZSNQC {
        
        private string mATNRField;
        
        private string lIFNRRField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string MATNR {
            get {
                return this.mATNRField;
            }
            set {
                this.mATNRField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LIFNRR {
            get {
                return this.lIFNRRField;
            }
            set {
                this.lIFNRRField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    public delegate void MI_NQC_LESCompletedEventHandler(object sender, MI_NQC_LESCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class MI_NQC_LESCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal MI_NQC_LESCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public ZSNQC[] IT_DATA {
            get {
                this.RaiseExceptionIfNecessary();
                return ((ZSNQC[])(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591