CREATE TABLE CLIENT (NUMCLIENT char(15) not null, 
					NOM char(15) not null,
					ADRESSE char(30) not null,
CONSTRAINT PK_NUMCLIENT primary key (NUMCLIENT)


) ;


CREATE TABLE CONTRAT (SIGNATAIRE char(15) not null,
					NUMCTR char(15) not null, 
					TYPES char (15) not null, 
					DATESIGN char(15) not null, 
					NUMCLIENT char(15) not null,
primary key (SIGNATAIRE,NUMCTR),
CONSTRAINT FK_NUMCLIENT foreign key (NUMCLIENT) references CLIENT on update cascade

) ;

CREATE TABLE VEHICULE (NUMVEH char(20) not null, 
				MARQUE char(20) not null, 
				MODELE char (20) not null, 
				ANNEE char (20) not null, 
				CYLINDREE char (20) not null, 
				SIGNATAIRE char(20) not null, 
				NUMCTR char (20) not null, 
				NUMCLIENT char (20) not null, 
primary key (NUMVEH,SIGNATAIRE,NUMCTR),
foreign key (NUMCLIENT) references CLIENT on update cascade,
foreign key (SIGNATAIRE) references CONTRAT on update cascade,
foreign key (NUMCTR) references CONTRAT on update cascade
) ;

CREATE TABLE ACCIDENT (NUMACC char (25) not null, 
				DATEACC date not null, 
				MONTANT int (15) not null, 
primary key (NUMACC)

) ;

CREATE TABLE IMPLICATION ( NUMACC char (20) not null, 
				NUMVEH char(20) not null, 
				
primary key (NUMACC,NUMVEH),
foreign key (NUMVEH) references VEHICULE on update cascade,
foreign key (NUMACC) references ACCIDENT on update cascade
) ;


CREATE UNIQUE INDEX `I_CLIENT` ON `CLIENT` (`NUMCLIENT`);
CREATE UNIQUE INDEX `I_CONTRAT` ON `CONTRAT` (`SIGNATAIRE`,`NUMCTR`);
CREATE UNIQUE INDEX `I_VEHICULE` ON `VEHICULE` (`NUMVEH`,`SIGNATAIRE`,`NUMCTR`);
CREATE UNIQUE INDEX `I_ACCIDENT` ON `ACCIDENT` (`NUMACC`);
CREATE UNIQUE INDEX `I_IMPLICATION` ON `IMPLICATION` (`NUMACC`,`NUMVEH`);

