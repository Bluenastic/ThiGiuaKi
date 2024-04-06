using System.ComponentModel.DataAnnotations;

namespace GiuaKi.RequestModels
{
    public class NganhHocModels
    {
        [Required]
        public string? MaNganh { get; set; }
        [StringLength(255)]
        public string? TenNganh { get; set; }
        [StringLength(255)]
        public string? TenBoMon { get; set; }
        public string? TenKhoa { get; set; }
    }
}
