-- Basic demo queries for osquery
select version from osquery_info;
select * from os_version;
select name, pid, path from processes limit 15;
select address, port, protocol, pid from listening_ports limit 15;
