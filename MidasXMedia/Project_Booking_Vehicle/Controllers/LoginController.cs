using Microsoft.AspNetCore.Mvc;
using MidasXMedia.Models;
using TravelSystem_SWP391.DAO_Context;

namespace MidasXMedia.Controllers
{
    public class LoginController : Controller
    {
        DBvehicleContext context = new DBvehicleContext();
        DAO dal = new DAO();
        public IActionResult Login(int mess)
        {
            if (mess == 1)
            {
                ViewBag.mess1 = "Thông tin tài khoản không tồn tại , kiểm tra lại thông tin đăng nhập";
            }
            else if (mess == 2)
            {
                ViewBag.mess1 = "Vui lòng đăng nhập trước khi thao tác";
            }
            else if (mess == 3)
            {
                ViewBag.mess1 = "This email has been registered !!!";
            }
            else if (mess == 4)
            {
                ViewBag.mess1 = "Account registration successful !!!";
            }
            else
            {
                ViewBag.mess1 = "";
            }
            return View();
        }
        public ActionResult LoginAccess()
        {
            String Username = "";
            Username = HttpContext.Request.Form["username"];
            String Pass = "";
            Pass = HttpContext.Request.Form["pass"];
            User account = new User();
           
            account = dal.Login(Username, Pass);
            if (account != null)
            {
                HttpContext.Session.SetString("Email", account.Email.ToString());
                HttpContext.Session.SetString("FullName", account.FullName.ToString());
                HttpContext.Session.SetString("Phone", account.PhoneNumber.ToString());
                HttpContext.Session.SetString("username", account.Username.ToString());
                HttpContext.Session.SetString("RoleID", account.RoleId.ToString());
                HttpContext.Session.SetString("pass", account.Password.ToString());
				HttpContext.Session.SetString("UserID", account.UserId.ToString());
				//HttpContext.Session.SetString("Image", account.Image.ToString());






				//HttpContext.Session.SetString("accID", account.Image.ToString());
				//HttpContext.Session.SetString("chucvu", account.RoleId.ToString());
				return RedirectToAction("Home", "Home");
            }
            else
            {
                return RedirectToAction("Login", "Login", new { mess = 1 });
            }


        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Home", "Home");
        }
        public IActionResult Register()
        {
           
            return View();
        }

    }
}
