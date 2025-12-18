USE skillgapanalysis;
SHOW TABLES;

select * from employment_data_analysis_and_skill_gap_identification;

-- 1) Region-wise Employee Count
SELECT EmployeeRegion, COUNT(*) AS TotalEmployees
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY EmployeeRegion;

-- 2) Department wise Avg(Skill Score)
SELECT Department, AVG(SkillScore) AS AvgSkillScore
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY Department
ORDER BY AvgSkillScore DESC;

-- 3) Job Demand (Vacancy) in Industry
SELECT Industry, SUM(Vacancy) AS TotalOpenings
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY Industry
ORDER BY TotalOpenings DESC;

-- 4) Job Title vs. Employee Skill Score
SELECT JobTitle, AVG(SkillScore) AS AvgEmployeeSkill
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY JobTitle
ORDER BY AvgEmployeeSkill DESC;

-- 5) Training Effectiveness (Skill Improvement Score Average)
SELECT ProgramName, AVG(SkillImprovementScore) AS AvgSkillGain
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY ProgramName
ORDER BY AvgSkillGain DESC;

-- 6) Region-wise Job & Employee Availability Comparison
SELECT 
    Region,
    COUNT(JobID) AS TotalJobs,
    COUNT(EmployeeID) AS TotalEmployees
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY Region;

-- 7) Which Employees Are Underqualified for their Job 
SELECT 
	Name, JobTitle,
    YearsExperience , MinExperience
FROM employment_data_analysis_and_skill_gap_identification
WHERE YearsExperience < MinExperience;

-- 8) Employee Salary vs Job Salary Range Mismatch
SELECT 
    Name, JobTitle,
    Salary, SalaryRangeMin, SalaryRangeMax
FROM employment_data_analysis_and_skill_gap_identification
WHERE Salary < SalaryRangeMin 
   OR Salary > SalaryRangeMax;
   
-- 9) Most Popular Training Programs (Highest Enrollments)
SELECT ProgramName, EnrolledEmployees
FROM employment_data_analysis_and_skill_gap_identification
ORDER BY EnrolledEmployees DESC;

-- 10) Industry-wise Average Experience
SELECT Industry, AVG(YearsExperience) AS AvgExperience
FROM employment_data_analysis_and_skill_gap_identification
GROUP BY Industry
ORDER BY AvgExperience DESC;

-- 11) openings(vacaency) vs skill
SELECT 
    JobTitle,
    Avg(JobID) AS Total_Openings,
    Avg(SkillScore) AS Avg_Skill_Level
FROM 
    employment_data_analysis_and_skill_gap_identification
GROUP BY 
    JobTitle
ORDER BY 
    Total_Openings DESC;

-- 12) High demand but low supply sector 
SELECT
    Region,
    SUM(Vacancy) AS Total_Demand,
    COUNT(EmployeeID) AS Skilled_Supply
FROM 
    employment_data_analysis_and_skill_gap_identification
GROUP BY 
    Region
HAVING 
    SUM(Vacancy) > COUNT(EmployeeID);