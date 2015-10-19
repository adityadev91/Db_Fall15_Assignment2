CREATE TABLE YelpUser (
  YelpID varchar2(3) NOT NULL PRIMARY KEY,
  email varchar2(30),
  firstName varchar2(50),
  lastName varchar2(50),
  birthDate date,
  birthPlace varchar2(50),
  Gender char(1)
);

CREATE TABLE Reviews (
  reviewID varchar2(3) NOT NULL PRIMARY KEY,
  rating integer,
  author varchar2(3),
  publishDate date,
  rec_notrec char(1),
  businessID varchar2(3),
  votes_funny integer,
  votes_cool  integer,
  votes_useful integer
);

CREATE TABLE Business (
  businessID varchar2(3) NOT NULL PRIMARY KEY,
  businessName varchar2(50),
  businessStreet varchar2(40),
  businessCity varchar2(20),
  businessState char(2),
  businessZip integer,
  businessPhone char(14),
  reviewCount integer,
  businessCategoryID varchar2(5)
);

CREATE TABLE BusinessCategory (
  businessCategoryID varchar2(5) NOT NULL PRIMARY KEY,
  businessCategoryName varchar2(20)
);

CREATE TABLE FriendsList (
  YelpID VARCHAR(5),
  FriendID VARCHAR(5) NOT NULL,
  PRIMARY KEY (YelpID, FriendID)
);

CREATE TABLE ComplementFriendsList (
  YelpID VARCHAR(5),
  ComplementFriendID VARCHAR(5) NOT NULL,
  PRIMARY KEY (YelpID, ComplementFriendID)
);

CREATE TABLE VoterFriendsList (
  ReviewID VARCHAR(5),
  FriendID VARCHAR(5) NOT NULL,
  PRIMARY KEY (ReviewID, FriendID)
);

CREATE TABLE RecommendedReviewList (
  BusinessID VARCHAR(5),
  ReviewID VARCHAR(5) NOT NULL,
  PRIMARY KEY (BusinessID, ReviewID)
);

ALTER TABLE Business
ADD CONSTRAINT fk_perBusCat
FOREIGN KEY (businessCategoryID)
REFERENCES BusinessCategory(businessCategoryID) ON DELETE CASCADE;

ALTER TABLE Reviews
ADD CONSTRAINT fk_perBusRev
FOREIGN KEY (businessID)
REFERENCES Business(businessID) ON DELETE CASCADE;

ALTER TABLE Reviews
ADD CONSTRAINT fk_perUserRev
FOREIGN KEY (author)
REFERENCES YelpUser(YelpID) ON DELETE CASCADE;

ALTER TABLE FriendsList
ADD CONSTRAINT fk_perFrndID
FOREIGN KEY (YelpID)
REFERENCES YelpUser(YelpID) ON DELETE CASCADE;

ALTER TABLE ComplementFriendsList
ADD CONSTRAINT fk_perCompFrndID
FOREIGN KEY (YelpID)
REFERENCES YelpUser(YelpID) ON DELETE CASCADE;

ALTER TABLE VoterFriendsList
ADD CONSTRAINT fk_perVoteRevID
FOREIGN KEY (ReviewID)
REFERENCES Reviews(ReviewID) ON DELETE CASCADE;

ALTER TABLE RecommendedReviewList
ADD CONSTRAINT fk_perRecomBusID
FOREIGN KEY (BusinessID)
REFERENCES Business(BusinessID) ON DELETE CASCADE;



INSERT INTO YelpUser values('Y1','john@yahoo.com','John ','Smith',TO_DATE('12/12/92','MM/DD/YY'),'LAKE CITY,FL 32056 ','M');
INSERT INTO YelpUser values('Y2','juan@gmail.com','Juan ','Carlos',TO_DATE('02/07/88','MM/DD/YY'),'Adak,AK 99546','M');
INSERT INTO YelpUser values('Y3','Jane@gmail.com','Jane ','Chapel',TO_DATE('06/01/80','MM/DD/YY'),'VERNON HILLS,IL 60061','F');
INSERT INTO YelpUser values('Y4','adi@yahoo.com','Aditya','Awasthi',TO_DATE('04/12/64','MM/DD/YY'),'SAN FRANCISCO, CA 94102 ','M');
INSERT INTO YelpUser values('Y5','james@hotmail.com','James ','Williams',TO_DATE('05/05/91','MM/DD/YY'),'NEW YORK ,NY 10010','M');
INSERT INTO YelpUser values('Y6','mike@yahoo.com','Mike ','Brown',TO_DATE('03/01/88','MM/DD/YY'),'CEDAR FALLS, NC 27230','M');
INSERT INTO YelpUser values('Y7','bob@yahoo.com','Bob ','Jones',TO_DATE('02/19/70','MM/DD/YY'),'FISHERS ISLAND,NY 06390 ','M');
INSERT INTO YelpUser values('Y8','wei@gmail.com',' Wei ','Zhang',TO_DATE('03/18/75','MM/DD/YY'),'LAS VEGAS,NV 89030','F');
INSERT INTO YelpUser values('Y9','mark@gmail.com','Mark ','Davis',TO_DATE('11/02/45','MM/DD/YY'),'LOS ANGELES,CA 90007','M');
INSERT INTO YelpUser values('Y10','daniel@yahoo.com','Daniel  ','Garcia',TO_DATE('05/10/84','MM/DD/YY'),'CALDWELL,NJ 07004','M');
INSERT INTO YelpUser values('Y11','maria@hotmail.com','Maria','Rodriguez',TO_DATE('08/12/85','MM/DD/YY'),'LOS ANGELES,CA 90007','F');
INSERT INTO YelpUser values('Y12','freya@yahoo.com','Freya','Wilson',TO_DATE('10/05/90','MM/DD/YY'),'CLIFFSIDE PARK ,NJ 07010','F');
INSERT INTO YelpUser values('Y13','kell@gmail.com','Kelley','Abraham',TO_DATE('11/27/95','MM/DD/YY'),'REDONDO BEACH,CA 90278','F');
INSERT INTO YelpUser values('Y14','xiuying@yahoo.com','Xiuying ','Wang',TO_DATE('09/23/82','MM/DD/YY'),'ALLEMAN,IA 50007','F');
INSERT INTO YelpUser values('Y15','sahil@yahoo.com','Sahil','Gupta',TO_DATE('02/19/76','MM/DD/YY'),'AMHERST,MA 01004','M');
INSERT INTO YelpUser values('Y16','david@gmail.com','David','Atkinson',TO_DATE('01/02/92','MM/DD/YY'),'SANTA MONICA ,CA 90411','M');
INSERT INTO YelpUser values('Y17','qui@gmail.com','Qui','Liu',TO_DATE('03/13/79','MM/DD/YY'),'CHARLOTTE HALL ,MD 20622','F');
INSERT INTO YelpUser values('Y18','chris@yahoo.com','Chris ','Miller',TO_DATE('07/09/79','MM/DD/YY'),'PHOENIX, AZ 85009','M');
INSERT INTO YelpUser values('Y19','david@yahoo.co.in','David','Johnson',TO_DATE('06/23/81','MM/DD/YY'),' BELLEVUE,NE 68005','M');
INSERT INTO YelpUser values('Y20','alana@hotmail.com','Alana','Diaz',TO_DATE('09/15/93','MM/DD/YY'),'AMA ,LA  70031','F');
INSERT INTO YelpUser values('Y21','abner@gmail.com','Abner','Harris',TO_DATE('08/12/90','MM/DD/YY'),'SANTA CLARA, CA 95050','M');
INSERT INTO YelpUser values('Y22','abby@hotmail.com','Abby ','Garcia',TO_DATE('02/14/89','MM/DD/YY'),'SANTA CLARA, CA 95050','M');
INSERT INTO YelpUser values('Y23','alana@yahoo.com','Alana','Robinson',TO_DATE('04/07/84','MM/DD/YY'),'Santa Clara, CA 95053','F');
INSERT INTO YelpUser values('Y24','joanne@yahoo.com','Joanne','Lesniak',TO_DATE('04/08/84','MM/DD/YY'),'Santa Clara, CA 95050','F');
INSERT INTO YelpUser values('Y25','bethany@gmail.com','Bethany','Hughes',TO_DATE('04/08/84','MM/DD/YY'),'Santa Clara, CA 95051','F');





INSERT INTO BusinessCategory values('BCT1','Amusement Parks');
INSERT INTO BusinessCategory values('BCT2','Gymnastics');
INSERT INTO BusinessCategory values('BCT3','Architects');
INSERT INTO BusinessCategory values('BCT4','Windshield ');
INSERT INTO BusinessCategory values('BCT5','Breakfast and Brunch');
INSERT INTO BusinessCategory values('BCT6','Career Counseling');
INSERT INTO BusinessCategory values('BCT7','Coffee Shops');
INSERT INTO BusinessCategory values('BCT8','Food and More');
INSERT INTO BusinessCategory values('BCT9','Pool Cleaners');
INSERT INTO BusinessCategory values('BCT10','Bars');
INSERT INTO BusinessCategory values('BCT11','Burgers');




INSERT INTO Business values('B1','Big Surf','1500 N McClintock Dr','Tempe','AZ',85281,'(520) 622-6400',5,'BCT1');
INSERT INTO Business values('B2','AirBorne COFFEE','1515 Walsh Avenue','Santa Clara','CA',95050,'(408) 524-3580',3,'BCT2');
INSERT INTO Business values('B3','Pedley Richard Architect','2231 Schrock Road','Columbus','OH',43229,'(419)-244-5200',4,'BCT3');
INSERT INTO Business values('B4','Safelite AutoGlass','2080 West Chandler Blvd','Chandler','AZ',85224,'(520)-465-5225',2,'BCT4');
INSERT INTO Business values('B5','SMITH THOMSON ','1595 Spring Hill Road Suite 110','Vienna','VA',22182,'(855)-808-1480',3,'BCT5');
INSERT INTO Business values('B6','Bay Area Coffee Shop','1522 W. Sam Rayburn Dr.','Bonham','CA',95051,'(408)-876-7785',4,'BCT7');
INSERT INTO Business values('B7','China  Coffee Toffee ','2570 El Camino Real','Santa Clara','CA',95051,'(408)-261-9000',2,'BCT8');
INSERT INTO Business values('B8','Hastings Water Works','10331 Brecksville Rd','Brecksville','OH',44141,'(440)-832-7700',1,'BCT9');
INSERT INTO Business values('B9','Catch Your Big Break','2341 Roosevelt Ct','Santa Clara','CA',95051,'(408)-827-8383',5,'BCT6');
INSERT INTO Business values('B10','The Cinebar','20285 South Western Ave. Suite # 200','Torrance','CA',90501,'(408)-465-8308',1,'BCT10');
INSERT INTO Business values('B11','Coffee Bar and Bistro','2585 El Camino Real','Santa Clara','CA',95051,'(408)-465-8208',5,'BCT10');
INSERT INTO Business values('B12','Renegades','2515 Winceshter Road','Santa Clara','CA',95051,'(408)-465-8108',5,'BCT10');
INSERT INTO Business values('B13','Alexs 49er Inn','2232 Schrock Road','Columbus','OH',43229,'(419)-465-8018',4,'BCT10');
INSERT INTO Business values('B14','Red Stag Lounge','1031 Brecksville Rd.','Brecksville','OH',44141,'(419)-465-8028',3,'BCT10');
INSERT INTO Business values('B15','JJs Blues','331 Brecksville Rd.','Brecksville','OH',44141,'(419)-465-8108',3,'BCT10');
INSERT INTO Business values('B16','The Bears Cocktails','15 Spring Hill Road Suite 110','Vienna','VA',22182,'(844)-465-8028',3,'BCT10');
INSERT INTO Business values('B17','Trials Pub','95 Spring Hill Road Suite 110','Vienna','VA',22182,'(844)-465-8038',2,'BCT10');
INSERT INTO Business values('B18','Santa Cruz Wine Bar','25 Spring Hill Road Suite 110','Vienna','VA',22182,'(844)-465-8048',4,'BCT10');
INSERT INTO Business values('B19','Firehouse No 1 Gastropub','1501 N McClintock Dr','Tempe','AZ',85281,'(520)-465-8058',5,'BCT10');
INSERT INTO Business values('B20','Original Gravity Public House','1502 N McClintock Dr','Tempe','AZ',85281,'(520)-465-8068',3,'BCT10');
INSERT INTO Business values('B21','Hobees','90 Skyport Dr','San Jose','CA',95110,'(408)-465-8078',1,'BCT5');
INSERT INTO Business values('B22','Cafe Gourmet','80 N Market St','San Jose','CA',95113,'(408)-465-8088',1,'BCT5');
INSERT INTO Business values('B23','The Table','72 S 1st St','San Jose','CA',95113,'(408)-465-8908',1,'BCT5');
INSERT INTO Business values('B24','Top Nosh Café','69 N San Pedro St','San Jose','CA',95110,'(408)-465-8098',1,'BCT5');
INSERT INTO Business values('B25','Breakfast Place','30 E Santa Clara St','San Jose','CA',95113,'(408)-465-8808',1,'BCT5');
INSERT INTO Business values('B26','Cafe Rosalena','87 N San Pedro St','San Jose','CA',95110,'(408)-465-8708',1,'BCT5');
INSERT INTO Business values('B27','Southern Kitchen','100 W San Carlos St','San Jose','CA',95113,'(408)-465-8608',1,'BCT5');
INSERT INTO Business values('B28','Holders Country Inn','22 N Almaden Ave','San Jose','CA',95110,'(408)-465-8508',1,'BCT5');
INSERT INTO Business values('B29','Hobees Restaurant','1110 Willow St','San Jose','CA',95125,'(408)-465-8408',1,'BCT5');
INSERT INTO Business values('B30','Cafe San Jose','21 N 2nd St','San Jose','CA',95113,'(408)-465-8308',1,'BCT5');
INSERT INTO Business values('B31','Bill of Fare','96 S 1st St','San Jose','CA',95113,'(408)-465-8208',1,'BCT5');
INSERT INTO Business values('B32','Bills Café','16 S 2nd St','San Jose','CA',95113,'(408)-465-8108',1,'BCT5');
INSERT INTO Business values('B33','American Gymnastics Association','5847 San Felipe Suite 2400','Houston','TX',77057,'(432)-520-7647',1,'BCT2');
INSERT INTO Business values('B34','Dollamur Sport Surfaces','5850 San Felipe Suite 2400','Houston','TX',77057,'(432)-386-3125',1,'BCT2');
INSERT INTO Business values('B35','Connecticut Gymnastics','132 Terry Road','Hartford','CT',06105,'(203) 483-5896',1,'BCT2');
INSERT INTO Business values('B36','Sherleys Gymnastics','1132 Terry Road','Hartford','CT',06105,'(860) 522-2530',1,'BCT2');
INSERT INTO Business values('B37','In-N-Out Burger','380 South 9th Street','San Jose','CA',95112,'(408)-804-8782',1,'BCT11');
INSERT INTO Business values('B38','The Counter Santana Row','350 South 9th Street','San Jose','CA',95112,'(408)-804-8783',1,'BCT11');
INSERT INTO Business values('B39','Sliders','320 South 9th Street','San Jose','CA',95112,'(408)-804-8784',1,'BCT11');
INSERT INTO Business values('B40','Burger Barn','325 South 8th Street','San Jose','CA',95112,'(408)-804-8785',1,'BCT11');
INSERT INTO Business values('B41','The Habit Burger Grill','375 South 9th Street','San Jose','CA',95112,'(408)-804-8786',1,'BCT11');
INSERT INTO Business values('B42','Konjoe Burger Bar','355 South 8th Street','San Jose','CA',95112,'(408)-804-8787',1,'BCT11');





INSERT INTO Reviews values('R1',2,'Y1',TO_DATE('10/02/2007 09:11:17','MM/DD/YYYY HH24:MI:SS'),'R','B1',2,2,2);
INSERT INTO Reviews values('R2',5,'Y4',TO_DATE('10/02/2007 01:31:39','MM/DD/YYYY HH24:MI:SS'),'N','B4',3,2,1);
INSERT INTO Reviews values('R3',4,'Y2',TO_DATE('10/02/2007 09:10:54','MM/DD/YYYY HH24:MI:SS'),'R','B5',1,2,3);
INSERT INTO Reviews values('R4',5,'Y3',TO_DATE('10/02/2007 13:05:56','MM/DD/YYYY HH24:MI:SS'),'R','B4',2,3,1);
INSERT INTO Reviews values('R5',5,'Y6',TO_DATE('09/29/2007 10:38:25','MM/DD/YYYY HH24:MI:SS'),'R','B4',3,1,2);
INSERT INTO Reviews values('R6',5,'Y12',TO_DATE('09/29/2007 14:30:47','MM/DD/YYYY HH24:MI:SS'),'N','B4',1,4,2);
INSERT INTO Reviews values('R7',5,'Y5',TO_DATE('09/29/2007 03:52:25','MM/DD/YYYY HH24:MI:SS'),'N','B4',3,2,1);
INSERT INTO Reviews values('R8',4,'Y2',TO_DATE('09/28/2007 09:46:08','MM/DD/YYYY HH24:MI:SS'),'R','B14',2,3,3);
INSERT INTO Reviews values('R9',1,'Y1',TO_DATE('09/29/2007 13:45:00','MM/DD/YYYY HH24:MI:SS'),'N','B11',3,1,3);
INSERT INTO Reviews values('R10',1,'Y2',TO_DATE('09/30/2007 05:12:29','MM/DD/YYYY HH24:MI:SS'),'R','B18',3,1,1);
INSERT INTO Reviews values('R11',2,'Y1',TO_DATE('09/29/2007 16:06:00','MM/DD/YYYY HH24:MI:SS'),'R','B13',3,3,1);
INSERT INTO Reviews values('R12',4,'Y1',TO_DATE('10/02/2007 14:28:20','MM/DD/YYYY HH24:MI:SS'),'N','B16',5,2,1);
INSERT INTO Reviews values('R13',5,'Y2',TO_DATE('09/27/2007 11:00:33','MM/DD/YYYY HH24:MI:SS'),'N','B24',4,5,3);
INSERT INTO Reviews values('R14',5,'Y14',TO_DATE('10/02/2007 02:45:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',3,3,1);
INSERT INTO Reviews values('R15',3,'Y1',TO_DATE('09/29/2007 16:08:39','MM/DD/YYYY HH24:MI:SS'),'R','B33',2,2,3);
INSERT INTO Reviews values('R16',2,'Y1',TO_DATE('09/29/2007 16:45:34','MM/DD/YYYY HH24:MI:SS'),'R','B1',1,2,3);
INSERT INTO Reviews values('R17',4,'Y2',TO_DATE('09/25/2007 17:18:31','MM/DD/YYYY HH24:MI:SS'),'R','B34',3,1,2);
INSERT INTO Reviews values('R18',5,'Y3',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',2,1,2);
INSERT INTO Reviews values('R19',1,'Y1',TO_DATE('10/01/2007 07:15:05','MM/DD/YYYY HH24:MI:SS'),'R','B35',1,2,2);
INSERT INTO Reviews values('R20',2,'Y2',TO_DATE('09/30/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B36',1,1,1);
INSERT INTO Reviews values('R21',2,'Y2',TO_DATE('10/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B19',1,1,2);
INSERT INTO Reviews values('R22',5,'Y4',TO_DATE('09/26/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',1,1,1);
INSERT INTO Reviews values('R23',5,'Y6',TO_DATE('09/26/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',1,1,1);
INSERT INTO Reviews values('R24',5,'Y7',TO_DATE('09/27/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',1,1,1);
INSERT INTO Reviews values('R25',5,'Y4',TO_DATE('09/28/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B4',1,1,1);
INSERT INTO Reviews values('R26',5,'Y12',TO_DATE('10/29/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R27',5,'Y5',TO_DATE('09/30/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R28',5,'Y14',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R29',5,'Y6',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R30',5,'Y5',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R31',5,'Y6',TO_DATE('10/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R32',5,'Y14',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R33',5,'Y6',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R34',5,'Y12',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R35',5,'Y14',TO_DATE('10/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R36',5,'Y12',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R37',5,'Y12',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B10',1,1,1);
INSERT INTO Reviews values('R38',5,'Y13',TO_DATE('10/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R39',5,'Y20',TO_DATE('09/30/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R40',5,'Y16',TO_DATE('09/29/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R41',5,'Y3',TO_DATE('09/28/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R42',5,'Y8',TO_DATE('09/27/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R43',5,'Y8',TO_DATE('09/26/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R44',5,'Y10',TO_DATE('09/25/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R45',5,'Y7',TO_DATE('09/24/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R46',5,'Y20',TO_DATE('09/23/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R47',5,'Y17',TO_DATE('09/22/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R48',5,'Y18',TO_DATE('09/21/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R49',5,'Y13',TO_DATE('09/20/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B21',1,1,1);
INSERT INTO Reviews values('R50',4,'Y20',TO_DATE('09/19/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B22',1,1,1);
INSERT INTO Reviews values('R51',3,'Y16',TO_DATE('09/18/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B23',1,1,1);
INSERT INTO Reviews values('R52',1,'Y3',TO_DATE('09/17/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B24',1,1,1);
INSERT INTO Reviews values('R53',2,'Y8',TO_DATE('09/16/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B25',1,1,1);
INSERT INTO Reviews values('R54',4,'Y8',TO_DATE('09/15/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B26',1,1,1);
INSERT INTO Reviews values('R55',5,'Y10',TO_DATE('09/14/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B27',1,1,1);
INSERT INTO Reviews values('R56',1,'Y7',TO_DATE('09/13/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B28',1,1,1);
INSERT INTO Reviews values('R57',3,'Y20',TO_DATE('09/12/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B29',1,1,1);
INSERT INTO Reviews values('R58',5,'Y17',TO_DATE('09/11/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B30',1,1,1);
INSERT INTO Reviews values('R59',2,'Y18',TO_DATE('09/10/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B31',1,1,1);
INSERT INTO Reviews values('R60',2,'Y8',TO_DATE('09/09/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B32',1,1,1);
INSERT INTO Reviews values('R61',5,'Y8',TO_DATE('09/08/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B21',1,1,1);
INSERT INTO Reviews values('R62',4,'Y10',TO_DATE('09/07/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B22',1,1,1);
INSERT INTO Reviews values('R63',3,'Y7',TO_DATE('09/06/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B23',1,1,1);
INSERT INTO Reviews values('R64',1,'Y20',TO_DATE('09/05/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B24',1,1,1);
INSERT INTO Reviews values('R65',2,'Y16',TO_DATE('09/04/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B25',1,1,1);
INSERT INTO Reviews values('R66',4,'Y3',TO_DATE('09/03/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B26',1,1,1);
INSERT INTO Reviews values('R67',5,'Y8',TO_DATE('09/02/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B27',1,1,1);
INSERT INTO Reviews values('R68',1,'Y3',TO_DATE('10/02/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B37',1,1,1);
INSERT INTO Reviews values('R69',2,'Y4',TO_DATE('10/02/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B38',1,1,1);
INSERT INTO Reviews values('R70',3,'Y5',TO_DATE('10/02/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B39',1,1,1);
INSERT INTO Reviews values('R71',3,'Y6',TO_DATE('05/01/2011 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B40',1,1,1);
INSERT INTO Reviews values('R72',4,'Y7',TO_DATE('05/02/2011 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B41',1,1,1);
INSERT INTO Reviews values('R73',5,'Y8',TO_DATE('05/15/2007 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B42',1,1,1);
INSERT INTO Reviews values('R74',2,'Y9',TO_DATE('06/02/2011 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B39',1,1,1);
INSERT INTO Reviews values('R75',3,'Y10',TO_DATE('06/30/2011 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B40',1,1,1);
INSERT INTO Reviews values('R76',3,'Y11',TO_DATE('06/12/2011 17:15:00','MM/DD/YYYY HH24:MI:SS'),'N','B41',1,1,1);





INSERT INTO FriendsList values('Y1','Y2');
INSERT INTO FriendsList values('Y1','Y7');
INSERT INTO FriendsList values('Y1','Y9');
INSERT INTO FriendsList values('Y2','Y1');
INSERT INTO FriendsList values('Y2','Y6');
INSERT INTO FriendsList values('Y2','Y9');
INSERT INTO FriendsList values('Y2','Y16');
INSERT INTO FriendsList values('Y2','Y18');
INSERT INTO FriendsList values('Y3','Y6');
INSERT INTO FriendsList values('Y3','Y11');
INSERT INTO FriendsList values('Y3','Y5');
INSERT INTO FriendsList values('Y3','Y21');
INSERT INTO FriendsList values('Y4','Y7');
INSERT INTO FriendsList values('Y5','Y17');
INSERT INTO FriendsList values('Y5','Y15');
INSERT INTO FriendsList values('Y6','Y2');
INSERT INTO FriendsList values('Y6','Y15');
INSERT INTO FriendsList values('Y7','Y1');
INSERT INTO FriendsList values('Y7','Y4');
INSERT INTO FriendsList values('Y7','Y17');
INSERT INTO FriendsList values('Y8','Y13');
INSERT INTO FriendsList values('Y8','Y15');
INSERT INTO FriendsList values('Y8','Y6');
INSERT INTO FriendsList values('Y9','Y1');
INSERT INTO FriendsList values('Y9','Y2');
INSERT INTO FriendsList values('Y10','Y16');
INSERT INTO FriendsList values('Y10','Y3');
INSERT INTO FriendsList values('Y11','Y12');
INSERT INTO FriendsList values('Y12','Y11');
INSERT INTO FriendsList values('Y12','Y14');
INSERT INTO FriendsList values('Y13','Y8');
INSERT INTO FriendsList values('Y13','Y17');
INSERT INTO FriendsList values('Y14','Y12');
INSERT INTO FriendsList values('Y15','Y6');
INSERT INTO FriendsList values('Y15','Y8');
INSERT INTO FriendsList values('Y16','Y2');
INSERT INTO FriendsList values('Y16','Y10');
INSERT INTO FriendsList values('Y17','Y7');
INSERT INTO FriendsList values('Y17','Y19');
INSERT INTO FriendsList values('Y18','Y2');
INSERT INTO FriendsList values('Y18','Y20');
INSERT INTO FriendsList values('Y19','Y3');
INSERT INTO FriendsList values('Y19','Y1');
INSERT INTO FriendsList values('Y20','Y4');
INSERT INTO FriendsList values('Y20','Y9');
INSERT INTO FriendsList values('Y20','Y18');
INSERT INTO FriendsList values('Y21','Y1');
INSERT INTO FriendsList values('Y21','Y6');
INSERT INTO FriendsList values('Y22','Y5');
INSERT INTO FriendsList values('Y22','Y3');
INSERT INTO FriendsList values('Y23','Y10');
INSERT INTO FriendsList values('Y24','Y10');
INSERT INTO FriendsList values('Y25','Y10');





INSERT INTO ComplementFriendsList values('Y1','Y2');
INSERT INTO ComplementFriendsList values('Y1','Y7');
INSERT INTO ComplementFriendsList values('Y2','Y1');
INSERT INTO ComplementFriendsList values('Y2','Y6');
INSERT INTO ComplementFriendsList values('Y2','Y9');
INSERT INTO ComplementFriendsList values('Y4','Y7');
INSERT INTO ComplementFriendsList values('Y6','Y2');
INSERT INTO ComplementFriendsList values('Y6','Y15');
INSERT INTO ComplementFriendsList values('Y7','Y1');
INSERT INTO ComplementFriendsList values('Y7','Y4');
INSERT INTO ComplementFriendsList values('Y8','Y13');
INSERT INTO ComplementFriendsList values('Y9','Y1');
INSERT INTO ComplementFriendsList values('Y9','Y2');
INSERT INTO ComplementFriendsList values('Y11','Y12');
INSERT INTO ComplementFriendsList values('Y12','Y11');
INSERT INTO ComplementFriendsList values('Y13','Y8');
INSERT INTO ComplementFriendsList values('Y14','Y12');
INSERT INTO ComplementFriendsList values('Y15','Y6');
INSERT INTO ComplementFriendsList values('Y16','Y2 ');
INSERT INTO ComplementFriendsList values('Y17','Y7');
INSERT INTO ComplementFriendsList values('Y19','Y3');
INSERT INTO ComplementFriendsList values('Y20','Y9');




INSERT INTO VoterFriendsList values('R1','Y2');
INSERT INTO VoterFriendsList values('R2','Y7');
INSERT INTO VoterFriendsList values('R3','Y6');
INSERT INTO VoterFriendsList values('R3','Y9');
INSERT INTO VoterFriendsList values('R3','Y18');
INSERT INTO VoterFriendsList values('R4','Y6');
INSERT INTO VoterFriendsList values('R4','Y11');
INSERT INTO VoterFriendsList values('R4','Y5');
INSERT INTO VoterFriendsList values('R5','Y2');
INSERT INTO VoterFriendsList values('R5','Y15');
INSERT INTO VoterFriendsList values('R6','Y11');
INSERT INTO VoterFriendsList values('R6','Y14');
INSERT INTO VoterFriendsList values('R7','Y17');
INSERT INTO VoterFriendsList values('R7','Y15');
INSERT INTO VoterFriendsList values('R8','Y6');
INSERT INTO VoterFriendsList values('R8','Y9');
INSERT INTO VoterFriendsList values('R9','Y2');
INSERT INTO VoterFriendsList values('R10','Y18');
INSERT INTO VoterFriendsList values('R11','Y7');
INSERT INTO VoterFriendsList values('R11','Y2');
INSERT INTO VoterFriendsList values('R12','Y2');
INSERT INTO VoterFriendsList values('R12','Y7');
INSERT INTO VoterFriendsList values('R13','Y1');
INSERT INTO VoterFriendsList values('R13','Y6');
INSERT INTO VoterFriendsList values('R14','Y12');
INSERT INTO VoterFriendsList values('R15','Y7');
INSERT INTO VoterFriendsList values('R15','Y9');
INSERT INTO VoterFriendsList values('R16','Y2');
INSERT INTO VoterFriendsList values('R17','Y6');
INSERT INTO VoterFriendsList values('R17','Y9');
INSERT INTO VoterFriendsList values('R18','Y11');
INSERT INTO VoterFriendsList values('R19','Y2');
INSERT INTO VoterFriendsList values('R20','Y6');
INSERT INTO VoterFriendsList values('R21','Y9');
INSERT INTO VoterFriendsList values('R22','Y7');
INSERT INTO VoterFriendsList values('R23','Y2');
INSERT INTO VoterFriendsList values('R24','Y1');
INSERT INTO VoterFriendsList values('R25','Y7');
INSERT INTO VoterFriendsList values('R26','Y11');
INSERT INTO VoterFriendsList values('R27','Y17');
INSERT INTO VoterFriendsList values('R28',' Y3');
INSERT INTO VoterFriendsList values('R29','Y2');
INSERT INTO VoterFriendsList values('R30','Y17');
INSERT INTO VoterFriendsList values('R30','Y15');
INSERT INTO VoterFriendsList values('R31','Y1');
INSERT INTO VoterFriendsList values('R32','Y12');
INSERT INTO VoterFriendsList values('R33','Y2');
INSERT INTO VoterFriendsList values('R34','Y11');
INSERT INTO VoterFriendsList values('R34','Y14');
INSERT INTO VoterFriendsList values('R35','Y12');
INSERT INTO VoterFriendsList values('R36','Y11');
INSERT INTO VoterFriendsList values('R37','Y14');
INSERT INTO VoterFriendsList values('R38','Y8');
INSERT INTO VoterFriendsList values('R39','Y24');
INSERT INTO VoterFriendsList values('R40','Y10');
INSERT INTO VoterFriendsList values('R41','Y21');
INSERT INTO VoterFriendsList values('R42','Y13');
INSERT INTO VoterFriendsList values('R43','Y15');
INSERT INTO VoterFriendsList values('R44','Y16');
INSERT INTO VoterFriendsList values('R45','Y22');
INSERT INTO VoterFriendsList values('R46','Y23');
INSERT INTO VoterFriendsList values('R47','Y19');
INSERT INTO VoterFriendsList values('R48','Y20');
INSERT INTO VoterFriendsList values('R49','Y18');
INSERT INTO VoterFriendsList values('R50','Y4');
INSERT INTO VoterFriendsList values('R51','Y2');
INSERT INTO VoterFriendsList values('R52','Y6');
INSERT INTO VoterFriendsList values('R53','Y6');
INSERT INTO VoterFriendsList values('R54','Y6');
INSERT INTO VoterFriendsList values('R55','Y3');
INSERT INTO VoterFriendsList values('R56','Y1');
INSERT INTO VoterFriendsList values('R57','Y4');
INSERT INTO VoterFriendsList values('R58','Y7');
INSERT INTO VoterFriendsList values('R59','Y2');
INSERT INTO VoterFriendsList values('R60','Y6');
INSERT INTO VoterFriendsList values('R61','Y6');
INSERT INTO VoterFriendsList values('R62','Y3');
INSERT INTO VoterFriendsList values('R63','Y4');
INSERT INTO VoterFriendsList values('R64','Y4');
INSERT INTO VoterFriendsList values('R65','Y2');
INSERT INTO VoterFriendsList values('R66','Y6');
INSERT INTO VoterFriendsList values('R67','Y6');
INSERT INTO VoterFriendsList values('R68','Y6');
INSERT INTO VoterFriendsList values('R69','Y7');
INSERT INTO VoterFriendsList values('R70','Y17');
INSERT INTO VoterFriendsList values('R71','Y2');
INSERT INTO VoterFriendsList values('R72','Y1');
INSERT INTO VoterFriendsList values('R73','Y6');
INSERT INTO VoterFriendsList values('R74','Y1');
INSERT INTO VoterFriendsList values('R75','Y3');
INSERT INTO VoterFriendsList values('R76','Y12');





INSERT INTO RecommendedReviewList values('B1','R1');
INSERT INTO RecommendedReviewList values('B1','R16');





