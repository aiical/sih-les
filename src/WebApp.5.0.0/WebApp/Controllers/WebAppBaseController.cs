﻿using com.Sconit.Utility;

namespace com.Sconit.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Reflection;
    using System.Text;
    using System.Threading;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Script.Serialization;
    using AutoMapper;
    using com.Sconit.Util;
    using Entity;
    using Entity.ACC;
    using Entity.Exception;
    using Entity.SYS;
    using Models;
    using NPOI.HSSF.UserModel;
    using NPOI.SS.UserModel;
    using Service;
    using Telerik.Web.Mvc;
    using Util;

    public class WebAppBaseController : BaseController
    {
        public IGenericMgr genericMgr { get; set; }
        public ISystemMgr systemMgr { get; set; }
        public IReportMgr reportMgr { get; set; }

        private IList<string> errorMessages = null;
        private IList<string> warningMessages = null;
        private IList<string> successMessages = null;

        private static IDictionary<Type, IList<CodeDetailDescriptionPropertyMeta>> codeDetailDescriptionPropertyCache = new Dictionary<Type, IList<CodeDetailDescriptionPropertyMeta>>();
        private static string codeDetailDescriptionPropertyCacheLock = string.Empty;
        private static string portalUserPassword = "SIH_DMS";
        private static Int32? _maxRowSize { get; set; }

        private static string siService_TimeOut { get; set; }
        public string SIService_TimeOut
        {
            get
            {
                if (siService_TimeOut == null)
                {
                    siService_TimeOut = this.genericMgr.FindById<com.Sconit.Entity.SYS.EntityPreference>
                           ((int)com.Sconit.Entity.SYS.EntityPreference.CodeEnum.SIServiceTimeOut).Value;
                }

                return siService_TimeOut;
            }
        }

        protected Int32 MaxRowSize
        {
            get
            {
                if (!_maxRowSize.HasValue)
                {
                    _maxRowSize = int.Parse(this.genericMgr.FindById<com.Sconit.Entity.SYS.EntityPreference>
                        ((int)com.Sconit.Entity.SYS.EntityPreference.CodeEnum.MaxRowSizeOnPage).Value
                        );
                }
                return _maxRowSize.Value;
            }
        }

        public class ViewModel
        {
            public System.Data.DataTable Data { get; set; }
            public IEnumerable<Telerik.Web.Mvc.UI.GridColumnSettings> Columns { get; set; }
        }

        #region override methods
        protected override void ExecuteCore()
        {
            User user = (User)Session[WebConstants.UserSessionKey];
            var lang = string.Empty;
            if (user != null)
            {
                // set the culture from the user (session)  
                lang = user.Language;
                // save the location into cookie   
                HttpCookie _cookie = new HttpCookie(WebConstants.CookieCurrentUICultureKey, Thread.CurrentThread.CurrentUICulture.Name);
                _cookie.Expires = DateTime.Now.AddYears(1);
                HttpContext.Response.SetCookie(_cookie);

                IList<Menu> allMenu = systemMgr.GetAllMenu();

                if (!Request.Url.LocalPath.StartsWith("/Main") && !Request.Url.LocalPath.StartsWith("/Account")
                   && allMenu.Select(p => p.PageUrl).Contains("~" + Request.Url.LocalPath)
                   && this.Request.UrlReferrer != this.Request.Url)
                {
                    HttpCookie cok = new HttpCookie(WebConstants.CookieMainPageUrlKey);
                    cok.Values.Add(this.CurrentUser.Code, Request.Url.LocalPath);
                    cok.Expires = DateTime.Now.AddYears(1);
                    Response.SetCookie(cok);
                }
            }
            else
            {
                // load the culture info from the cookie  
                var cookie = HttpContext.Request.Cookies[WebConstants.CookieCurrentUICultureKey];
                if (cookie != null)
                {
                    // set the culture by the cookie content  
                    lang = cookie.Value;
                }
                else
                {
                    // set the culture by the location if not speicified 
                    if (HttpContext.Request.UserLanguages != null)
                    {
                        lang = HttpContext.Request.UserLanguages[0];
                    }
                }
                // set the lang value into route data   
                //RouteData.Values["lang"] = langHeader;
            }

            try
            {
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(lang);
            }
            catch (CultureNotFoundException)
            {
                //do nothing using default culture
            }
            try
            {
                base.ExecuteCore();
            }
            catch (HttpException)
            {
            }
        }

        protected override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            #region 添加Message
            string resultType = filterContext.Result.GetType().ToString();
            resultType = resultType.Substring(resultType.LastIndexOf(".") + 1);
            if (resultType.StartsWith("Redirect"))
            {
                //如果Redirect，把Message存储到TempData中在Redirect之后页面中显示
                SaveMessageToTempData();
            }
            else if (resultType.StartsWith("Json"))
            {
                FlushMessage((JsonResult)filterContext.Result);
            }
            else if (resultType.StartsWith("Content"))
            {
                FlushMessage((ContentResult)filterContext.Result);
            }
            else
            {
                //输出Message到ViewData中在页面上显示
                FlushMessage();
            }
            #endregion
            base.OnResultExecuting(filterContext);
        }
        #endregion

        #region Message
        protected bool HasErrorMessage()
        {
            return (errorMessages != null && errorMessages.Count > 0) || MessageHolder.HasErrorMessages();
        }

        protected void SaveBusinessExceptionMessage(BusinessException ex)
        {
            foreach (Message message in ex.GetMessages())
            {
                if (message.MessageType == Sconit.CodeMaster.MessageType.Error)
                {
                    SaveErrorMessage(message.GetMessageString());
                }
                else if (message.MessageType == Sconit.CodeMaster.MessageType.Warning)
                {
                    SaveWarningMessage(message.GetMessageString());
                }
                else if (message.MessageType == Sconit.CodeMaster.MessageType.Info)
                {
                    SaveSuccessMessage(message.GetMessageString());
                }
            }
        }

        protected void SaveErrorMessage(string message)
        {
            if (errorMessages == null)
            {
                errorMessages = new List<string>();
            }
            errorMessages.Add(message);
        }

        protected virtual void SaveErrorMessage(string message, params string[] messageParams)
        {
            if (errorMessages == null)
            {
                errorMessages = new List<string>();
            }
            errorMessages.Add(string.Format(message, messageParams));
        }

        protected void SaveWarningMessage(string message)
        {
            if (warningMessages == null)
            {
                warningMessages = new List<string>();
            }
            warningMessages.Add(message);
        }

        protected void SaveWarningMessage(string message, params string[] messageParams)
        {
            if (warningMessages == null)
            {
                warningMessages = new List<string>();
            }
            warningMessages.Add(string.Format(message, messageParams));
        }

        protected void SaveSuccessMessage(string message)
        {
            if (successMessages == null)
            {
                successMessages = new List<string>();
            }
            successMessages.Add(message);
        }

        protected void SaveSuccessMessage(string message, params string[] messageParams)
        {
            if (successMessages == null)
            {
                successMessages = new List<string>();
            }
            successMessages.Add(string.Format(message, messageParams));
        }

        protected void SaveErrorMessage(Exception exception)
        {
            if (exception.InnerException != null)
            {
                SaveErrorMessage(exception.InnerException.InnerException != null
                                     ? exception.InnerException.InnerException.Message
                                     : exception.InnerException.Message);
            }
            else
            {
                SaveErrorMessage(exception.Message);
            }
        }

        private void FlushMessage(ContentResult content)
        {
            if (MessageHolder.HasErrorMessages())
            {
                foreach (Message message in MessageHolder.GetErrorMessages())
                {
                    SaveErrorMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasWarningMessages())
            {
                foreach (Message message in MessageHolder.GetWarningMessages())
                {
                    SaveWarningMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasInfoMessages())
            {
                foreach (Message message in MessageHolder.GetInfoMessages())
                {
                    SaveSuccessMessage(message.GetMessageString());
                }
            }

            MessageHolder.CleanMessage();

            if (errorMessages != null || warningMessages != null || successMessages != null)
            {
                JsonResult jsonResult = Json(new { ErrorMessages = errorMessages, WarningMessages = warningMessages, SuccessMessages = successMessages });
                content.Content = new JavaScriptSerializer().Serialize(jsonResult.Data);
            }
        }

        private void FlushMessage(JsonResult json)
        {
            if (MessageHolder.HasErrorMessages())
            {
                foreach (Message message in MessageHolder.GetErrorMessages())
                {
                    SaveErrorMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasWarningMessages())
            {
                foreach (Message message in MessageHolder.GetWarningMessages())
                {
                    SaveWarningMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasInfoMessages())
            {
                foreach (Message message in MessageHolder.GetInfoMessages())
                {
                    SaveSuccessMessage(message.GetMessageString());
                }
            }

            MessageHolder.CleanMessage();

            if (json.Data == null)
            {
                if (errorMessages != null || warningMessages != null || successMessages != null)
                {
                    JsonResult jsonResult = Json(new { ErrorMessages = errorMessages, WarningMessages = warningMessages, SuccessMessages = successMessages });
                    Response.TrySkipIisCustomErrors = true;
                    Response.StatusCode = 500;
                    Response.Write(new JavaScriptSerializer().Serialize(jsonResult.Data));
                }
            }
            else
            {
                if (errorMessages != null || warningMessages != null || successMessages != null)
                {
                    if (json.Data.GetType() == typeof(Dictionary<string, object>))
                    {
                        IDictionary<string, object> dic = (IDictionary<string, object>)json.Data;
                        dic.Add("ErrorMessages", errorMessages);
                        dic.Add("WarningMessages", warningMessages);
                        dic.Add("SuccessMessages", successMessages);
                    }
                    else
                    {
                        JsonResult jsonResult = Json(new { ErrorMessages = errorMessages, WarningMessages = warningMessages, SuccessMessages = successMessages, Data = json.Data });
                        json.Data = jsonResult.Data;
                    }
                }
            }
        }

        private void FlushMessage()
        {
            if (TempData[WebConstants.ErrorMessages] != null)
            {
                foreach (string message in (IList<string>)TempData[WebConstants.ErrorMessages])
                {
                    SaveErrorMessage(message);
                }
            }

            if (TempData[WebConstants.WarningMessages] != null)
            {
                foreach (string message in (IList<string>)TempData[WebConstants.WarningMessages])
                {
                    SaveWarningMessage(message);
                }
            }

            if (TempData[WebConstants.SuccessMessages] != null)
            {
                foreach (string message in (IList<string>)TempData[WebConstants.SuccessMessages])
                {
                    SaveSuccessMessage(message);
                }
            }

            if (MessageHolder.HasErrorMessages())
            {
                foreach (Message message in MessageHolder.GetErrorMessages())
                {
                    SaveErrorMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasWarningMessages())
            {
                foreach (Message message in MessageHolder.GetWarningMessages())
                {
                    SaveWarningMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasInfoMessages())
            {
                foreach (Message message in MessageHolder.GetInfoMessages())
                {
                    SaveSuccessMessage(message.GetMessageString());
                }
            }

            MessageHolder.CleanMessage();

            #region 添加Message
            if (errorMessages != null)
            {
                ViewData[WebConstants.ErrorMessages] = errorMessages;
            }
            if (warningMessages != null)
            {
                ViewData[WebConstants.WarningMessages] = warningMessages;
            }
            if (successMessages != null)
            {
                ViewData[WebConstants.SuccessMessages] = successMessages;
            }
            #endregion
        }

        public void CleanMessage()
        {
            ViewData[WebConstants.ErrorMessages] = null;
            ViewData[WebConstants.WarningMessages] = null;
            ViewData[WebConstants.SuccessMessages] = null;
        }

        private void SaveMessageToTempData()
        {
            if (MessageHolder.HasErrorMessages())
            {
                foreach (Message message in MessageHolder.GetErrorMessages())
                {
                    SaveErrorMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasWarningMessages())
            {
                foreach (Message message in MessageHolder.GetWarningMessages())
                {
                    SaveWarningMessage(message.GetMessageString());
                }
            }

            if (MessageHolder.HasInfoMessages())
            {
                foreach (Message message in MessageHolder.GetInfoMessages())
                {
                    SaveSuccessMessage(message.GetMessageString());
                }
            }

            MessageHolder.CleanMessage();

            #region 添加Message
            if (errorMessages != null)
            {
                TempData[WebConstants.ErrorMessages] = errorMessages;
            }
            if (warningMessages != null)
            {
                TempData[WebConstants.WarningMessages] = warningMessages;
            }
            if (successMessages != null)
            {
                TempData[WebConstants.SuccessMessages] = successMessages;
            }
            #endregion
        }

        //protected void SaveBusinessExceptionMessage(BusinessException ex)
        //{
        //    foreach(Message message in ex.messageList)
        //    {
        //        MessageHolder.AddMessage(message);
        //    }
        //}

        //protected void SaveErrorMessage(string message)
        //{
        //    MessageHolder.AddErrorMessage(message);
        //}

        //protected virtual void SaveErrorMessage(string message, params string[] messageParams)
        //{
        //    MessageHolder.AddErrorMessage(message, messageParams);
        //}

        //protected void SaveWarningMessage(string message)
        //{
        //    MessageHolder.AddWarningMessage(message);
        //}

        //protected void SaveWarningMessage(string message, params string[] messageParams)
        //{
        //    MessageHolder.AddWarningMessage(message, messageParams);
        //}

        //protected void SaveSuccessMessage(string message)
        //{
        //    MessageHolder.AddInfoMessage(message);
        //}

        //protected void SaveSuccessMessage(string message, params string[] messageParams)
        //{
        //    MessageHolder.AddInfoMessage(message, messageParams);
        //}
        #endregion

        #region Code Master
        protected SelectList GetCodeDetailDropDownList(com.Sconit.CodeMaster.CodeMaster code)
        {
            IList<CodeDetail> codeDetailList = systemMgr.GetCodeDetails(code);
            return Transfer2DropDownList(code, codeDetailList);
        }

        protected SelectList GetCodeDetailDropDownList(com.Sconit.CodeMaster.CodeMaster code, bool? includeBlankOption, string blankOptionDescription, string blankOptionValue)
        {
            IList<CodeDetail> codeDetailList = systemMgr.GetCodeDetails(code, includeBlankOption, blankOptionDescription, blankOptionValue);
            return Transfer2DropDownList(code, codeDetailList);
        }

        protected SelectList Transfer2DropDownList(com.Sconit.CodeMaster.CodeMaster code, IList<CodeDetail> codeDetailList)
        {
            return Transfer2DropDownList(code, codeDetailList, null);
        }

        protected SelectList Transfer2DropDownList(com.Sconit.CodeMaster.CodeMaster code, IList<CodeDetail> codeDetailList, string selectedValue)
        {
            IList<SelectListItem> itemList = Mapper.Map<IList<CodeDetail>, IList<SelectListItem>>(codeDetailList);

            foreach (var item in itemList)
            {
                item.Text = systemMgr.TranslateCodeDetailDescription(item.Text);
            }

            return new SelectList(itemList, "Value", "Text", selectedValue);
        }

        protected void FillCodeDetailDescription<T>(T obj)
        {
            if (obj != null)
            {
                Type type = typeof(T);
                IList<CodeDetailDescriptionPropertyMeta> metaList = TryGetCachedCodeDetailDescriptionPropertyMetaList(type);

                foreach (CodeDetailDescriptionPropertyMeta meta in metaList)
                {
                    object refCodeValue = meta.ReferencePropertyInfo.GetValue(obj, null);
                    if (refCodeValue != null && refCodeValue.ToString().Trim() != string.Empty)
                    {
                        if (refCodeValue.GetType() == typeof(short))
                        {
                            //meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, ((int)refCodeValue).ToString()), null);
                            meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, int.Parse(refCodeValue.ToString()).ToString()), null);

                        }
                        else if (refCodeValue.GetType() != typeof(string))
                        {
                            //如果refCodeValue不是String类型的，我们认为是CodeDetail定义的Enum值，并且都为int类型
                            //可能会有问题
                            meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, ((int)refCodeValue).ToString()), null);

                        }
                        else
                        {
                            meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, refCodeValue.ToString()), null);
                        }
                    }
                }
            }
        }

        protected void FillCodeDetailDescription<T>(IList<T> objList)
        {
            if (objList != null && objList.Count > 0)
            {
                Type type = typeof(T);
                IList<CodeDetailDescriptionPropertyMeta> metaList = TryGetCachedCodeDetailDescriptionPropertyMetaList(type);

                foreach (CodeDetailDescriptionPropertyMeta meta in metaList)
                {
                    //Parallel.ForEach(objList, (obj) =>
                    //{
                    //    object refCodeValue = meta.ReferencePropertyInfo.GetValue(obj, null);
                    //    if (refCodeValue != null && refCodeValue.ToString().Trim() != string.Empty)
                    //    {
                    //        meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, refCodeValue.ToString()), null);
                    //    }
                    //});
                    foreach (T obj in objList)
                    {
                        object refCodeValue = meta.ReferencePropertyInfo.GetValue(obj, null);
                        if (refCodeValue != null && refCodeValue.ToString().Trim() != string.Empty)
                        {
                            if (refCodeValue.GetType() == typeof(short))
                            {
                                //meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, ((int)refCodeValue).ToString()), null);
                                meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, int.Parse(refCodeValue.ToString()).ToString()), null);

                            }
                            else if (refCodeValue.GetType() != typeof(string))
                            {
                                //如果refCodeValue不是String类型的，我们认为是CodeDetail定义的Enum值，并且都为int类型
                                //可能会有问题
                                meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, ((int)refCodeValue).ToString()), null);

                            }
                            else
                            {
                                meta.TargetPropertyInfo.SetValue(obj, systemMgr.GetCodeDetailDescription(meta.CodeMaster, refCodeValue.ToString()), null);
                            }
                        }
                    }
                }
            }
        }

        protected string GetEncryptDencryptPortalUserName(string supplierCode)
        {
            EncryptDencryptService.EncryptDencryptService encryptDencryptService = new EncryptDencryptService.EncryptDencryptService();
            return encryptDencryptService.EncryptDencrypt(supplierCode, true, portalUserPassword);
        }

        private IList<CodeDetailDescriptionPropertyMeta> TryGetCachedCodeDetailDescriptionPropertyMetaList(Type type)
        {
            if (!codeDetailDescriptionPropertyCache.ContainsKey(type))
            {
                lock (codeDetailDescriptionPropertyCacheLock)
                {
                    //缓存反射的结果
                    codeDetailDescriptionPropertyCache.Add(type, new List<CodeDetailDescriptionPropertyMeta>());
                    PropertyInfo[] props = type.GetProperties();
                    foreach (PropertyInfo prop in props)
                    {
                        object[] atrributes = prop.GetCustomAttributes(typeof(CodeDetailDescriptionAttribute), false);

                        if (atrributes.Length > 0)
                        {
                            CodeDetailDescriptionAttribute atrribute = (CodeDetailDescriptionAttribute)atrributes[0];

                            CodeDetailDescriptionPropertyMeta meta = new CodeDetailDescriptionPropertyMeta();
                            meta.TargetPropertyInfo = prop;
                            meta.ReferencePropertyInfo = type.GetProperty(atrribute.ValueField);
                            meta.CodeMaster = atrribute.CodeMaster;

                            codeDetailDescriptionPropertyCache[type].Add(meta);
                        }
                    }
                }
            }

            return codeDetailDescriptionPropertyCache[type];
        }
        #endregion

        #region MenuTree
        protected IList<MenuModel> GetAuthrizedMenuTree()
        {
            if (this.CurrentUser == null || this.CurrentUser.UrlPermissions == null)
            {
                return null;
            }

            IList<Menu> allMenu = systemMgr.GetAllMenu();
            IList<MenuModel> allMenuModel = Mapper.Map<IList<Menu>, IList<MenuModel>>(allMenu);

            IList<string> userUrlPermisson = this.CurrentUser.UrlPermissions;

            //平板的Menu
            List<MenuModel> flatMenuList = (from m in allMenuModel
                                            join u in userUrlPermisson on m.Code equals u
                                            select m).ToList();

            //因为不会对父菜单授权, 需要循环取得所有子菜单的父菜单
            NestGetParentMenu(flatMenuList, flatMenuList, allMenuModel);

            foreach (var menu in flatMenuList)
            {
                string name = Resources.Menu.ResourceManager.GetString(menu.Name);
                if (name != null)
                {
                    menu.Name = name;
                }
            }

            //////菜单多语言(the muilty thread will let the globalization uneffect)
            ////Parallel.ForEach(flatMenuList, (menu) =>
            ////{
            ////    string name = Resources.Menu.ResourceManager.GetString(menu.Name);
            ////    if (name != null)
            ////    {
            ////        menu.Name = name;
            ////    }
            ////});

            //根Menu
            IList<MenuModel> menuTree = (from m in flatMenuList
                                         where (m.ParentMenuCode == null || m.ParentMenuCode == string.Empty)
                                        // && (!m.Code.StartsWith("Url_SI"))
                                         orderby m.Sequence
                                         select m).ToList();

            //暂时添加一个SI的页面 
            //menuTree.Add(flatMenuList.FirstOrDefault(m => m.Code == "Url_SI_SAP"));
            //循环得到子Menu
            foreach (MenuModel menu in menuTree)
            {
                menu.ChildrenMenu = NestGetChildrenMenu(menu, flatMenuList);
            }

            return menuTree;
        }

        protected void NestGetParentMenu(IList<MenuModel> currentLevelMenuList, List<MenuModel> flatMenuList, IList<MenuModel> allMenuList)
        {
            IList<string> parentMenuCodeList = (from m in currentLevelMenuList
                                                select m.ParentMenuCode).Distinct().ToList();

            if (parentMenuCodeList.Count > 0)
            {
                List<MenuModel> parentMenuList = (from m in allMenuList
                                                  join p in parentMenuCodeList on m.Code equals p
                                                  where !flatMenuList.Contains(m)  //过滤掉已经选择的菜单
                                                  select m).ToList();

                flatMenuList.AddRange(parentMenuList);

                NestGetParentMenu(parentMenuList, flatMenuList, allMenuList);
            }
        }

        protected IList<MenuModel> NestGetChildrenMenu(MenuModel menu, IList<MenuModel> allMenuList)
        {
            IList<MenuModel> childrenMenu = (from m in allMenuList
                                             where m.ParentMenuCode == menu.Code
                                             orderby m.Sequence
                                             select m).ToList();

            if (childrenMenu != null && childrenMenu.Count() > 0)
            {
                foreach (MenuModel childMenu in childrenMenu)
                {
                    childMenu.ChildrenMenu = NestGetChildrenMenu(childMenu, allMenuList);
                }
            }

            return childrenMenu;
        }
        #endregion

        #region Grid

        #region Paging
        protected IList<T> GetPageData<T>(SearchStatementModel searchStatementModel)
        {
            return ExcutePageDataHql<T>(searchStatementModel, null);
        }

        protected IList<T> GetPageData<T>(SearchStatementModel searchStatementModel, GridCommand command)
        {
            ViewBag.Total = ExcutePageTotalHql(searchStatementModel);
            return ExcutePageDataHql<T>(searchStatementModel, command);
        }

        protected GridModel<T> GetAjaxPageData<T>(SearchStatementModel searchStatementModel, GridCommand command)
        {
            GridModel<T> GridModel = new GridModel<T>();
            GridModel.Total = ExcutePageTotalHql(searchStatementModel);
            GridModel.Data = ExcutePageDataHql<T>(searchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }


        protected GridModel<T> GetAjaxPageDataProcedure<T>(ProcedureSearchStatementModel procedureSearchStatementModel, GridCommand command)
        {
            GridModel<T> GridModel = new GridModel<T>();
            GridModel.Total = ExcutePageTotalProcedure(procedureSearchStatementModel);
            GridModel.Data = ExcutePageDataProcedure<T>(procedureSearchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }

        protected GridModel<T> GetReportAjaxPageData<T>(ReportSearchStatementModel reportSearchStatementModel)
        {
            GridModel<T> GridModel = new GridModel<T>();
            List<object> reportResult = this.reportMgr.GetRealTimeLocationDetail(reportSearchStatementModel.ProcedureName, reportSearchStatementModel.Parameters);
            //reportMgr.GetRealTimeLocationDetail(reportSearchStatementModel.ProcedureName,reportSearchStatementModel.Parameters)
            GridModel.Total = (int)reportResult[0]; //ExcutePageTotalHql(searchStatementModel);
            GridModel.Data = (List<T>)reportResult[1];
            //GridModel.Data = ExcutePageDataHql<T>(searchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }
        protected GridModel<T> GetReportTransceiversAjaxPageData<T>(ReportSearchStatementModel reportSearchStatementModel)
        {
            GridModel<T> GridModel = new GridModel<T>();
            List<object> reportResult = this.reportMgr.GetReportTransceiversAjaxPageData(reportSearchStatementModel.ProcedureName, reportSearchStatementModel.Parameters);
            //reportMgr.GetRealTimeLocationDetail(reportSearchStatementModel.ProcedureName,reportSearchStatementModel.Parameters)
            GridModel.Total = (int)reportResult[0]; //ExcutePageTotalHql(searchStatementModel);
            GridModel.Data = (List<T>)reportResult[1];
            //GridModel.Data = ExcutePageDataHql<T>(searchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }

        protected GridModel<T> GetInventoryAgeAjaxPageData<T>(ReportSearchStatementModel reportSearchStatementModel)
        {
            GridModel<T> GridModel = new GridModel<T>();
            List<object> reportResult = this.reportMgr.GetInventoryAgeAjaxPageData(reportSearchStatementModel.ProcedureName, reportSearchStatementModel.Parameters);
            //reportMgr.GetRealTimeLocationDetail(reportSearchStatementModel.ProcedureName,reportSearchStatementModel.Parameters)
            GridModel.Total = (int)reportResult[0]; //ExcutePageTotalHql(searchStatementModel);
            GridModel.Data = (List<T>)reportResult[1];
            //GridModel.Data = ExcutePageDataHql<T>(searchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }
        protected GridModel<T> GetHistoryInvAjaxPageData<T>(ReportSearchStatementModel reportSearchStatementModel)
        {
            GridModel<T> GridModel = new GridModel<T>();
            List<object> reportResult = this.reportMgr.GetHistoryInvAjaxPageData(reportSearchStatementModel.ProcedureName, reportSearchStatementModel.Parameters);
            //reportMgr.GetRealTimeLocationDetail(reportSearchStatementModel.ProcedureName,reportSearchStatementModel.Parameters)
            GridModel.Total = (int)reportResult[0]; //ExcutePageTotalHql(searchStatementModel);
            GridModel.Data = (List<T>)reportResult[1];
            //GridModel.Data = ExcutePageDataHql<T>(searchStatementModel, command);
            ViewBag.Total = GridModel.Total;
            return GridModel;
        }


        protected int ProcessPageSize(int pageSize)
        {
            return pageSize != 0 ? pageSize : int.Parse(systemMgr.GetEntityPreferenceValue(Entity.SYS.EntityPreference.CodeEnum.DefaultPageSize));
        }

        private int ExcutePageTotalHql(SearchStatementModel searchStatementModel)
        {
            return (int)genericMgr.FindAll<long>(searchStatementModel.GetSearchCountStatement(), searchStatementModel.Parameters)[0];
        }

        private IList<T> ExcutePageDataHql<T>(SearchStatementModel searchStatementModel, GridCommand command)
        {
            IList<T> result;
            if (command != null)
            {
                command.PageSize = ProcessPageSize(command.PageSize);
                //  ViewBag.PageSize = command.PageSize;
                result = this.genericMgr.FindAll<T>(searchStatementModel.GetSearchStatement(), searchStatementModel.Parameters, (command.Page - 1) * command.PageSize, command.PageSize);
            }
            else
            {
                result = this.genericMgr.FindAll<T>(searchStatementModel.GetSearchStatement(), searchStatementModel.Parameters);
            }

            if (result == null)
            {
                //避免ajax请求返回null时报找不到View页面错误
                return new List<T>();
            }

            //填充CodeDetail的描述
            this.FillCodeDetailDescription<T>(result);

            return result;
        }

        private int ExcutePageTotalProcedure(ProcedureSearchStatementModel proceduresearchStatementModel)
        {
            return (int)genericMgr.FindAllWithNamedQuery<object>(proceduresearchStatementModel.GetSearchCountStatement(),
                proceduresearchStatementModel.GetParameterValues().ToArray(), proceduresearchStatementModel.GetParameterTypes().ToArray())[0];
            //return (int)GenericMgr.FindAll<long>(searchStatementModel.GetSearchCountStatement(), searchStatementModel.Parameters)[0];
        }

        private IList<T> ExcutePageDataProcedure<T>(ProcedureSearchStatementModel proceduresearchStatementModel, GridCommand command)
        {
            IList<T> result;
            if (command != null)
            {
                command.PageSize = ProcessPageSize(command.PageSize);
                //ViewBag.PageSize = command.PageSize;
                result = this.genericMgr.FindAllWithNamedQuery<T>(proceduresearchStatementModel.GetSearchStatement(),
                proceduresearchStatementModel.GetAllParameterValues().ToArray(), proceduresearchStatementModel.GetAllParameterTypes().ToArray());
            }
            else
            {
                result = this.genericMgr.FindAll<T>(proceduresearchStatementModel.GetSearchStatement(), proceduresearchStatementModel.Parameters);
            }

            if (result == null)
            {
                //避免ajax请求返回null时报找不到View页面错误
                return new List<T>();
            }

            //填充CodeDetail的描述
            this.FillCodeDetailDescription<T>(result);

            return result;
        }
        #endregion

        #region Search Model Cache
        protected SearchCacheModel ProcessSearchModel(GridCommand command, SearchModelBase searchObj)
        {
            SearchCacheModel searchModel;
            string cacheKey = GetSearchCacheKey();

            if (!searchObj.isFromList.HasValue || !searchObj.isFromList.Value)
            {
                searchModel = TryGetCachedSearchModel(cacheKey, command, searchObj);
                //TempData[searchObj.GetType().Name] = searchModel.SearchObject;
            }
            else
            {
                searchModel = new SearchCacheModel
                {
                    SearchObject = searchObj,
                    Command = command,
                };
            }

            //无论是否使用查询缓存，都要进行缓存
            TempData[searchObj.GetType().Name] = searchModel.SearchObject;
            SetSearchModelCache(cacheKey, searchModel);

            return searchModel;
        }

        private string GetSearchCacheKey()
        {
            return this.ControllerContext.HttpContext.Request.Path.ToUpper();
        }

        private SearchCacheModel TryGetCachedSearchModel(string searchKey, GridCommand command, object obj)
        {
            Dictionary<string, SearchCacheModel> searchCache = GetSearchCacheCollection();

            if (searchCache.Keys.Contains(searchKey))
            {
                return ((Dictionary<string, SearchCacheModel>)HttpContext.Session[WebConstants.SearchCacheSessionKey])[searchKey];
            }
            else
            {
                return new SearchCacheModel
                {
                    SearchObject = obj,
                    Command = command,
                    //CachedTime = DateTime.Now
                };
            }
        }

        private void SetSearchModelCache(string searchKey, SearchCacheModel searchModel)
        {
            Dictionary<string, SearchCacheModel> searchCache = GetSearchCacheCollection();
            searchModel.CachedTime = DateTime.Now;

            if (searchCache.Keys.Contains(searchKey))
            {
                searchCache[searchKey] = searchModel;
            }
            else if (searchCache.Count < int.Parse(systemMgr.GetEntityPreferenceValue(Entity.SYS.EntityPreference.CodeEnum.SessionCachedSearchStatementCount)))
            {
                searchCache.Add(searchKey, searchModel);
            }
            else
            {
                searchCache.Remove(searchCache.OrderByDescending(t => t.Value.CachedTime).First().Key);
                searchCache.Add(searchKey, searchModel);
            }
        }

        private Dictionary<string, SearchCacheModel> GetSearchCacheCollection()
        {
            if (HttpContext.Session[WebConstants.SearchCacheSessionKey] != null)
            {
                return (Dictionary<string, SearchCacheModel>)HttpContext.Session[WebConstants.SearchCacheSessionKey];
            }
            else
            {
                Dictionary<string, SearchCacheModel> searchCacheCollection = new Dictionary<string, SearchCacheModel>();
                HttpContext.Session[WebConstants.SearchCacheSessionKey] = searchCacheCollection;

                return searchCacheCollection;
            }
        }
        #endregion

        #endregion

        #region 检查查询条件是否为空
        public bool CheckSearchModelIsNull(object processObj)
        {
            Type t = processObj.GetType();
            PropertyInfo[] properties = t.GetProperties();
            bool isNull = false;
            foreach (PropertyInfo item in properties)
            {
                if (item.Name.ToString() == "isFromList")
                {
                    continue;
                }
                object value = item.GetValue(processObj, null);

                if (value != null)
                {
                    isNull = true;

                    break;
                }
            }
            return isNull;
        }
        #endregion


        #region Sql查询分页
        protected IList<T> GetPageDataWithNativeSql<T>(SearchNativeSqlStatementModel searchStatementModel, GridCommand command)
        {
            IList<object> countList = this.genericMgr.FindAllWithNativeSql<object>("select count(*) from (" + searchStatementModel.SelectSql + ") as tt3", searchStatementModel.Parameters);

            IList<T> searchResultList = this.genericMgr.FindAllWithNativeSql<T>("select * from ( select RowId=ROW_NUMBER()OVER(" + searchStatementModel.SortingStatement + "),* from (" + searchStatementModel.SelectSql + " ) as tt2 ) as tt3 where tt3.RowId between " + ((command.Page - 1) * command.PageSize + 1) + " and " + command.Page * command.PageSize + "", searchStatementModel.Parameters);

            ViewBag.Total = Convert.ToInt32(countList[0]);
            return searchResultList;
        }

        protected GridModel<T> GetPageDataEntityWithNativeSql<T>(SearchNativeSqlStatementModel searchStatementModel, GridCommand command)
        {
            IList<object> countList = this.genericMgr.FindAllWithNativeSql<object>("select count(*) from (" + searchStatementModel.SelectSql + ") as tt3", searchStatementModel.Parameters);

            IList<T> searchResultList = this.genericMgr.FindEntityWithNativeSql<T>("select * from ( select RowId=ROW_NUMBER()OVER(" + searchStatementModel.SortingStatement + "),* from (" + searchStatementModel.SelectSql + " ) as tt2 ) as tt3 where tt3.RowId between " + ((command.Page - 1) * command.PageSize + 1) + " and " + command.Page * command.PageSize + "", searchStatementModel.Parameters);

            //填充CodeDetail的描述
            this.FillCodeDetailDescription<T>(searchResultList);

            GridModel<T> gridModel = new GridModel<T>();
            gridModel.Total = Convert.ToInt32(countList[0]);
            gridModel.Data = searchResultList;
            ViewBag.Total = gridModel.Total;
            return gridModel;
        }

        #endregion


        #region 导出报表
        protected FileStreamResult ExportToCSV<T>(string exportName, string fileSuffiex, IList<T> objList)
        {
            string contentType = "text/comma-separated-values";
            return ExportToCSV<T>(exportName, contentType, fileSuffiex, objList);
        }

        protected FileStreamResult ExportToCSV<T>(string exportName, string contentType, string fileSuffiex, IList<T> objList)
        {
            Type type = typeof(T);
            var needExportProps = new Dictionary<PropertyInfo, int>();
            var needExportPropTitle = new Dictionary<PropertyInfo, string>();
            var needExportPropResourceType = new Dictionary<PropertyInfo, Type>();
            foreach (var prop in type.GetProperties())
            {
                object[] atrributes = prop.GetCustomAttributes(typeof(ExportAttribute), false);
                if (atrributes.Length > 0)
                {
                    foreach (ExportAttribute atrribute in atrributes)
                    {
                        if (atrribute.ExportName.Equals(exportName, StringComparison.OrdinalIgnoreCase) && !needExportProps.Keys.Contains(prop))
                        {
                            needExportProps.Add(prop, atrribute.ExportSeq);
                            if (!string.IsNullOrWhiteSpace(atrribute.ExportTitle) && atrribute.ExportTitleResourceType != null)
                            {
                                needExportPropTitle.Add(prop, atrribute.ExportTitle);
                                needExportPropResourceType.Add(prop, atrribute.ExportTitleResourceType);
                            }
                        }
                    }
                }
            }

            var exportProps = needExportProps.OrderBy(c => c.Value).Select(c => c.Key).ToList();

            MemoryStream output = new MemoryStream();
            StreamWriter writer = new StreamWriter(output, Encoding.Default);
            CSVWriter csvWriter = new CSVWriter(writer);
            if (exportProps.Count > 0)
            {
                //填充表头
                foreach (var prop in exportProps)
                {
                    // 根据获取设置导出的表头
                    if (needExportPropTitle.ContainsKey(prop) && needExportPropResourceType.ContainsKey(prop))
                    {
                        var attr = new DisplayAttribute { Name = needExportPropTitle[prop], ResourceType = needExportPropResourceType[prop] };
                        csvWriter.Write(attr.GetName());
                    }
                    else
                    {
                        object[] atrributes = prop.GetCustomAttributes(typeof(DisplayAttribute), false);
                        if (atrributes.Length > 0)
                        {
                            DisplayAttribute atrribute = (DisplayAttribute)atrributes[0];
                            csvWriter.Write(atrribute.GetName());
                        }
                        else
                        {
                            csvWriter.Write(prop.Name + ",");
                        }
                    }
                }
                csvWriter.WriteNewLine();
                //填充数据
                foreach (var obj in objList)
                {
                    foreach (var prop in exportProps)
                    {
                        if (prop.PropertyType == typeof(bool))
                        {
                            bool boolPropValue = (bool)prop.GetValue(obj, null);
                            csvWriter.Write(boolPropValue ? "Y" : "N");
                        }
                        else
                        {
                            csvWriter.Write((prop.GetValue(obj, null) != null ? prop.GetValue(obj, null).ToString() : string.Empty));
                        }
                        //writer.Write(prop.GetValue(obj, null).ToString() + ",");
                    }
                    csvWriter.WriteNewLine();
                }
            }
            writer.Flush();
            output.Position = 0;

            return File(output, contentType, exportName + "." + fileSuffiex);
        }

        protected void ExportToXLS<T>(string exportName, string fileSuffiex, IList<T> objList)
        {
            string contentType = "application/vnd.ms-excel";
            ExportToXLS<T>(exportName, contentType, fileSuffiex, objList);
        }

        protected void ExportToXLS<T>(string exportName, string contentType, string fileSuffiex, IList<T> objList)
        {
            HSSFWorkbook hssfworkbook = new HSSFWorkbook();
            ISheet sheet1 = hssfworkbook.CreateSheet("Sheet1");
            MemoryStream output = new MemoryStream();

            Type type = typeof(T);
            var needExportProps = new Dictionary<PropertyInfo, int>();
            var needExportPropTitle = new Dictionary<PropertyInfo, string>();
            var needExportPropResourceType = new Dictionary<PropertyInfo, Type>();
            foreach (var prop in type.GetProperties())
            {
                object[] atrributes = prop.GetCustomAttributes(typeof(ExportAttribute), false);
                if (atrributes.Length > 0)
                {
                    foreach (ExportAttribute atrribute in atrributes)
                    {
                        if (atrribute.ExportName.Equals(exportName, StringComparison.OrdinalIgnoreCase) && !needExportProps.Keys.Contains(prop))
                        {
                            needExportProps.Add(prop, atrribute.ExportSeq);
                            if (!string.IsNullOrWhiteSpace(atrribute.ExportTitle) && atrribute.ExportTitleResourceType != null)
                            {
                                needExportPropTitle.Add(prop, atrribute.ExportTitle);
                                needExportPropResourceType.Add(prop, atrribute.ExportTitleResourceType);
                            }
                        }
                    }
                }
            }

            var exportProps = needExportProps.OrderBy(c => c.Value).Select(c => c.Key).ToList();

            if (exportProps.Count > 0)
            {
                //填充表头
                IRow rowHeader = sheet1.CreateRow(0);
                for (int i = 0; i < exportProps.Count; i++)
                {
                    PropertyInfo prop = exportProps[i];
                    // 根据获取设置导出的表头
                    if (needExportPropTitle.ContainsKey(prop) && needExportPropResourceType.ContainsKey(prop))
                    {
                        var attr = new DisplayAttribute { Name = needExportPropTitle[prop], ResourceType = needExportPropResourceType[prop] };
                        rowHeader.CreateCell(i).SetCellValue(attr.GetName());
                    }
                    else
                    {
                        object[] atrributes = prop.GetCustomAttributes(typeof(DisplayAttribute), false);
                        if (atrributes.Length > 0)
                        {
                            DisplayAttribute atrribute = (DisplayAttribute)atrributes[0];
                            rowHeader.CreateCell(i).SetCellValue(atrribute.GetName());
                        }
                        else
                        {
                            rowHeader.CreateCell(i).SetCellValue(prop.Name);
                        }
                    }
                }

                for (int j = 1; j <= objList.Count; j++)
                {
                    IRow rowDetail = sheet1.CreateRow(j);
                    for (int k = 0; k < exportProps.Count; k++)
                    {
                        PropertyInfo prop = exportProps[k];
                        if (prop.PropertyType == typeof(bool))
                        {
                            bool boolPropValue = (bool)prop.GetValue(objList[j - 1], null);
                            rowDetail.CreateCell(k).SetCellValue(boolPropValue ? "Y" : "N");
                        }
                        else if (prop.PropertyType == typeof(bool?))
                        {
                            bool? boolPropValue = prop.GetValue(objList[j - 1], null) != null ? (bool?)prop.GetValue(objList[j - 1], null) : null;
                            rowDetail.CreateCell(k).SetCellValue(boolPropValue != null ? (boolPropValue.Value ? "Y" : "N") : string.Empty);
                        }
                        else if (prop.PropertyType == typeof(decimal))
                        {
                            decimal propValue = (decimal)prop.GetValue(objList[j - 1], null);
                            rowDetail.CreateCell(k).SetCellValue(SystemHelper.IsInterate(propValue) ? ((int)propValue).ToString() : propValue.ToString("0.######"));
                        }
                        else if (prop.PropertyType == typeof(decimal?))
                        {
                            decimal? propValue = prop.GetValue(objList[j - 1], null) != null ? (decimal?)prop.GetValue(objList[j - 1], null) : null;
                            rowDetail.CreateCell(k).SetCellValue(propValue != null ? (SystemHelper.IsInterate(propValue.Value) ? ((int)propValue).ToString() : propValue.Value.ToString("0.######")) : string.Empty);
                        }
                        else if (prop.PropertyType == typeof(DateTime))
                        {
                            DateTime propValue = (DateTime)prop.GetValue(objList[j - 1], null);
                            rowDetail.CreateCell(k).SetCellValue(propValue.ToString("yyyy-MM-dd HH:mm:ss"));
                        }
                        else if (prop.PropertyType == typeof(DateTime?))
                        {
                            DateTime? propValue = prop.GetValue(objList[j - 1], null) != null ? (DateTime?)prop.GetValue(objList[j - 1], null) : null;
                            rowDetail.CreateCell(k).SetCellValue(propValue.HasValue ? propValue.Value.ToString("yyyy-MM-dd HH:mm:ss") : "");
                        }
                        else
                        {
                            rowDetail.CreateCell(k).SetCellValue(prop.GetValue(objList[j - 1], null) != null ? prop.GetValue(objList[j - 1], null).ToString() : string.Empty);
                        }
                    }
                }
            }
            hssfworkbook.Write(output);

            string filename = exportName + "." + fileSuffiex;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
            Response.Clear();

            Response.BinaryWrite(output.GetBuffer());
            Response.End();
            //return File(output, contentType, exportName + "." + fileSuffiex);
        }
        #endregion

      

        #region SI Service URL Replace
        protected string ReplaceSIServiceUrl(string originalUrl)
        {
            return this.systemMgr.ReplaceSIServiceUrl(originalUrl);
        }
        #endregion
    }

    class CodeDetailDescriptionPropertyMeta
    {
        public PropertyInfo TargetPropertyInfo { get; set; }  //CodeDetail的描述Property
        public com.Sconit.CodeMaster.CodeMaster CodeMaster { get; set; }  //CodeMaster Code
        public PropertyInfo ReferencePropertyInfo { get; set; }  //CodeDetail的Value Property
    }
}
