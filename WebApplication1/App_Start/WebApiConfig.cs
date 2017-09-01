using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.Http;
using System.Web.Http.Cors;
using Microsoft.Owin;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System.Net.Http.Formatting;
using System.Web.Http.ExceptionHandling;
using WebApplication1.Utility;

namespace WebApi.Jwt
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //config.EnableCors();
           // OwinContext owinContext = new OwinContext();
            
            // owinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "http://localhost:4200" });
            // Web API configuration and services
            // Configure Web API to use only bearer token authentication.
          //  config.SuppressDefaultHostAuthentication();
          // config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            // Web API configuration and services
            //config.Filters.Add(new AuthorizeAttribute());
            var cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);
            config.Services.Replace(typeof(IExceptionHandler), new GlobalExceptionHandler());
            //OAuthOptions = new OAuthAuthorizationServerOptions
            //{
            //    TokenEndpointPath = new PathString("/Token"),
            //    Provider = new ApplicationOAuthProvider(PublicClientKey),
            //    AccessTokenExpireTimeSpan = TimeSpan.FromDays(14),
            //    AllowInsecureHttp = true
            //};

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

          //  config.Formatters.JsonFormatter.SerializerSettings.NullValueHandling = NullValueHandling.Include;
         

        }
    }
}
