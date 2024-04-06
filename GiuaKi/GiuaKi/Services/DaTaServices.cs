using Dapper;
using GiuaKi.Dto;
using GiuaKi.RequestModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Ordering.API.Models.Dtos;
using Ordering.API.Models.RequestModels;

namespace Ordering.API.Services;
    public interface DaTaServices
    {
    IEnumerable<object> NganhHoc { get; }

    List<NganhHocDto> GetDanhSachNganhHoc();
    int InsertNganhHoc(NganhHocModels NganhHocRequest);
    }

public class DatabaseService : DaTaServices
{
    private readonly string _connectionString;
    public DatabaseService(string connectionString)
    {
        _connectionString = connectionString;
    }

    public int InsertNganhHoc(NganhHocModels NganhHocRequest)
    {
        throw new NotImplementedException();
    }
    public List<NganhHocDto> GetDanhSachNganhHoc()
    {
        string sql = """
            SELECT MaNganh,TenNganh,MaBoMon
            FROM NganhHoc
            """;

        using var connection = GetConnection();

        return connection.Query<NganhHocDto>(sql).ToList();
    }

    private object GetConnection()
    {
        throw new NotImplementedException();
    }
}

