using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(siteConsultorio.Startup))]
namespace siteConsultorio
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
