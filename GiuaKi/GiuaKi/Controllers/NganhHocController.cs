using GiuaKi.Dto;
using Microsoft.AspNetCore.Mvc;
using Ordering.API.Services;
using System.Collections.Generic;

[Route("api/[controller]")]
[ApiController]
public class NganhHocController : ControllerBase
{
    private readonly DaTaServices _DaTaServices; 

    public NganhHocController(DaTaServices DaTaServices)
    {
        _DaTaServices = DaTaServices;
    }

    // GET: api/NganhHoc
    [HttpGet("DanhSachNganhHoc")]
    public ActionResult<IEnumerable<NganhHocDto>> GetDanhSachNganhHoc()
    {
        var danhSachNganhHoc = _DaTaServices.NganhHoc
            .Select(nganh => new NganhHocDto
            {
                MaNganh = nganh.MaNganh,
                TenNganh = nganh.TenNganh,
                TenBoMon = nganh.BoMon.TenBoMon,
                TenKhoa = nganh.BoMon.Khoa.TenKhoa
            })
            .ToList();

        return danhSachNganhHoc;
    }
}
