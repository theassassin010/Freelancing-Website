delete from freelancingDB.assigned_tasks;
delete from freelancingDB.has_tags;
delete from freelancingDB.bid;
delete from freelancingDB.tasks;
delete from freelancingDB.user;
delete from freelancingDB.has_skills;
delete from freelancingDB.freelancer;
delete from freelancingDB.tag;

insert into freelancingDB.user values ('10000', 'a','Sachin','Ramesh','Tendulkar','sachin@hotmail.com');
insert into freelancingDB.user values ('10001', 'b','Viru','Kumar','Sehwag','viru@gmail.com');
insert into freelancingDB.user values ('10002', 'c','Virat','Singh','Kohli','virat@yahoo.com');
insert into freelancingDB.user values ('10003', 'd','Mahendra','Singh','Dhoni','msd@hotmail.com');
insert into freelancingDB.user values ('10004', 'e','Yuvraj','Prasad','Sharma','yuvi@rediffmail.com');
insert into freelancingDB.user values ('10005', 'f','Anil','Srinivash','Kumble','kumble_anil@hotmail.com');

insert into freelancingDB.freelancer values ('1000', 'a', 'Sameer', 'Kumar', 'Mishra', 'sam@iitb.ac.in', '3');
insert into freelancingDB.freelancer values ('1001', 'b', 'John', 'Dean', 'Darko', 'johncena@hotmail.com', '2.55');
insert into freelancingDB.freelancer values ('1002', 'c', 'Zack', 'Jeffery', 'Efron', 'jeff.zack@iitk.ac.in', '4.13');
insert into freelancingDB.freelancer values ('1003', 'd', 'Christina', 'Halle', 'Barry', 'cute_chris@iitd.ac.in', '4.99');
insert into freelancingDB.freelancer values ('1004', 'e', 'Radhika', 'Kaur', 'Punjabi', 'kaur.radhika@gmail.com', '3.76');	

insert into freelancingDB.tasks values ('10', '10000', 'Android App Developement', 'I need an android app for my business,Preference to CSE B.Tech freelancers', '2022-12-30 10:14:15', '2023-01-13 00:14:15', '20000', '30000');
insert into freelancingDB.tasks values ('20', '10000', 'Website Developement', 'I need to make a ready to use website on for real estate company.Full description will be sent in response to the request', '2015-10-12 05:05:05', '2015-10-24 00:00:00', '35000', '40000');
insert into freelancingDB.tasks values ('30', '10001', 'Data Filling', 'I need someone to copy information from some websites','2016-10-12 05:05:05', '2016-10-24 00:00:00', '5000', '8000');
insert into freelancingDB.tasks values ('40', '10002', 'Photoshop Some Pictures', 'I lost my wallet and in that, I had invoices for my bills to my company and I need someone who is good with photo editing work', '2017-10-12 05:05:05', '2017-10-24 00:00:00', '10000', '15000');
insert into freelancingDB.tasks values ('50', '10003', 'Write Tech. Articles', 'We are looking for experienced content writers to write excellent vocabulary enriched and seo optimzed articles based on Linux tech guides and other Linux related article', '2018-10-12 05:05:05', '2018-10-24 00:00:00', '25000', '35000');
insert into freelancingDB.tasks values ('60', '10005', 'IOS App Developement', 'I want to Hire iOS expert who can complete my app in time.This is very urgent', '2019-10-12 05:05:05', '2019-10-24 00:00:00', '50000', '60000');
insert into freelancingDB.tasks values ('70', '10001', 'Website On Wordpress', 'I have already had a theme for wordpress. I just need to install everything, delete unnecessary things and customize some things on main page', '2021-10-12 05:05:05', '2021-10-24 00:00:00', '25000', '30000');
insert into freelancingDB.tasks values ('80', '10000', 'Design A Project', 'I need a 3D model of something. I have designed and modeled a small floating cabin in sketchup, I require someone to tidy it up and add some extra details like changing the balcony railing etc', '2012-10-12 05:05:05', '2012-10-24 00:00:00', '45000', '60000');
insert into freelancingDB.tasks values ('90', '10003', 'API Developer', 'I need help to show full Short Description of the product through Amazon Product Advertising API.', '2010-10-12 05:05:05', '2010-10-24 00:00:00', '30000', '35000');

insert into freelancingDB.assigned_tasks values ('10', '1000', '2010-12-30 10:14:15', 'working');	
insert into freelancingDB.assigned_tasks values ('20', '1000', '2009-12-30 10:14:15', 'assigned');
insert into freelancingDB.assigned_tasks values ('30', '1001', '2020-12-30 10:14:15', 'completed');
insert into freelancingDB.assigned_tasks values ('40', '1002', '2013-12-30 10:14:15', 'working');
insert into freelancingDB.assigned_tasks values ('50', '1004', '2006-12-30 10:14:15', 'assigned');	
insert into freelancingDB.assigned_tasks values ('70', '1002', '2008-12-30 10:14:15', 'completed');

insert into freelancingDB.bid values ('10', '1000', '2010-12-30 10:14:15', '20000');
insert into freelancingDB.bid values ('10', '1002', '2015-12-30 10:14:15', '30000');
insert into freelancingDB.bid values ('10', '1004', '2034-12-30 10:14:15', '27000');
insert into freelancingDB.bid values ('20', '1000', '2009-12-30 10:14:15', '35500');	
insert into freelancingDB.bid values ('20', '1001', '2010-12-30 10:14:15', '40000');
insert into freelancingDB.bid values ('30', '1000', '2045-12-30 10:14:15', '8000');
insert into freelancingDB.bid values ('30', '1004', '2034-12-30 10:14:15', '7000');
insert into freelancingDB.bid values ('30', '1001', '2020-12-30 10:14:15', '6000');
insert into freelancingDB.bid values ('40', '1000', '2022-12-30 10:14:15', '14000');
insert into freelancingDB.bid values ('40', '1002', '2013-12-30 10:14:15', '11000');
insert into freelancingDB.bid values ('40', '1003', '2014-12-30 10:14:15', '15000');
insert into freelancingDB.bid values ('50', '1001', '2005-12-30 10:14:15', '29000');
insert into freelancingDB.bid values ('50', '1002', '2007-12-30 10:14:15', '32000');
insert into freelancingDB.bid values ('50', '1004', '2006-12-30 10:14:15', '27000');
insert into freelancingDB.bid values ('60', '1000', '2010-01-30 10:14:15', '60000');
insert into freelancingDB.bid values ('70', '1000', '2002-12-30 10:14:15', '30000');
insert into freelancingDB.bid values ('70', '1001', '2012-12-30 10:14:15', '29000');
insert into freelancingDB.bid values ('70', '1002', '2008-12-30 10:14:15', '25000');
insert into freelancingDB.bid values ('70', '1003', '2033-12-30 10:14:15', '25500');
insert into freelancingDB.bid values ('80', '1004', '2011-12-30 10:14:15', '50000');
insert into freelancingDB.bid values ('80', '1003', '2019-12-30 10:14:15', '45000');
insert into freelancingDB.bid values ('90', '1004', '2032-12-30 10:14:15', '35000');
insert into freelancingDB.bid values ('90', '1001', '2011-12-29 10:14:15', '30000');
insert into freelancingDB.bid values ('90', '1003', '2010-02-28 10:14:15', '31000');	

insert into freelancingDB.tag values ('100', 'C++');
insert into freelancingDB.tag values ('101', 'C');
insert into freelancingDB.tag values ('102', 'Java');
insert into freelancingDB.tag values ('103', 'Python');
insert into freelancingDB.tag values ('104', 'SQL');
insert into freelancingDB.tag values ('105', 'AngularJS');
insert into freelancingDB.tag values ('106', 'PHP');
insert into freelancingDB.tag values ('107', 'Ruby');
insert into freelancingDB.tag values ('108', 'Photoshop');
insert into freelancingDB.tag values ('109', 'HTML');
insert into freelancingDB.tag values ('110', 'Bash');
insert into freelancingDB.tag values ('111', 'Excel');
insert into freelancingDB.tag values ('112', 'Android/IOS');	
insert into freelancingDB.tag values ('113', 'Linux');
insert into freelancingDB.tag values ('114', '3D-Modelling');
insert into freelancingDB.tag values ('115', 'API');
insert into freelancingDB.tag values ('116', 'Wordpress');	

insert into freelancingDB.has_tags values ('10', '112');	
insert into freelancingDB.has_tags values ('10', '102');
insert into freelancingDB.has_tags values ('10', '109');
insert into freelancingDB.has_tags values ('20', '102');	
insert into freelancingDB.has_tags values ('20', '106');
insert into freelancingDB.has_tags values ('20', '109');
insert into freelancingDB.has_tags values ('30', '111');
insert into freelancingDB.has_tags values ('40', '108');
insert into freelancingDB.has_tags values ('50', '113');
insert into freelancingDB.has_tags values ('50', '110');
insert into freelancingDB.has_tags values ('60', '112');
insert into freelancingDB.has_tags values ('70', '116');
insert into freelancingDB.has_tags values ('80', '114');	
insert into freelancingDB.has_tags values ('90', '115');	

insert into freelancingDB.has_skills values ('1000', '100');
insert into freelancingDB.has_skills values ('1000', '112');
insert into freelancingDB.has_skills values ('1000', '106');
insert into freelancingDB.has_skills values ('1000', '102');	
insert into freelancingDB.has_skills values ('1001', '111');
insert into freelancingDB.has_skills values ('1001', '115');
insert into freelancingDB.has_skills values ('1001', '100');
insert into freelancingDB.has_skills values ('1002', '108');
insert into freelancingDB.has_skills values ('1002', '116');	
insert into freelancingDB.has_skills values ('1002', '101');
insert into freelancingDB.has_skills values ('1003', '114');
insert into freelancingDB.has_skills values ('1003', '100');
insert into freelancingDB.has_skills values ('1003', '105');
insert into freelancingDB.has_skills values ('1003', '110');
insert into freelancingDB.has_skills values ('1004', '113');
insert into freelancingDB.has_skills values ('1004', '100');
insert into freelancingDB.has_skills values ('1004', '102');
	
