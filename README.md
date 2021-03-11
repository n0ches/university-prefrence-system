In this system, there are a list of students who will get into university according to their scores in university examination. Each university has information such as university_id, name, address, e-mail address, city, university type (state or private), year of foundation. Each university is made up of various faculties which have faculty_id, name, e-mail address. Under each faculty, a number of departments are placed and they have information such as department_id, name, e-mail address, language (English or Turkish), education type (formal (öö) or evening education (iö)), quota, the quota for top ranked students, education period, minimum score in 2019, minimum order in 2019. Students have personal identification number (ID), name, surname, examination score, the ranking of the student in the exam, the position of the student in high school (top ranked student or not), three university preferences of student (the department_id’s). The system will help students determine whether they can get into any department of a university or not.

a) Construct an ER diagram based on the preceding statements. Draw your diagram. Don’t forget to define the relationships, cardinalities, cardinality limits and participations (mandatory or optional).

b) Assign the attributes to the appropriate entities. Indicate primary key and foreign key attributes.

c) According to a and b, create your database and tables. Insert some sample meaningful example records to each table. Meaningful examples should at least to answer d’s queries. If we do not get results while testing your code with your examples, you will lose 5 points for each non-working query.

d) There are SQLs of the following queries:

    1) Find the university names which are located in the cities whose name starts
       with “İ” and founded after 1990.
    2) Find the universities which include “Engineering” and “Medicine” Faculties.
    3) Find the count of faculties according to university types.
    4) Find the departments that contain “engineering” and are the type of “iö”.
    5) Find the top five departments with the longest education period and the highest
       score.
    6) Find the most preferred 4-year departments.
    7) List the students who prefer the Department of Computer Engineering as their
       first choice according to their exam score in a descending order.
    8) Update the Faculty of Engineering in Dokuz Eylül University to be located in
       Izmir Technical University.
    9) Extend the current education period of the departments under the Faculty of
       Law by one year.
    10) Delete the faculties and departments in İzmir University.
