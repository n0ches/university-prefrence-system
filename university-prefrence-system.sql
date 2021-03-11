--drop database
drop database if exists db_College;

--create database
Create database db_College;


--drop table scripts to recreate tables.
Drop table if exists tbl_prefrences;
Drop table if exists tbl_students;
Drop table if exists tbl_departments;
Drop table if exists tbl_faculties;
Drop table if exists tbl_universities;

--create tables
Create table tbl_universities
(
	"universityID" serial NOT NULL,
	"universityName" varchar(100) NOT NULL,
	"universityAddress" varchar(200) NOT NULL,
	"universityEmail" varchar(100) NOT NULL,
	"universityCity" varchar(20) NOT NULL,
	"universityType" varchar(7) NOT NULL,
	"universityYear" int NOT NULL,
	CONSTRAINT "pk_universityID" PRIMARY KEY("universityID"),
	CONSTRAINT "un_universityName" UNIQUE("universityName"),
	CONSTRAINT "un_universityAddress" UNIQUE("universityAddress"),
	CONSTRAINT "un_universityEmail" UNIQUE("universityEmail")
);

Create table tbl_faculties(
	"university" int NOT NULL,
	"facultyID" serial NOT NULL,
	"facultyName" varchar(100) NOT NULL,
	"facultyEmail" varchar(200) NOT NULL,
	CONSTRAINT "pk_facultyID" PRIMARY KEY("facultyID"),
	CONSTRAINT "un_facultyEmail" UNIQUE("facultyEmail"),
	CONSTRAINT "fk_faculty_universityID" FOREIGN KEY("university")
REFERENCES tbl_universities("universityID") ON UPDATE CASCADE ON DELETE CASCADE		
);

Create table tbl_departments
(
	"faculty" int NOT NULL,
	"departmentID" serial NOT NULL,
	"departmentName" varchar(100) NOT NULL,
	"departmentEmail" varchar(200) NOT NULL,
	"departmentLang" varchar(7) NOT NULL
		check ("departmentLang" in ('English','Turkish')),
	"educationType" varchar(2) NOT NULL
		check ("educationType" in ('öö','iö')),
	"quota" int NOT NULL,
	"spec_quota" int,
	"period" int NOT NULL,
	"min_score" decimal(8,5) NOT NULL,
	"min_order" int NOT NULL,
	CONSTRAINT "pk_departmentID" PRIMARY KEY("departmentID"),
	CONSTRAINT "un_departmentEmail" UNIQUE("departmentEmail"),
	CONSTRAINT "un_min_score" UNIQUE("min_score"),
	CONSTRAINT "un_min_order" UNIQUE("min_order"),	
	CONSTRAINT "fk_department_facultyID" FOREIGN KEY("faculty")
REFERENCES tbl_faculties("facultyID") ON UPDATE CASCADE ON DELETE CASCADE	
);

Create table tbl_students
(
	"studentID" serial NOT NULL,
	"studentName" varchar(100) NOT NULL,
	"studentSurname" varchar(100) NOT NULL,
	"examScore" decimal(8,5) NOT NULL,
	"examRank" int NOT NULL,
	"top_ranked" varchar(3) NOT NULL
		check ("top_ranked" in ('Yes','No')),
	CONSTRAINT "pk_studentID" PRIMARY KEY("studentID"),
	CONSTRAINT "un_examScore" UNIQUE("examScore"),
	CONSTRAINT "un_examRank" UNIQUE("examRank")
);

Create table tbl_prefrences
(
	"student" int NOT NULL,
	"department" int NOT NULL,
	"prefrenceRank" int NOT NULL,
	CONSTRAINT "fk_prefrences_studentID" FOREIGN KEY("student")
REFERENCES tbl_students("studentID") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_prefrences_departmentID" FOREIGN KEY("department")
REFERENCES tbl_departments("departmentID") ON UPDATE CASCADE ON DELETE CASCADE
);


--insert script

/* INSERTING UNIVERSITIES */

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Dokuz Eylul University','DOKUZ EYLÜL ÜNİVERSİTESİ REKTÖRLÜĞÜ Cumhuriyet Bulvarı No: 144 35210 Alsancak','dokuzeyluluniversitesi@hs01.kep.tr','İzmir','State',1982);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Istanbul Technical University','İTÜ Ayazağa Kampüsü, Rektörlük Binası, 34469 Maslak','itu@hs01.kep.tr','İstanbul','State',1773);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Ege University','Ege Üniversitesi Rektörlüğü Gençlik Caddesi No:12 35040 Bornova','egeuniversitesi@egeuniversitesi.hs03.kep.tr','İzmir','State',1955);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Middle East Technical University','Üniversiteler Mahallesi, Dumlupınar Bulvarı No:1, 06800 Çankaya','odtu@hs01.kep.tr','Ankara','State',1956);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Hacettepe University','Hacettepe Üniversitesi Rektörlüğü, Sıhhiye','rektorluk@hacettepe.edu.tr','Ankara','State',1954);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Bogazici University','Boğaziçi Üniversitesi, 34342 Bebek','bogaziciuniversitesi@hs01.kep.tr','İstanbul','State',1863);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Bilkent University','Bilkent Üniversitesi, 06800 Bilkent','iletisim@bilkent.edu.tr','Ankara','Private',1984);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Koc University','Rumelifeneri Yolu, 34450 Sarıyer','information@ku.edu.tr','İstanbul','Private',1993);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Izmir University','İzmir Üniversitesi Rektörlüğü, Cumhuriyet Bulvarı No: 43, 35280 Alsancak','izmirüni@izü.edu.tr','İzmir','State',2007);

INSERT INTO tbl_universities("universityName","universityAddress","universityEmail","universityCity","universityType","universityYear")
VALUES ('Izmir Technical University','İzmir Teknik Üniversitesi Rektörlüğü, Cumhuriyet Bulvarı No: 16, 35240 Alsancak','izmirteknik@iztü.edu.tr','İzmir','State',2020);

/* INSERTING UNIVERSITIES */



/* INSERTING FACULTIES */

/* DEU */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (1,'Faculty of Engineering','muhendislik@deu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (1,'Faculty of Medicine','tip@deu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (1,'Faculty of Law','hukuk@deu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (1,'Faculty of Business Administration','isletme@deu.edu.tr');
/* DEU */

/* ITU */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (2,'Faculty of Computer and Informatics Engineering','bbf@itu.edu.tr');
/* ITU */

/* EGE */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (3,'Faculty of Engineering','dekansek@mail.ege.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (3,'Faculty of Medicine','tipdekanozelkalem@mail.ege.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (3,'Faculty of Science','fenfak@mail.ege.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (3,'Faculty of Economics and Administrative Sciences','iibf@mail.ege.edu.tr');
/* EGE */

/* ODTU */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (4,'Faculty of Engineering','engfac@metu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (4,'Faculty of Arts and Sciences','fefd@metu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (4,'Faculty of Architecture','archfac@metu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (4,'Faculty of Economic and Administrative Sciences','feas@metu.edu.tr');
/* ODTU */

/* HACETTEPE */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (5,'Faculty of Engineering','muhfak@hacettepe.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (5,'Faculty of Medicine','tipmaster@hacettepe.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (5,'Faculty of Law','hukukfakultesi@hacettepe.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (5,'Faculty of Economics and Administrative Sciences','iibfdekanlik@hacettepe.edu.tr');
/* HACETTEPE */


/* BOGAZICI */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (6,'Faculty of Engineering','engfac@boun.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (6,'Faculty of Arts and Sciences','anderson@boun.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (6,'Faculty of Economic and Administrative Sciences','feas@boun.edu.tr');
/* BOGAZICI */

/* BILKENT */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (7,'Faculty of Engineering','mf@bilkent.edu.trr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (7,'Faculty of Science','fen@bilkent.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (7,'Faculty of Law','hukuk@bilkent.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (7,'Faculty of Business','isletme@bilkent.edu.tr');
/* BILKENT */

/* KOC */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (8,'Faculty of Engineering','engineering@ku.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (8,'Faculty of Medicine','medicine@ku.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (8,'Faculty of Law','koclawschool@ku.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (8,'Faculty of Economic and Administrative Sciences','case@ku.edu.tr');
/* KOC */

/* IZMIR UNIV */
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (9,'Faculty of Engineering','engineering@izu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (9,'Faculty of Medicine','medicine@izu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (9,'Faculty of Law','hukuk@izu.edu.tr');
INSERT INTO tbl_faculties("university","facultyName","facultyEmail")
VALUES (9,'Faculty of Economic and Administrative Sciences','feas@izu.edu.tr');
/* IZMIR UNIV */

/* INSERTING FACULTIES */




/* INSERTING DEPARTMENTS */

	/* DEU */

		/* DEU MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (1,'Department of Computer Engineering','web@ceng.deu.edu.tr','English','öö',90,3,4,444.50262,33624);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (1,'Department of Mechanical Engineering','makina@deu.edu.tr','Turkish','öö',90,3,4,404.51675,61215);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (1,'Department of Civil Engineering','mail.insaat@deu.edu.tr','Turkish','iö',90,3,4,310.33033,168736);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (1,'Department of Electrical and Electronics Engineering','eee@deu.edu.tr','English','öö',90,3,4,430.99222,42308);
		/* DEU MUH */

		/* DEU TIP */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (2,'Department of Medicine','tip@deu.edu.tr','Turkish','öö',250,7,6,507.56468,4973);
		/* DEU TIP */

		/* DEU HUKUK */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (3,'Department of Law','hukuk@deu.edu.tr','Turkish','öö',460,12,4,418.27088,12971);
		/* DEU HUKUK */

		/* DEU ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (4,'Department of Business Administration','isletme@deu.edu.tr','English','öö',100,3,4,339.36376,118295);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (4,'Department of International Relations','ire@deu.edu.tr','English','öö',60,2,4,356.74158,83644);
		/* DEU ISLETME */

	/*DEU*/

	/*ITU*/

		/* ITU CENG */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (5,'Department of Computer Engineering','bbf@itu.edu.tr','English','öö',110,3,4,519.20048,2580);
		/* ITU CENG */

	/*ITU*/

	/*EGE*/

		/* EGE MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (6,'Department of Computer Engineering','bilmuh@mail.ege.edu.tr','Turkish','öö',100,3,4,448.14402,31379);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (6,'Department of Mechanical Engineering','makina@mail.ege.edu.tr','Turkish','öö',80,2,4,416.29693,52488);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (6,'Department of Civil Engineering','insaat@mail.ege.edu.tr','Turkish','öö',70,2,4,363.20572,97229);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (6,'Department of Electrical and Electronics Engineering','elokes@mail.ege.edu.tr','Turkish','iö',80,2,4,427.20551,44869);
		/* EGE MUH */

		/* EGE TIP */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (7,'Department of Medicine','tipdekanozelkalem@mail.ege.edu.tr','Turkish','öö',340,9,6,513.00249,3730);
		/* EGE TIP */

		/* EGE FEN */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (8,'Department of Physics','fizik@mail.ege.edu.tr','Turkish','öö',50,2,4,250.96555,339006);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (8,'Department of Biology','egebiyoloji1@gmail.com','Turkish','öö',120,3,4,256.44657,316138);
		/* EGE FEN */

		/* EGE ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (9,'Department of Business Administration','isletme@mail.ege.edu.tr','Turkish','öö',95,3,4,315.98458,179759);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (9,'Department of International Relations','ire@mail.ege.edu.tr','Turkish','öö',90,3,4,334.72585,129003);
		/* EGE ISLETME */

	/*EGE*/

	/*ODTU*/

		/* ODTU MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (10,'Department of Computer Engineering','ceng@metu.edu.tr','English','öö',105,3,4,526.62678,1488);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (10,'Department of Mechanical Engineering','me@metu.edu.tr','English','öö',190,5,4,505.67303,5435);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (10,'Department of Civil Engineering','cechair@metu.edu.tr','English','öö',180,5,4,433.48232,40603);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (10,'Department of Electrical and Electronics Engineering','eee@metu.edu.tr','English','öö',195,5,4,521.44610,2214);
		/* ODTU MUH */

		/* ODTU FEN */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (11,'Department of Physics','phys@metu.edu.tr','English','öö',90,3,4,419.42502,50184);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (11,'Department of Biology','biology@metu.edu.tr','English','öö',60,2,4,415.14466,53305);
		/* ODTU FEN */

		/* ODTU ARCH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (12,'Department of Architecture','bolum_baskanligi@arch.metu.edu.tr','English','öö',100,3,4,459.33576,24807);
		/* ODTU ARCH */

		/* ODTU ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (13,'Department of Business Administration','ba@metu.edu.tr','English','öö',90,3,4,452.87156,3090);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (13,'Department of International Relations','ire@metu.edu.tr','English','öö',80,2,4,429.62529,7927);
		/* ODTU ISLETME */

	/*ODTU*/

	/*HACETTEPE*/

		/* HACETTEPE MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (14,'Department of Computer Engineering','info@cs.hacettepe.edu.tr','English','öö',100,3,4,486.25401,11743);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (14,'Department of Mechanical Engineering','makina@hacettepe.edu.tr','English','öö',70,2,4,452.88788,28520);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (14,'Department of Civil Engineering','insaat@hacettepe.edu.tr','English','iö',70,2,4,382.82115,78855);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (14,'Department of Electrical and Electronics Engineering','info@ee.hacettepe.edu.tr','English','öö',100,3,4,476.16317,16067);
		/* HACETTEPE MUH */

		/* HACETTEPE TIP */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (15,'Department of Medicine','tipmaster@hacettepe.edu.tr','Turkish','öö',200,5,6,526.44195,1509);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (15,'Department of Medicine','tipmaster1@hacettepe.edu.tr','English','öö',160,4,6,532.21498,904);
		/* HACETTEPE TIP */

		/* HACETTEPE HUKUK */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (16,'Department of Law','hukukfakultesi@hacettepe.edu.tr','Turkish','öö',230,6,4,439.49177,5094);
		/* HACETTEPE HUKUK */

		/* HACETTEPE ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (17,'Department of Business Administration','isletmehacettepe@gmail.com','English','öö',100,3,4,363.67368,71734);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (17,'Department of International Relations','irmaster@hacettepe.edu.tr','English','öö',80,2,4,375.20395,54182);
		/* HACETTEPE ISLETME */

	/*HACETTEPE*/

	/*BOUN*/

		/* BOUN MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (18,'Department of Computer Engineering','buket.konak@boun.edu.tr','English','öö',80,2,4,538.75084,429);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (18,'Department of Mechanical Engineering','me@boun.edu.tr','English','öö',70,2,4,524.25913,1831);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (18,'Department of Civil Engineering','aydayse@boun.edu.tr','English','öö',70,2,4,475.58903,16308);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (18,'Department of Electrical and Electronics Engineering','aynur.isler@boun.edu.tr','English','öö',80,2,4,537.25739,533);
		/* BOUN MUH */

		/* BOUN FEN */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (19,'Department of Physics','mehtap.tinaz@boun.edu.tr','English','öö',60,2,4,476.64398,15835);
		/* BOUN FEN */

		/* BOUN ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (20,'Department of Business Administration','management@boun.edu.tr','English','öö',100,3,4,494.83535,542);
		/* BOUN ISLETME */

	/*BOUN*/

	/*BILKENT*/

		/* BILKENT MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (21,'Department of Computer Engineering','chair@cs.bilkent.edu.tr','English','öö',45,4,534.20194,722);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (21,'Department of Mechanical Engineering','me@bilkent.edu.tr','English','öö',27,4,517.81888,2811);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (21,'Department of Electrical and Electronics Engineering','chair@ee.bilkent.edu.tr','English','öö',45,4,535.82875,614);
		/* BILKENT MUH */

		/* BILKENT FEN */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (22,'Department of Physics','bilphys@fen.bilkent.edu.tr','English','öö',20,4,500.77190,6755);
		/* BILKENT FEN */

		/* BILKENT LAW */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (23,'Department of Law','hukuk@bilkent.edu.tr','Turkish','öö',16,4,521.01161,125);
		/* BILKENT LAW */

		/* BILKENT ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (24,'Department of Business Administration','ulku@bilkent.edu.tr','English','öö',20,4,480.77337,1040);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (24,'Department of International Relations','ir@bilkent.edu.tr','English','öö',14,4,476.12465,1274);
		/* BILKENT ISLETME */

	/*BILKENT*/

	/*KOC*/

		/* KOC MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (25,'Department of Computer Engineering','ceng@ku.edu.tr','English','öö',9,4,541.51566,281);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (25,'Department of Mechanical Engineering','me@ku.edu.tr','English','öö',9,4,530.98301,1021);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (25,'Department of Electrical and Electronics Engineering','eee@ku.edu.tr','English','öö',9,4,538.93994,415);
		/* KOC MUH */

		/* KOC TIP */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (26,'Department of Medicine','medicine@ku.edu.tr','English','öö',14,6,546.37277,108);
		/* KOC TIP */
		
		/* KOC HUKUK */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (27,'Department of Law','koclawschool@ku.edu.tr','Turkish','öö',13,4,523.04254,110);
		/* KOC HUKUK */

		/* KOC ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (28,'Department of Business Administration','ba@ku.edu.tr','English','öö',14,4,510.67006,237);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","period","min_score","min_order")
VALUES (28,'Department of International Relations','ir@ku.edu.tr','English','öö',9,4,498.49201,461);
		/* KOC ISLETME */

	/*IZMIR UNI*/

		/* IZMIR UNI MUH */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (29,'Department of Computer Engineering','ceng@izu.edu.tr','English','öö',70,2,4,464.29041,22043);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (29,'Department of Mechanical Engineering','makina@izu.edu.tr','Turkish','iö',60,2,4,313.74465,162654);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (29,'Department of Electrical and Electronics Engineering','elek@izu.edu.tr','English','öö',60,2,4,333.36488,132208);
		/* IZMIR UNI MUH */

		/* IZMIR UNI TIP */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (30,'Department of Medicine','tip@izu.edu.tr','Turkish','öö',80,2,6,481.98303,13468);
		/* IZMIR UNI TIP */
		
		/* IZMIR UNI HUKUK */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (31,'Department of Law','hukuk@izu.edu.tr','Turkish','öö',80,2,4,404.85674,21696);
		/* IZMIR UNI HUKUK */

		/* IZMIR UNI ISLETME */
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (32,'Department of Business Administration','isletme@izu.edu.tr','Turkish','öö',60,2,4,258.94288,458565);
INSERT INTO tbl_departments("faculty","departmentName","departmentEmail","departmentLang","educationType","quota","spec_quota","period","min_score","min_order")
VALUES (32,'Department of International Relations','ulusilis@izu.edu.tr','Turkish','öö',70,2,4,288.09528,286316);
		/* IZMIR UNI ISLETME */

	/*KOC*/

/* INSERTING DEPARTMENTS */

/* INSERTING STUDENTS */

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Rıdvan','Özdemir',425.52488,32105,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Kadir','Özdemir',380.234,64245,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Berkay','Yılmaz',482.23421,11345,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Hasan','Güney',427.42123,31250,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Emir Utku','Bican',418.32135,41562,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Furkan','Kümüştekin',481.12356,13421,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Mert','Erdem',392.12452,60536,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Furkan','Boncuk',429.42156,30539,'No');

INSERT INTO tbl_students("studentName","studentSurname","examScore","examRank","top_ranked")
VALUES ('Talha','Boncuk',403.42156,52089,'No');

/* INSERTING STUDENTS */

/* INSERTING PREFRENCES */

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (1,53,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (1,40,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (1,6,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (2,1,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (2,7,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (2,35,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (3,28,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (3,20,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (3,31,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (4,53,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (4,12,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (4,21,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (5,1,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (5,13,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (5,11,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (6,42,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (6,28,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (6,48,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (7,2,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (7,30,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (7,12,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (8,53,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (8,40,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (8,6,3);

INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (9,1,1);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (9,2,2);
INSERT INTO tbl_prefrences("student","department","prefrenceRank")
VALUES (9,30,3);

/* INSERTING PREFRENCES */

--sql answers

--querry 1
Select u.*
From tbl_universities as u
WHERE u."universityCity" LIKE 'İ%' and  u."universityYear" > 1990;
/*with using 'like'*/

/*firstly I answered the question with using 'like'but after the lab session, 
   I added the 'substring' method. They both returns same result*/

Select u.* 
From tbl_universities as u
WHERE lower(substring(u."universityCity",1,1)) ='i' and  u."universityYear" > 1990;
/*with using 'substring'*/


--querry 2
Select * 
From tbl_universities as u 
WHERE u."universityID" IN (
	Select f."university"
	From tbl_faculties as f 
	WHERE f."facultyName" LIKE '%Engineering%'
) and 
u."universityID" IN
(
	Select f."university"
	From tbl_faculties as f 
	WHERE (f."facultyName" LIKE '%Medicine%')
);


--querry 3
Select "universityType",
	COUNT(u."universityType") as "faculty count"
From tbl_universities as u
INNER JOIN tbl_faculties as f ON f."university" = u."universityID"
GROUP BY "universityType";


--querry 4
Select * 
From tbl_departments as d
WHERE LOWER(d."departmentName") LIKE '%engineering%' and d."educationType" = 'iö';


--querry 5
Select *
From tbl_departments
ORDER BY "period" desc,"min_score" desc
LIMIT 5;


--querry 6
Select d.*
  From (Select  "department"
    From   tbl_prefrences
    GROUP BY "department"
    ORDER BY COUNT(*) desc
    LIMIT    1
       ) as s
JOIN tbl_departments as d ON s."department" = d."departmentID";

/*from clause subquerry version*/

/*firstly I answered the question with from clause subquerry but after the lab session about the subquerries, 
	I added the 'where clause subquerry'. They both returns same result*/

Select d.*
From tbl_departments as d
WHERE d."departmentID" IN(
    Select  "department"
    From   tbl_prefrences
    GROUP BY "department"
    ORDER BY COUNT(*) DESC
    LIMIT    1
 );
/*where clause subquerry version*/


--queery 7
Select st.*
From tbl_students as st
WHERE st."studentID" IN(
	Select p."student"
	From tbl_prefrences as p
	WHERE p."department" IN (
		SELECT d."departmentID"
		From tbl_departments as d
		WHERE d."departmentName" LIKE '%Computer Engineering%'
	
	) 
	and p."prefrenceRank" = 1
)
ORDER BY "examScore" desc;


--querry 8
UPDATE tbl_faculties as f
Set "university" = ( Select u."universityID" 
		       From tbl_universities as u 
		       WHERE u."universityName" = 'Izmir Technical University')
WHERE f."university" = (select u."universityID" 
			  from tbl_universities as u 
			  WHERE u."universityName" = 'Dokuz Eylul University') 
and f."facultyName" = 'Faculty of Engineering';

--querry 9
UPDATE tbl_departments as d
Set "period" = d."period" +1
WHERE d."faculty" IN (Select f."facultyID" 
			From tbl_faculties as f  
			WHERE f."facultyName" = 'Faculty of Law');


--querry 10
DELETE From tbl_faculties as f
WHERE f."university" IN( Select u."universityID" 
			   from tbl_universities as u 
			   WHERE u."universityName" = 'Izmir University');




