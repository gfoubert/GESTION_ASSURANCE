INSERT TO CLIENT (NUMCLIENT,NOM,ADRESSE)
VALUES
((SELECT COUNT(NUMCLIENT)+1 from CLIENT), 'Paulo', 'Dybala'),
(SELECT COUNT(NUMCLIENT)+1 from CLIENT), 'Jean-Eudes', 'Aholou'),
INSERT INTO CONTRAT(SIGNATAIRE,NUMCTR,TYPES,DATESIGN)
VALUES 
((SELECT NOM FROM CLIENT,CONTRAT WHERE CLIENT.NUMCLI=CONTRAT.NUMCLI),'10', '20', '13-10-1991', 100),
