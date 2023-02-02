CREATE TABLE 'circuits' (
	'circuitId' serial NOT NULL,
	'circuitRef' varchar(30) NOT NULL,
	'name' varchar(100) NOT NULL,
	'location' varchar(30) NOT NULL,
	'country' varchar(30) NOT NULL,
	'lat' FLOAT NOT NULL,
	'lng' FLOAT NOT NULL,
	'alt' smallint,
	'url' varchar(255) NOT NULL,
	PRIMARY KEY ('circuitId')
);

CREATE TABLE 'constructor_results' (
	'constructorResultsId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'constructorId' smallint NOT NULL,
	'points' tinyint NOT NULL,
	'status' varchar(10),
	PRIMARY KEY ('constructorResultsId')
);

CREATE TABLE 'constructor_standings' (
	'constructorStandingsId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'constructorId' smallint NOT NULL,
	'points' tinyint NOT NULL,
	'position' tinyint NOT NULL,
	'positionText' varchar(3) NOT NULL,
	'wins' tinyint NOT NULL,
	PRIMARY KEY ('constructorStandingsId')
);

CREATE TABLE 'constructors' (
	'constructorId' serial NOT NULL,
	'constructorRef' varchar(20) NOT NULL,
	'name' varchar(50) NOT NULL,
	'nationality' varchar(15) NOT NULL,
	'url' varchar(255) NOT NULL,
	PRIMARY KEY ('constructorId')
);

CREATE TABLE 'driver_standings' (
	'driverStandingsId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'driverId' smallint NOT NULL,
	'points' smallint NOT NULL,
	'position' tinyint NOT NULL,
	'positionText' varchar(3) NOT NULL,
	'wins' tinyint NOT NULL,
	PRIMARY KEY ('driverStandingsId')
);

CREATE TABLE 'drivers' (
	'driverId' serial NOT NULL,
	'driverRef' varchar(20) NOT NULL,
	'number' tinyint,
	'code' varchar(4),
	'forename' varchar(20) NOT NULL,
	'surname' varchar(20) NOT NULL,
	'dob' DATE NOT NULL,
	'nationality' varchar(15) NOT NULL,
	'url' varchar(255) NOT NULL,
	PRIMARY KEY ('driverId')
);

CREATE TABLE 'lap_times' (
	'raceId' serial NOT NULL,
	'driverId' smallint NOT NULL,
	'lap' smallint NOT NULL,
	'position' tinyint NOT NULL,
	'time' varchar(10) NOT NULL,
	'milliseconds' int NOT NULL,
	PRIMARY KEY ('raceId')
);

CREATE TABLE 'pit_stops' (
	'raceId' serial NOT NULL,
	'driverId' smallint NOT NULL,
	'stop' tinyint NOT NULL,
	'lap' smallint NOT NULL,
	'time' TIME NOT NULL,
	'duration' varchar(10) NOT NULL,
	'milliseconds' int NOT NULL,
	PRIMARY KEY ('raceId')
);

CREATE TABLE 'qualifying' (
	'qualifyId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'driverId' smallint NOT NULL,
	'constructorId' smallint NOT NULL,
	'number' smallint NOT NULL,
	'position' tinyint NOT NULL,
	'q1' varchar(10),
	'q2' varchar(10),
	'q3' varchar(10),
	PRIMARY KEY ('qualifyId')
);

CREATE TABLE 'races' (
	'raceId' serial NOT NULL,
	'year' smallint NOT NULL,
	'round' tinyint NOT NULL,
	'circuitId' smallint NOT NULL,
	'name' varchar(100) NOT NULL,
	'date' DATE NOT NULL,
	'time' TIME,
	'url' varchar(255) NOT NULL,
	'fp1_date' DATE,
	'fp1_time' TIME,
	'fp2_date' DATE,
	'fp2_time' TIME,
	'fp3_date' DATE,
	'fp3_time' TIME,
	'quali_date' DATE,
	'quali_time' TIME,
	'sprint_date' DATE,
	'sprint_time' TIME,
	PRIMARY KEY ('raceId')
);

CREATE TABLE 'results' (
	'resultId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'driverId' smallint NOT NULL,
	'constructorId' smallint NOT NULL,
	'number' tinyint NOT NULL,
	'grid' tinyint NOT NULL,
	'position' tinyint,
	'positionText' varchar(3) NOT NULL,
	'positionOrder' tinyint NOT NULL,
	'points' smallint NOT NULL,
	'laps' smallint NOT NULL,
	'time' varchar(15),
	'milliseconds' int,
	'fastestLap' smallint,
	'rank' tinyint,
	'fastestLapTime' varchar(15),
	'fastestLapSpeed' varchar(10),
	'statusId' smallint NOT NULL,
	PRIMARY KEY ('resultId')
);

CREATE TABLE 'seasons' (
	'year' serial NOT NULL,
	'url' varchar(255) NOT NULL,
	PRIMARY KEY ('year')
);

CREATE TABLE 'sprint_results' (
	'resultId' serial NOT NULL,
	'raceId' smallint NOT NULL,
	'driverId' smallint NOT NULL,
	'constructorId' smallint NOT NULL,
	'number' tinyint NOT NULL,
	'grid' tinyint NOT NULL,
	'position' tinyint,
	'positionText' varchar(3) NOT NULL,
	'positionOrder' tinyint NOT NULL,
	'points' smallint NOT NULL,
	'laps' smallint NOT NULL,
	'time' varchar(15),
	'milliseconds' int,
	'fastestLap' smallint,
	'fastestLapTime' varchar(15),
	'statusId' smallint(10) NOT NULL,
	PRIMARY KEY ('resultId')
);

CREATE TABLE 'status' (
	'statusId' serial NOT NULL,
	'status' varchar(255) NOT NULL,
	PRIMARY KEY ('statusId')
);

ALTER TABLE 'constructor_results' ADD CONSTRAINT 'constructor_results_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'constructor_results' ADD CONSTRAINT 'constructor_results_fk1' FOREIGN KEY ('constructorId') REFERENCES 'constructors'('constructorId');

ALTER TABLE 'constructor_standings' ADD CONSTRAINT 'constructor_standings_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'constructor_standings' ADD CONSTRAINT 'constructor_standings_fk1' FOREIGN KEY ('constructorId') REFERENCES 'constructors'('constructorId');

ALTER TABLE 'driver_standings' ADD CONSTRAINT 'driver_standings_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'driver_standings' ADD CONSTRAINT 'driver_standings_fk1' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'lap_times' ADD CONSTRAINT 'lap_times_fk0' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'pit_stops' ADD CONSTRAINT 'pit_stops_fk0' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'qualifying' ADD CONSTRAINT 'qualifying_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'qualifying' ADD CONSTRAINT 'qualifying_fk1' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'qualifying' ADD CONSTRAINT 'qualifying_fk2' FOREIGN KEY ('constructorId') REFERENCES 'constructors'('constructorId');

ALTER TABLE 'races' ADD CONSTRAINT 'races_fk0' FOREIGN KEY ('circuitId') REFERENCES 'circuits'('circuitId');

ALTER TABLE 'results' ADD CONSTRAINT 'results_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'results' ADD CONSTRAINT 'results_fk1' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'results' ADD CONSTRAINT 'results_fk2' FOREIGN KEY ('constructorId') REFERENCES 'constructors'('constructorId');

ALTER TABLE 'results' ADD CONSTRAINT 'results_fk3' FOREIGN KEY ('statusId') REFERENCES 'status'('statusId');

ALTER TABLE 'sprint_results' ADD CONSTRAINT 'sprint_results_fk0' FOREIGN KEY ('raceId') REFERENCES 'races'('raceId');

ALTER TABLE 'sprint_results' ADD CONSTRAINT 'sprint_results_fk1' FOREIGN KEY ('driverId') REFERENCES 'drivers'('driverId');

ALTER TABLE 'sprint_results' ADD CONSTRAINT 'sprint_results_fk2' FOREIGN KEY ('constructorId') REFERENCES 'constructors'('constructorId');

ALTER TABLE 'sprint_results' ADD CONSTRAINT 'sprint_results_fk3' FOREIGN KEY ('statusId') REFERENCES 'status'('statusId');
