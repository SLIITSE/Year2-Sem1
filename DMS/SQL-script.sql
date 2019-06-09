-- Views
create view //

-- Funtions 
create Funtion getEmployeeSal(@did varchar) returns real
as
begin 
    declare @totSal real
    select @totSal = sum(salary)
    from emp e
    where e.did = @did
    return totSal
end

-- procedure 
create procedure increaseSalary(@pct float)
as 
begin
    update emp
    set salary = salary + salary * (pct/100)
end

-- stored procedure
create procedure get_stats(@did varchar(12), @maxm real output, @minm real output)
as
begin
    select @maxm = max(e.salary), @minm = min(e.salary)
    from dept d, works w, emp e
    where d.did = w.did and w.eid = e.eid and d.did = @did
end