CREATE TABLE petPet (
    petname varchar (20) PRIMARY KEY,
    owner varchar (45), 
    species varchar (45),
    gender ENUM('M', 'F'),
    birth date, 
    death date,
)

CREATE TABLE petEvent (
    event_ID INT PRIMARY KEY AUTO_INCREMENT,
    petname varchar(20),
    eventdate date,
    eventtype varchar(15),
    remark varchar(255),
    FOREIGN KEY petname REFERENCES petPET(petname),
)
