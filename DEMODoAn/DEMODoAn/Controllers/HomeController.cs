using DEMODoAn.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DEMODoAn.Controllers
{
    public class HomeController : Controller
    { MyDataDataContext data = new MyDataDataContext();
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Home()
        {
            var listdanhmuc = data.DanhMucs.Take(3);
            ViewBag.listdanhmuc = listdanhmuc;
            var listsanpham = data.SanPhams.OrderBy(p => p.soluongton).Take(6);
            
            ViewBag.listsanpham = listsanpham;
            return View();
        }

       
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}