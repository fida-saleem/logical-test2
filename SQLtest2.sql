use data;
select * from [dbo].[Sales_Data$]

select * from [dbo].[Sales_Data$] where OrderStatus='Completed';

select State , COUNT(distinct OrderID)as Total_Orders from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(Quantity)as Total_Quantity from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales)as Total_Sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(Profit)as Total_Profit from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales) / COUNT(distinct OrderID) from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State;

select State , sum(NetSales) as Total_Sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State having sum(NetSales)>1000000;

select State , sum(NetSales) as Total_Sales from [dbo].[Sales_Data$] where OrderStatus='Completed' group by State order by Total_Sales DESC;



--Question 2 — CTE: Top Customers by Sales


with CustomerSales as
(
    select CustomerID,CustomerName, SUM(NetSales) as TotalSales from [dbo].[Sales_Data$] where OrderStatus = 'Completed'GROUP BY CustomerID, CustomerName
)

select TOP 5 CustomerID, CustomerName, TotalSales from CustomerSales ORDER BY TotalSales DESC;



--Question 3 — Window Function: State Sales Ranking


select State , sum(NetSales) as Total_Sales,RANK() over (order by sum (NetSales) DESC) as Sales_Rank from [dbo].[Sales_Data$] where OrderStatus = 'Completed' GROUP BY State order by Sales_Rank;
