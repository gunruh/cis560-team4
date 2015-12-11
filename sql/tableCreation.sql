CREATE TABLE `movie`(
`mid` INT NOT NULL,
`mtitle` VARCHAR(50) NOT NULL,
`year` INT,
`length` VARCHAR(10),
PRIMARY KEY (`mid`)
);

CREATE TABLE `people`(
`pid` INT NOT NULL,
`pname` VARCHAR(50) NOT NULL,
PRIMARY KEY (`pid`)
);

CREATE TABLE `relation`(
`mid` INT NOT NULL,
`pid` INT NOT NULL,
`job` VARCHAR(10) NOT NULL,
PRIMARY KEY (`mid`, `pid`),
FOREIGN KEY(`mid`) REFERENCES movie(`mid`),
FOREIGN KEY(`pid`) REFERENCES people(`pid`)
);

CREATE TABLE `genre`(
`gid` INT NOT NULL,
`gname` VARCHAR(50) NOT NULL,
PRIMARY KEY (`gid`)
);

CREATE TABLE `moviegenre`(
`mid` INT NOT NULL,
`gid` INT NOT NULL,
PRIMARY KEY (`mid`, `gid`),
FOREIGN KEY(`mid`) REFERENCES movie(`mid`),
FOREIGN KEY(`gid`) REFERENCES genre(`gid`)
);

CREATE TABLE `user`(
`uid` INT NOT NULL,
`uname` VARCHAR(50) NOT NULL,
`upassword` VARCHAR(50) NOT NULL,
PRIMARY KEY (`uid`)
);

CREATE TABLE `review`(
`mid` INT NOT NULL,
`uid` INT NOT NULL,
`time` VARCHAR(50) NOT NULL,
`rev` VARCHAR(300) NOT NULL,
`rating` INT,
PRIMARY KEY (`mid`, `uid`, `time`),
FOREIGN KEY(`mid`) REFERENCES movie(`mid`),
FOREIGN KEY(`uid`) REFERENCES user(`uid`)
);

CREATE TABLE `like`(
`mid` INT NOT NULL,
`uid` INT NOT NULL,
PRIMARY KEY (`mid`, `uid`),
FOREIGN KEY(`mid`) REFERENCES movie(`mid`),
FOREIGN KEY(`uid`) REFERENCES user(`uid`)
);

CREATE TABLE `favourite`(
`uid` INT NOT NULL,
`gid` INT NOT NULL,
PRIMARY KEY (`uid`, `gid`),
FOREIGN KEY(`uid`) REFERENCES user(`uid`),
FOREIGN KEY(`gid`) REFERENCES genre(`gid`)
);

CREATE TABLE `MBTI`(
`MBTIcode` INT NOT NULL,
`MBTIname` VARCHAR(50) NOT NULL,
PRIMARY KEY (`MBTIcode`)
);

CREATE TABLE `genreMBTI`(
`gid` INT NOT NULL,
`MBTIcode` INT NOT NULL,
PRIMARY KEY (`gid`, `MBTIcode`),
FOREIGN KEY(`gid`) REFERENCES genre(`gid`),
FOREIGN KEY(`MBTIcode`) REFERENCES MBTI(`MBTIcode`)
);

CREATE TABLE `userMBTI`(
`uid` INT NOT NULL,
`MBTIcode` INT NOT NULL,
PRIMARY KEY (`uid`, `MBTIcode`),
FOREIGN KEY(`uid`) REFERENCES user(`uid`),
FOREIGN KEY(`MBTIcode`) REFERENCES MBTI(`MBTIcode`)
);
