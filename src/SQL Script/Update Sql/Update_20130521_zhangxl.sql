delete from ACC_PermissionGroupPermission where  PermissionId in(select id from ACC_Permission where Code='Url_OrderMstr_Distribution_ReturnShip')
delete from ACC_RolePermission where  PermissionId in(select id from ACC_Permission where Code='Url_OrderMstr_Distribution_ReturnShip')
delete from ACC_UserPermission where  PermissionId in(select id from ACC_Permission where Code='Url_OrderMstr_Distribution_ReturnShip')
delete from ACC_Permission where Code='Url_OrderMstr_Distribution_ReturnShip'
delete from [SYS_Menu] where Code ='Url_OrderMstr_Distribution_ReturnShip'

insert into SYS_Menu values('Url_Supplier_Print_FX80Hu','FX80件','Url_Supplier_Print',500,'FX80件','~/SupplierPrintHu/FX80HuIndex','~/Content/Images/Nav/Default.png',1)
go
insert into ACC_Permission values('Url_Supplier_Print_FX80Hu','FX80件条码','SupplierMenu')

