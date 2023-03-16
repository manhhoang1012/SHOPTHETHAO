using DEMODoAn.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEMODoAn.Controllers
{
    public class ProductController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        int iddm ;
        // GET: Product
        public ActionResult ListSanPham(int ? page)
        {
            if (page == null) page = 1;
            var all_SP = (from s in data.SanPhams select s).OrderBy(p=>p.giaban);
            int pageSize = 3;
            int pageNum = page ?? 1;
            return View(all_SP.ToPagedList(pageNum,pageSize));
        }

        public ActionResult AoQuan ()
        {
            var all_aoquan = (from s in data.SanPhams select s).Where(p => p.madanhmuc == 1);
            return View(all_aoquan);
        }

        public ActionResult Giay ()
        {
            var all_giay = (from s in data.SanPhams select s).Where(p => p.madanhmuc == 2);
            return View(all_giay);
        }

        public ActionResult PhuKien()
        {
            var all_phukien = (from s in data.SanPhams select s).Where(p => p.madanhmuc == 3);
            return View(all_phukien);
        }

        public ActionResult SamPhamTheoDanhMuc(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var listProduct = data.SanPhams.Where(p => p.madanhmuc == id);
            if (listProduct.Count() == 0)
            {
                return HttpNotFound();
            }
            
            
            Session["madanhmuc"] = (int)id;
            iddm = (int)id;
            ViewBag.MaLoaiSP = id;
            ViewBag.LoaiSP = data.DanhMucs.FirstOrDefault(p => p.madanhmuc == id).tendanhmuc;
            return View(listProduct.OrderBy(p => p.giaban));
        }


        public ActionResult Detail(int id)
        {
            var D_sp = data.SanPhams.Where(m => m.masanpham == id).First();
            return View(D_sp);
        }
       
    }
}