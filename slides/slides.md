---
title: OSQuery: Query Your OS with SQL
author: Jeremiah Ellington
theme: gaia
paginate: true
---

# OSQuery
Query your OS like a database

---

## Why osquery?
- Unified SQL for Windows, macOS, Linux
- Great for IR, security, IT ops
- Fast, scriptable, automatable

---

## Quick demo
```sql
select version from osquery_info;
select * from os_version;
select name, pid from processes limit 10;
```

---

## Where next?
- Add Fleet/Orbit for management
- Ship logs to SIEM
- Build dashboards (Grafana/Kibana)
- Automate with scheduled queries
