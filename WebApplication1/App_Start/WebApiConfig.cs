using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using System.Web.Http.Cors;
using Microsoft.Owin;
using Microsoft.Owin.Security.OAuth;
using Owin;

namespace WebApi.Jwt
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.EnableCors();
           // OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "yourdomain:yourpostnumber" });
            // Web API configuration and services
            // Configure Web API to use only bearer token authentication.
           // config.SuppressDefaultHostAuthentication();
           // config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType)); 

            // Web API configuration and services
            config.Filters.Add(new AuthorizeAttribute());

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Formatters.JsonFormatter.SerializerSettings.NullValueHandling = NullValueHandling.Include;
            var jsonpFormatter = new JsonMediaTypeFormatter();
            config.Formatters.Add(jsonpFormatter);
        }
    }
}
