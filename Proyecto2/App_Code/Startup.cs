using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Proyecto2.Startup))]
namespace Proyecto2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
