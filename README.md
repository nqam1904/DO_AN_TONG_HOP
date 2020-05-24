# DO_AN_TONG_HOP
Đồ án tổng hợp
1- tải sqlserver 2014
2- mở file script.sql nhấn f5 để tự động có database và dữ liệu mẫu + function băm mật khẩu
3- mở visual studio ( 2019) vào thư mục BatDongSan nhấn vào BatDongSan.sln dưới thư mục packages
4- chạy file lên góc phải cây thư mục kiếm file DATH.edmx và chuột phải delete
5- sau đó vào file web.config kéo xuống kiếm dòng: 
<connectionStrings>
    <add name="BDSEntities" connectionString="metadata=res://*/DATH.csdl|res://*/DATH.ssdl|res://*/DATH.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=DESKTOP-C4HM29V\SQLEXPRESS;initial catalog=BDS;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
</connectionStrings>
6- xóa từ dòng <add name ... để rỗng cặp thẻ connectionString
7- ở trên cùng chuột phải vào file BatDongSan có hình địa cầu xanh lá cây chọn mục add -> New items 
8- bấm vào mục data chọn ADO.NET entity Data Model đặt tên là DATH xong nhấn Add -> chọn EF Design form database
8- CHÚ Ý nhấn New Connection không nhấn dropdown sẽ đứng máy
9- mở sql server lên copy tên máy lúc khởi động chương trình sql server ví du: DESKTOP-C4HM29V\SQLEXPRESS
10- paste tên máy ra xong xuống dưới mục connect to a database chọn dropdown select or enter a database name -> chọn database BDS xong nhấn test connection.
11- thấy hiện chữ BDSEntities rồi nhấn next ( nếu không giống chữ BDSEntities liên hệ lại tôi để hỗ trợ)
12- có 3 checkbox chọn table với stored procedures and function xong nhấn finish khi hiện lên bảng diagram các bảng database nhấn vô vùng trống ko đụng vô bảng nào.
13- Nhấn ctrl + S để nó save lại mất khoản 35 - 40s sau khi quay xong nhấn ctrl + B hoặc ctrl + shift + B để nó build lại nếu báo success 1 error 0 
14- Chạy project ... DONE!
