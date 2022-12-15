# Business Tickets System
![](https://img.shields.io/badge/Oracle-SQL-red)
<img src="Change.png" width="1000px">
Change management is a business process in the field of IT that allows for the tracking, approval, and notification of important changes, as well as the determination of potential outages. 

Implementing a system for change management enables technicians to reference past changes, facilitating the identification and resolution of unintended consequences. For instance, if users encounter an issue with an enterprise application following a change made earlier in the week, the change management system can be consulted to determine whether the change may have caused the issue, and if necessary, the change can be reverted.

The project will involve tracking the change request throughout its lifecycle. There are several types of changes, each with corresponding risk and priority values that determine the type of request. The types of changes that will be included are Standard, Non-Standard, and Emergency. For each of these change types, risk and priority values are assigned to the change to determine if the action requires peer review or approval by the Change Management Board (CAB). 
- Standard changes are changes that occur on a regular basis and are low risk/low priority and can be performed after a single peer review. 
- Non-Standard changes are changes that do not occur on a regular basis and have a medium or high priority, in addition to a medium or high risk level. 
- Emergency changes are (by default) changes that require peer review and CAB approval due to the nature of the change. 

The primary actor in this change management process is the technician who submits the request and performs the action(s). The second actor is the peer-reviewer, who reviews and approves the change if necessary. Any major change that has a high risk and high priority must be approved by the change management board before the change request can be performed.

# Database Designs

<img src="ERD with UML notations.png" width="1000px">

# Example Reports

**Employees with the highest number of tickets.** The report shows the employee ID, their first, last name and the total number of tickets. It shows how employee_id 14 and 2 have each two tickets submitted. This type of report would be beneficial to see what employees are submitting multiple tickets as there may be issues with the system and we are seeing an increase in submissions. It can also shed light on whether some employees are having barriers in accessing the system or being able to complete their assignments. This is particularly important if we are seeing that particular employees have a large number of ticket requests as this may hinder productivity or delay a task.

```sql
select 
  ticket.employee_id, 
  employee.first_name, 
  employee.last_name, 
  count(ticket.employee_id) as num_of_tkts 
from 
  ticket 
  inner join employee on ticket.employee_id = employee.employee_id 
group by 
  ticket.employee_id, 
  employee.first_name, 
  employee.last_name;
```
<img src="Highest Tickets.png" width="500px">
