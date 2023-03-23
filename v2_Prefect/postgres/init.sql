CREATE TABLE constructors (
	constructorId smallint NOT NULL,
	constructorRef varchar(50) NOT NULL,
	name varchar(50) NOT NULL,
	nationality varchar(50) NOT NULL,
	url varchar(255) NOT NULL,
	PRIMARY KEY (constructorId)
);

CREATE TABLE circuits (
	circuitId smallint NOT NULL,
	circuitRef varchar(50) NOT NULL,
	name varchar(255) NOT NULL,
	location varchar(50) NOT NULL,
	country varchar(50) NOT NULL,
	lat float NOT NULL,
	lng float NOT NULL,
	alt smallint,
	url varchar(255) NOT NULL,
	PRIMARY KEY (circuitId)
);

CREATE TABLE drivers (
	driverId smallint NOT NULL,
	driverRef varchar(50) NOT NULL,
	number smallint,
	code varchar(10),
	forename varchar(50) NOT NULL,
	surname varchar(50)  NOT NULL,
	dob DATE NOT NULL,
	nationality varchar(50) NOT NULL,
	url varchar(255) NOT NULL,
	PRIMARY KEY (driverId)
);

CREATE TABLE seasons (
	year smallint NOT NULL,
	url varchar(255) NOT NULL,
	PRIMARY KEY (year)
);

CREATE TABLE races (
	raceId smallint NOT NULL,
	year smallint NOT NULL,
	round smallint NOT NULL,
	circuitId smallint NOT NULL,
	name varchar(100) NOT NULL,
	date DATE NOT NULL,
	time TIME(0),
	url varchar(255) NOT NULL,
	fp1_date DATE,
	fp1_time TIME(0),
	fp2_date DATE,
	fp2_time TIME(0),
	fp3_date DATE,
	fp3_time TIME(0),
	quali_date DATE,
	quali_time TIME(0),
	sprint_date DATE,
	sprint_time TIME(0),
	PRIMARY KEY (raceId)
);

CREATE TABLE constructor_results (
	constructorResultsId smallint NOT NULL,
	raceId smallint NOT NULL,
	constructorId smallint NOT NULL,
	points float NOT NULL,
	status varchar(10),
	PRIMARY KEY (constructorResultsId)
);

CREATE TABLE constructor_standings (
	constructorStandingsId smallint NOT NULL,
	raceId smallint NOT NULL,
	constructorId smallint NOT NULL,
	points float NOT NULL,
	position smallint NOT NULL,
	positionText varchar(3) NOT NULL,
	wins smallint NOT NULL,
	PRIMARY KEY (constructorStandingsId)
);

CREATE TABLE driver_standings (
	driverStandingsId int NOT NULL,
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	points float NOT NULL,
	position smallint NOT NULL,
	positionText varchar(255) NOT NULL,
	wins smallint NOT NULL,
	PRIMARY KEY (driverStandingsId)
);

CREATE TABLE lap_times (
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	lap smallint NOT NULL,
	position smallint NOT NULL,
	time varchar(10) NOT NULL,
	milliseconds int NOT NULL,
	PRIMARY KEY (raceId, driverId, lap)
);

CREATE TABLE pit_stops (
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	stop smallint NOT NULL,
	lap smallint NOT NULL,
	time TIME(0) NOT NULL,
	duration varchar(10) NOT NULL,
	milliseconds int NOT NULL,
	PRIMARY KEY (raceId, driverId, stop)
);

CREATE TABLE qualifying (
	qualifyId smallint NOT NULL,
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	constructorId smallint NOT NULL,
	number smallint NOT NULL,
	position smallint NOT NULL,
	q1 varchar(10),
	q2 varchar(10),
	q3 varchar(10),
	PRIMARY KEY (qualifyId)
);

CREATE TABLE results (
	resultId int NOT NULL,
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	constructorId smallint NOT NULL,
	number smallint NOT NULL,
	grid smallint NOT NULL,
	position smallint,
	positionText varchar(3) NOT NULL,
	positionOrder smallint NOT NULL,
	points float NOT NULL,
	laps smallint NOT NULL,
	time varchar(15),
	milliseconds int,
	fastestLap smallint,
	rank smallint,
	fastestLapTime varchar(15),
	fastestLapSpeed varchar(10),
	statusId smallint NOT NULL,
	PRIMARY KEY (resultId)
);

CREATE TABLE sprint_results (
	resultId int NOT NULL,
	raceId smallint NOT NULL,
	driverId smallint NOT NULL,
	constructorId smallint NOT NULL,
	number smallint NOT NULL,
	grid smallint NOT NULL,
	position smallint,
	positionText varchar(3) NOT NULL,
	positionOrder smallint NOT NULL,
	points float NOT NULL,
	laps smallint NOT NULL,
	time varchar(15),
	milliseconds int,
	fastestLap smallint,
	fastestLapTime varchar(15),
	statusId smallint NOT NULL,
	PRIMARY KEY (resultId)
);

CREATE TABLE status (
	statusId smallint NOT NULL,
	status varchar(255) NOT NULL,
	PRIMARY KEY (statusId)
);