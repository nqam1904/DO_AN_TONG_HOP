using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BatDongSan.Controllers
{
    public class VinhController : ApiController
    {
        [HttpGet]
        public string test()
        {
            return "ok";
        }
    }
}
