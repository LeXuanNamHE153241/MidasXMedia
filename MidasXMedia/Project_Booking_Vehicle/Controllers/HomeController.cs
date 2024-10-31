using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MidasXMedia.Models;
using System.Linq;

namespace MidasXMedia.Controllers
{
    public class HomeController : Controller
    {
		DBvehicleContext context = new DBvehicleContext();
		public IActionResult Home()
        {
            String RoleID = HttpContext.Session.GetString("RoleID");
            String FullName = HttpContext.Session.GetString("FullName");
            ViewBag.RoleID = RoleID;
            ViewBag.FullName = FullName;
            List<Vehicle> v = new List<Vehicle>();
            v = context.Vehicles.ToList();
			List<VehicleType> t = new List<VehicleType>();
			t= context.VehicleTypes.ToList();
			ViewBag.VehicleTypes = t;
			ViewBag.Vehicle = v;
            List<Review> o = new List<Review>();
			o = context.Reviews.Include(s => s.Order).Include(s => s.User).Include(s=>s.Vehicle).Where(s=>s.OrderId==s.Order.OrderId&&s.UserId==s.User.UserId&&s.VehicleId==s.Vehicle.VehicleId).ToList();
			
			ViewBag.Order = o;
            return View();
        }
		public IActionResult SearchVehicle()
		{
			String RoleID = HttpContext.Session.GetString("RoleID");
            ViewBag.RoleID = RoleID;
            String FullName = HttpContext.Session.GetString("FullName");
			string TypeVehicle = "";
			TypeVehicle = HttpContext.Request.Form["type"];
			string YearVehicle = "";
			YearVehicle = HttpContext.Request.Form["year"];
			ViewBag.TypeVehicle = TypeVehicle;
			if(TypeVehicle == "all" && YearVehicle== "default")
			{
				var v = context.Vehicles.ToList();

				ViewBag.Vehicle = v;
			}
			else
			{
				if (TypeVehicle == "all")
				{
					var v = context.Vehicles.Include(s => s.Type).Where(v => v.Year == Int32.Parse(YearVehicle) && v.TypeId == v.Type.TypeId).ToList();
					ViewBag.Vehicle = v;
				}
				else if (YearVehicle=="default")
				{
					var v = context.Vehicles.Include(s => s.Type).Where(v => v.Type.TypeId == Int32.Parse(TypeVehicle) && v.TypeId == v.Type.TypeId).ToList();

					ViewBag.Vehicle = v;
				}else
				{
					var v = context.Vehicles.Include(s => s.Type).Where(v => v.Type.TypeId == Int32.Parse(TypeVehicle) || v.Year == Int32.Parse(YearVehicle) && v.TypeId == v.Type.TypeId).ToList();

					ViewBag.Vehicle = v;
				}
				
			}
			
			return View();
		}
	}
}
