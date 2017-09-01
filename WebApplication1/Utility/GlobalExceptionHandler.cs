using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection.Emit;
using System.Web;
using System.Web.Http.ExceptionHandling;

namespace WebApplication1.Utility
{
    public class GlobalExceptionHandler : System.Web.Http.ExceptionHandling.ExceptionHandler
    {
        public override void Handle(ExceptionHandlerContext context)
        {
            var exception = context.Exception;

            var httpException = exception as HttpException;
            if (httpException != null)
            {
                context.Result = new CustomErrorResult(context.Request,
                    (HttpStatusCode)httpException.GetHttpCode(),
                     httpException.Message);
                return;
            }

            // Return HttpStatusCode for other types of exception.

            context.Result = new CustomErrorResult(context.Request,HttpStatusCode.InternalServerError, exception.Message);
        }
    }

}