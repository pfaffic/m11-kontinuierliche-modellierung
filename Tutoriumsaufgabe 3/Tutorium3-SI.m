clear all;
% Infektionsrate
c = 0.3238;

% Genesungsrate
w = 1/14;

% Zahl der Bevoelkerung, die potenziell infiziert werden kann (=2/3 der Gesamtbevoelkerung) in Deutschland
B = 55000;    %in Tausend

% Zeitschritte
times = (0:0.1:180);
% x-Achse
T = length(times); %hier 1801
t = linspace(0,T-1,T); %erzeugt Vektor, der in gleiche Intervalle aufgeteilt ist mit Anfanf von 0 bis T (weil T Länge des Vektors bereits ist)

%Hole nur das was interessiert
[rki]=coronaData(); %Matrix 3x77 mit infects in Reihe 1 / Deads in Reihe 2 und Recovered in Reihe 3

%%% S []
%%% I [16, 18, 21, 26,...]
%%% T [0 ,  1,  2,  3, ...]

% Zeilenvektoren für S,I erstellen
S = zeros(1,T); %erstellt einen Null-Vektor mit einer Zeile und T Spalten
I = zeros(1,T); 

% Lege Anfangszustand fest
l_rki = length(rki); % gibt die Länge des rki-Vektors ein
for i=1:l_rki
    I(1,i)=(1/1000).*rki(1,i); %Idee der Vektor I soll an der Stelle (1,i) gleich sein wie rki an der Stelle (1,i)-> wir übertragen die Daten des rki auf unseren Anfangsvektor der infected. Wir teilen durch tausend, da unsere Bevölkerungsanzahl mal Tausend gerechnet wird
    S(1,i)= B-I(1,i); % einzelne Positionen der Susceptibles setzen sich zusammen aus der Anfangsbevölkerung minus der Werte der Infected an den einzelen Positionen (Spalten/Zeilen)
endfor

%y0=[S(1,:)';I(1,:)']
%gibt die Werte der susceptibles an der ersten ersten Zeile und der hier 77Spalte, dasselbe gilt für die infected -> ' transponiert die Matrix, sodass die Zeilen mit den Spalten übereinstimmen

%y Matrix ?x2 mit Spalte 1 Sind die S's und Spalte 2 sind die I's
%f=@(y,_t) -c*y(1)*y(2)/B;
%y=lsode (f, y0, times);
%y

%S(1,77)=54830
%I(1,77)=170/55000*S


for i=l_rki:T-1
   S(1,i+1) = S(1,i) - c*S(1,i)*I(1,i)/B;
   I(1,i+1) = I(1,i) + c*S(1,i)*I(1,i)/B;
endfor

S;
I;

plot(t,S,t,I);

 %Achseneinteilung
axis([0 180 0 60000]); %ändern 0 180? hätte ich auch gesagt 0 60000

 %Legende
%legend('S','I');

 %x-Achse beschriften
%xlabel('Tage');

% x-Achse
T = length(times); %hier 1801
t = linspace(0,T-1,T); %erzeugt Vektor, der in gleiche Intervalle aufgeteilt ist mit Anfanf von 0 bis T (weil T Länge des Vektors bereits ist)

%Hole nur das was interessiert
[rki]=coronaData(); %Matrix 3x77 mit infects in Reihe 1 / Deads in Reihe 2 und Recovered in Reihe 3

%%% S []
%%% I [16, 18, 21, 26,...]
%%% T [0 ,  1,  2,  3, ...]

% Zeilenvektoren für S,I erstellen
S = zeros(1,T); %erstellt einen Null-Vektor mit einer Zeile und T Spalten
I = zeros(1,T); 

% Lege Anfangszustand fest
l_rki = length(rki); % gibt die Länge des rki-Vektors ein
for i=1:l_rki
    I(1,i)=(1/1000).*rki(1,i); %Idee der Vektor I soll an der Stelle (1,i) gleich sein wie rki an der Stelle (1,i)-> wir übertragen die Daten des rki auf unseren Anfangsvektor der infected. Wir teilen durch tausend, da unsere Bevölkerungsanzahl mal Tausend gerechnet wird
    S(1,i)= B-I(1,i); % einzelne Positionen der Susceptibles setzen sich zusammen aus der Anfangsbevölkerung minus der Werte der Infected an den einzelen Positionen (Spalten/Zeilen)
endfor

%y0=[S(1,:)';I(1,:)']
%gibt die Werte der susceptibles an der ersten ersten Zeile und der hier 77Spalte, dasselbe gilt für die infected -> ' transponiert die Matrix, sodass die Zeilen mit den Spalten übereinstimmen

%y Matrix ?x2 mit Spalte 1 Sind die S's und Spalte 2 sind die I's
%f=@(y,_t) -c*y(1)*y(2)/B;
%y=lsode (f, y0, times);
%y

%S(1,77)=54830
%I(1,77)=170/55000*S


for i=l_rki:T-1
   S(1,i+1) = S(1,i) - c*S(1,i)*I(1,i)/B;
   I(1,i+1) = I(1,i) + c*S(1,i)*I(1,i)/B;
endfor

S;
I;

plot(t,S,t,I);

 %Achseneinteilung
axis([0 180 0 60000]); %ändern 0 180? hätte ich auch gesagt 0 60000

 %Legende
%legend('S','I');

 %x-Achse beschriften
%xlabel('Tage');
