EXEC summary_order_status
@StatusID = 1;

CREATE PROCEDURE summary_order_status
    @StatusID INT
AS
BEGIN
    SELECT
        f.OrderId AS OrderID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        p.ProductName AS ProductName,
        f.Quantity AS Quantity,
        s.StatusOrder AS StatusOrder
    FROM
        FactSalesOrder f
    INNER JOIN
        DimCustomer c ON f.CustomerId = c.CustomerId
    INNER JOIN
        DimProduct p ON f.ProductId = p.ProductId
    INNER JOIN
        DimStatusOrder s ON f.StatusId = s.StatusId
    WHERE
        f.StatusId = @StatusID
END