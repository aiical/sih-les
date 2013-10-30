﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Sconit.BatchJob.Job;
using com.Sconit.Util;

namespace com.Sconit.Service.BatchJob.Job
{
    public class GetProcOrderJob : IJob
    {
        private static log4net.ILog log = log4net.LogManager.GetLogger("Log.BatchJob");

        public void Execute(JobContext context)
        {
            if (!context.JobDataMap.ContainKey("UserCode"))
            {
                log.Error("User code not specified.");
            }

            if (!context.JobDataMap.ContainKey("Plant"))
            {
                log.Error("Plant not specified.");
            }

            if (context.JobDataMap.ContainKey("UserCode") && context.JobDataMap.ContainKey("Plant"))
            {
                SAPService.SAPService sapService = new SAPService.SAPService();
                if (context.JobDataMap.ContainKey("SIServiceAddress") && context.JobDataMap.ContainKey("SIServicePort"))
                {
                    sapService.Url = ServiceURLHelper.ReplaceServiceUrl(sapService.Url, context.JobDataMap.GetStringValue("SIServiceAddress"), context.JobDataMap.GetStringValue("SIServicePort"));
                }

                Double diffDate = 0;
                if (context.JobDataMap.ContainKey("DayDiff"))
                {
                    diffDate = context.JobDataMap.GetDoubleValue("DayDiff");
                }

                //sapService.GetProcOrdersAsync(context.JobDataMap.GetStringValue("UserCode"), null, null, context.JobDataMap.GetStringValue("Plant"), DateTime.Now.AddDays(diffDate), true);
            }
        }
    }
}
