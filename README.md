                              # SQL queries #

## 1.  get all statuses, not repeating, alphabetically ordered

> SELECT DISTINCT status
> FROM tasks WHERE status is NOT null
> ORDERED BY status;

## 2.  get the count of all tasks in each project, order by tasks count descending

SELECT projects.id AS projects_id, projects.name AS projects_name, COUNT(tasks.id) AS task_count
FROM tasks LEFT JOIN projects ON tasks. projects_id = projects.id
GROUP BY projects_id, projects_name
ORDER BY task_count DESC;

## 3.  get the count of all tasks in each project, order by projects names

SELECT projects.id AS projects_id, projects.name AS projects_name, COUNT(tasks.id) AS task_count
FROM tasks LEFT JOIN projects ON tasks. projects_id = projects.id
GROUP BY projects_id, projects_name
ORDER BY projects_name;

## 4.  get the tasks for all projects having the name beginning with “N” letter

SELECT id, name
FROM tasks
WHERE name LIKE 'N%';

## 5.  get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL

SELECT projects.name AS projects_name, COUNT(tasks.id) AS tasks_count
FROM projects LEFT JOIN tasks ON projects.id=tasks. projects_id
WHERE projects.name LIKE '%a%'
GROUP BY list_name;

## 6.  get the list of tasks with duplicate names. Order alphabetically

SELECT tasks.name AS name, COUNT(t2.name) AS t_count
FROM tasks LEFT JOIN tasks AS t2 ON tasks.name=t2.name
GROUP BY tasks.name HAVING COUNT(t2.name) > 1;

## 7.  get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count

SELECT tasks.name AS task_name, COUNT(tasks.name) AS task_count
FROM tasks LEFT JOIN projects ON tasks. projects_id = projects.id
WHERE projects.name='Garage'
GROUP BY tasks.name
ORDER BY task_count;

## 8.  get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id

SELECT projects.name AS projects_name, COUNT(tasks.id) AS task_count
FROM projects LEFT JOIN tasks ON projects.id = tasks.projects_id
WHERE tasks.done='true'
GROUP BY project_name HAVING COUNT(tasks.id) > 10
GROUP BY projects_id;
