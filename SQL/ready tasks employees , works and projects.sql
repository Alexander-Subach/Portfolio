																																																	
Employees 																									
empId	employeeName	roleEmployee	place	phone 		
1	Leonid	                 Developer	                 123	55-89076																					
2	Mark	                 Designer	                 566	NULL																					
3	Kate	                 Tester	                 45	55-34566																					
4	Martin	                 Tester	                 678	55-66899	

CREATE TABLE Employees (
            empId serial not NULL,
            employeeName varchar,
            roleEmployee varchar,
            place varchar,
            phone varchar,
            PRIMARY KEY(empId)
);				
INSERT INTO Employees (empId, employeeName, roleEmployee, place, phone )  
VALUES (1, 'Leonid', 'Developer', '123','55-89076'), 
(2, 'Mark', 'Designer', '566'. NULL),
(3, 'Kate', 'Tester', '45','55-34566'),
(4, 'Martin', 'Tester', '678','55-66899');																																			
																																																	
Works 																									
workId	employeeName	roleEmployee	projectName	workload 		
1	Anna	                 Tester	                 Deposit	                  40																					
2	Leonid	                 Developer	                 Credits	                  50																					
3	Anna	                 Team Lead	                 Insurance	                  20																					
4	Martin	                 Tester	                 Credits	                  100

CREATE TABLE Works (
           workId serial not null,
           employeeName VARCHAR,
           roleEmployee VARCHAR,
           projectName VARCHAR,
           workload INT,
  PRIMARY KEY(workId)
);				
INSERT INTO Works (workId, employeeName, roleEmployee, projectName, workload )  
VALUES (1, 'Anna', 'Tester', 'Deposit', 40), 
(2, 'Leonid', 'Developer', 'Credits', 50),
(3, 'Alla', 'Team Lead', 'Insurance', 20),
(4, 'Martin', 'Tester', 'Credits', 100);																																				
																																																	
Projects																									
projectId	projectName	productOwner	duration 			
1	Business	                  Autoline	                 5																						
2	Credits	                  Bank	                 2																						
3	Insurance	                  Life	                10																						
4	Deposit	                  External	                14

CREATE TABLE Projects (
           projectId serial not NULL,
           projectName varchar,
           productOwner varchar,
           duration int,
           PRIMARY KEY(projectId)
);
				
INSERT INTO Projects (projectId, projectName, productOwner, duration)  
VALUES (1, ' Business', 'Autoline', 5), 
(2, 'Credits', 'Bank', 2),
(3, 'Insurance', 'Life',  10),
(4, 'Deposit', ' External', 14);																																					
																																																																											
1.Вывести всех сотрудников с ролью 'Tester'.																									
SELECT * FROM Employees WHERE roleEmployee = 'Tester';																									
2.Вывести заказчиков, у которых длительность проекта больше средней.																									
SELECT productowner FROM projects WHERE duration > (SELECT AVG(duration) FROM projects)																									
3. Вывести список всех сотрудников, заменив в значениях phone все '-' на '.'																									
SELECT employeeName, REPLACE (phone, '-', '.') AS phone
FROM Employees;																									
4. Получить отчет по сотрудникам с минимальной и максимальной загрузкой. Сортировать по максимальной загрузке по убыванию.																									
SELECT employeeName, MIN(workload) AS min_workload, MAX(workload) AS max_workload
FROM Works
GROUP BY employeeName
ORDER BY max_workload DESC;																									
5. Обновить данные для проекта с projectId равным 4 , проставить наименование заказчика с "External" на "Internal".																									
UPDATE Projects
SET productOwner = 'Internal'
WHERE projectId = 4;																									
6. Сгруппировать по названиям проектов и найти все группы, для которых определена общая сумма объема работы более 30%.																									
SELECT projectName, SUM(workload) AS total_workload
FROM Works
GROUP BY projectName
HAVING SUM(workload) > 30;																									
7. Вывести количество номеров телефонов сотрудников, у которых есть телефон.																									
SELECT COUNT(phone) 
FROM Employees
WHERE phone IS NOT NULL;																									
8. Посчитать количество сотрудников на проектах с длительностью от 2-х до 10-ти месяцев.																									
SELECT COUNT (employeeName) AS employee_count
FROM Works
JOIN Projects ON Works.projectName = Projects.projectName
 WHERE Projects.duration BETWEEN 2 AND 10																									
9. Вывести место сотрудника, где встречается цифра "6" в месте сотрудника, и сотрудник работает 2 месяца.																									
SELECT place
FROM Employees
JOIN Works ON Employees.employeeName = Works.employeeName 
JOIN Projects ON Works.projectName = Projects.projectName
WHERE place LIKE '%6%' AND Projects.duration = 2;																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									