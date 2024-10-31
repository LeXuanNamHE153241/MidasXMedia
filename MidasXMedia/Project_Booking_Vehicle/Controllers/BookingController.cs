using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MidasXMedia.Models;
using TravelSystem_SWP391.DAO_Context;

namespace MidasXMedia.Controllers
{
    public class BookingController : Controller
    {
        DBvehicleContext context = new DBvehicleContext();
        DAO dal = new DAO();
        public IActionResult BookingVehicle(string id)
        {
			String RoleID = HttpContext.Session.GetString("RoleID");
			String FullName = HttpContext.Session.GetString("FullName");
			String UserID = HttpContext.Session.GetString("UserID");
			ViewBag.RoleID = RoleID;
			ViewBag.FullName = FullName;
			ViewBag.UserID = UserID;
			var v = dal.VehicleByID(id);
            ViewBag.Vehicle = v;
			return View();
        }
		public IActionResult BookingAccess(string id,Decimal price)
		{
			String RoleID = HttpContext.Session.GetString("RoleID");
			String FullName = HttpContext.Session.GetString("FullName");
			String UserID = HttpContext.Session.GetString("UserID");
			ViewBag.RoleID = RoleID;
			ViewBag.FullName = FullName;
			ViewBag.UserID = UserID;
			DateTime StartDate = DateTime.Parse(HttpContext.Request.Form["stdate"]);
			DateTime EndDate = DateTime.Parse(HttpContext.Request.Form["edate"]);
            
			TimeSpan days = EndDate - StartDate;
			Decimal total = (decimal)days.TotalDays * price;
			var v = dal.VehicleByID(id);
			ViewBag.Vehicle = v;
			Order o = new Order()
			{
                UserId = Int32.Parse(UserID),
                VehicleId = Int32.Parse(id),
                StartDate = StartDate,
                EndDate = EndDate,
                Stdate = StartDate.ToString(),
                Endate = EndDate.ToString(),
                TotalAmount = total,
                Status = "Wait",
            };
			context.Add(o);
			context.SaveChanges();
			List<Order> orders = new List<Order>();
			orders = context.Orders.Include(s=>s.User).Include(s=>s.Vehicle).Where(s=>s.UserId==s.User.UserId&&s.VehicleId==s.Vehicle.VehicleId).ToList();
			ViewBag.Orders = orders;
            return RedirectToAction("ListBookingByUser", "Booking");
        }
        public IActionResult ListBooking()
        {
            String RoleID = HttpContext.Session.GetString("RoleID");
            if(RoleID=="2"){
                String FullName = HttpContext.Session.GetString("FullName");
                String UserID = HttpContext.Session.GetString("UserID");
                ViewBag.RoleID = RoleID;
                ViewBag.FullName = FullName;
                ViewBag.UserID = UserID;
                List<Order> orders = new List<Order>();
                orders = context.Orders.Include(s => s.User).Include(s => s.Vehicle).Where(s => s.UserId == s.User.UserId && s.VehicleId == s.Vehicle.VehicleId&&DateTime.Compare(s.StartDate,DateTime.Now)<0).ToList();
                ViewBag.Orders = orders;
                return View();
            }
            return RedirectToAction("Login", "Login");

        }
        public IActionResult ListBookingByUser(int id)
        {
            String RoleID = HttpContext.Session.GetString("RoleID");
            String FullName = HttpContext.Session.GetString("FullName");
            String UserID = HttpContext.Session.GetString("UserID");
            ViewBag.RoleID = RoleID;
            ViewBag.FullName = FullName;
            ViewBag.UserID = UserID;
            ViewBag.id = id;
            List<VehicleType> t = new List<VehicleType>();
            t = context.VehicleTypes.ToList();
            ViewBag.VehicleTypes = t;
            String UserName = HttpContext.Session.GetString("username");
            List<Order> orders = new List<Order>();
            if (id%2==1)
            {

                orders = context.Orders.Include(s => s.User).Include(s => s.Vehicle).Where(s => s.UserId == s.User.UserId && s.VehicleId == s.Vehicle.VehicleId && s.User.Username == UserName && DateTime.Compare(s.EndDate, DateTime.Now) >= 0).OrderBy(item => item.Vehicle.Model).ToList();
                ViewBag.Orders = orders;
               
            }
            else if (id%2==0)
            {
                orders = context.Orders.Include(s => s.User).Include(s => s.Vehicle).Where(s => s.UserId == s.User.UserId && s.VehicleId == s.Vehicle.VehicleId && s.User.Username == UserName && DateTime.Compare(s.EndDate, DateTime.Now) >= 0).OrderByDescending(item => item.Vehicle.Model).ToList();
                ViewBag.Orders = orders;
                
            }
            else
            {

                orders = context.Orders.Include(s => s.User).Include(s => s.Vehicle).Where(s => s.UserId == s.User.UserId && s.VehicleId == s.Vehicle.VehicleId && s.User.Username == UserName && DateTime.Compare(s.EndDate, DateTime.Now) >= 0).ToList();
                ViewBag.Orders = orders;
            }

            return View();
        }
        public IActionResult ListHistoryBookingByUser()
        {
            String RoleID = HttpContext.Session.GetString("RoleID");
            String FullName = HttpContext.Session.GetString("FullName");
            String UserID = HttpContext.Session.GetString("UserID");
            ViewBag.RoleID = RoleID;
            ViewBag.FullName = FullName;
            ViewBag.UserID = UserID;
            List<VehicleType> t = new List<VehicleType>();
            t = context.VehicleTypes.ToList();
            ViewBag.VehicleTypes = t;
            String UserName = HttpContext.Session.GetString("username");
            List<Order> orders = new List<Order>();
            orders = context.Orders.Include(s => s.User).Include(s => s.Vehicle).Where(s => s.UserId == s.User.UserId && s.VehicleId == s.Vehicle.VehicleId && s.User.Username == UserName && DateTime.Compare(s.EndDate, DateTime.Now) < 0&&s.Status=="Success").ToList();
            ViewBag.Orders = orders;
            return View();
        }

        public IActionResult RequestAccept(int id)
        {
            string stt = "Success";
            Order o = context.Orders.Where(x=>x.OrderId == id).FirstOrDefault();
            o.Status = stt;
            context.SaveChanges();
            return RedirectToAction("ListBooking", "Booking");
        }
        public IActionResult RequestUnaccept(int id)
        {
            string stt = "Unsuccess";
            Order o = context.Orders.Where(x => x.OrderId == id).FirstOrDefault();
            o.Status = stt;
            context.SaveChanges();
            return RedirectToAction("ListBooking", "Booking");
        }
        public IActionResult AddFeedBack(int id,int UserID)
        {
			String FullName = HttpContext.Session.GetString("FullName");
			ViewBag.FullName = FullName;
            var o = context.Orders.Include(s=>s.Vehicle).Include(s=>s.User).Where(s=>s.OrderId==id&&s.UserId==UserID&&s.VehicleId==s.Vehicle.VehicleId&&s.UserId==s.User.UserId).FirstOrDefault();
            ViewBag.Orders = o;
			return View();
        }
        public IActionResult AddFeedBackAccess(int OrderID, int UserID)
        {
            string Rate = HttpContext.Request.Form["rate"];
			string Comment = HttpContext.Request.Form["cmt"];
            Review r = new Review();
            r.OrderId = OrderID;
            r.UserId = UserID;
            r.Comment = Comment;
            r.Rating = Int32.Parse(Rate);
            r.ReviewDate = DateTime.Now;
            context.Add(r);
            context.SaveChanges();
			return RedirectToAction("Home", "Home");
		}
    }
}
