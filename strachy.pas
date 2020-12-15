program strachy;
uses crt,graph;
type
obiekt = record
         x,y,kierx,kiery,czas,kolor,duch : INTEGER;
         end;
const
max=30;
r=10;

var
obiekty :array [-2..max] of obiekt;
p,a,b : SMALLINT;
wybor,k,s :char;
n,d,life,t: integer;
level :byte;
hiscore :byte;
hi, score :string[2];
speed :char;
wolno :byte;
pos :integer;
trudnosc :byte;
dzwiek :char;


procedure duchl;
begin
with obiekty[p] do begin
ellipse (x, y-7, 0, 225, 7,13);
ellipse (x+13, y-6, 180, 275, 5, 7);
line (x-5, y+2, x+13, y+2);
circle (x-2, y-13, 1);
end;
end;

procedure duchp;
begin
with obiekty[p] do begin
ellipse (x, y-7, 325, 360, 7, 13);
ellipse (x, y-7, 180, 0, 7, 13);
ellipse (x-13, y-6, 360, 290, 5, 7);
line (x-11, y+1, x+5, y+1);
circle (x+2, y-13, 1);
end;
end;


procedure cel;
begin
with obiekty[p] do begin
if trudnosc=2 then begin
kolor:=black;
setcolor(kolor);
with obiekty[p] do begin
circle (x,y-8,11);
circle (x,y-8,12);
circle (x-3,y-10,2);
circle (x+3,y-10,2);
line (x-3,y-3,x+3,y-3);
end;
if x>=615 then  kierX:=-1;
if x<=15 then kierX:=+1;
if y>=432 then kiery:=-1;
if y<=25 then kiery:=+1;
x:=x+kierx;
y:=y+kiery;
end;

kolor:=red;
setcolor(kolor);
with obiekty[p] do begin
circle (x,y-8,11);
circle (x,y-8,12);
circle (x-3,y-10,2);
circle (x+3,y-10,2);
line (x-3,y-3,x+3,y-3);
end;

if (abs(obiekty[0].x-x)<r+5) and (abs(obiekty[0].y-y)<r+5) then begin
if (dzwiek<>'n') and (dzwiek<>'N') then sound (1000);
delay (200);
nosound;
k:='q';
s:='w';
end;
end;
end;

procedure gracz;
begin
with obiekty[p] do begin
kolor:=green;
if keypressed then begin
k:=readkey;
case k of
#79 :begin kierx:=-t;
           kiery:=t;
     end;
#80 :begin kierx:=0;
           kiery:=t;
     end;
#81 :begin kierx:=t;
           kiery:=t;
     end;
#75 :begin kierx:=-t;
           kiery:=0;
     end;
#82 :begin kierx:=0;
           kiery:=0;
     end;
#77 :begin kierx:=t;
           kiery:=0;
     end;
#71 :begin kierx:=-t;
           kiery:=-t;
     end;
#72 :begin kierx:=0;
           kiery:=-t;
     end;
#73 :begin kierx:=t;
           kiery:=-t;
     end;
#68 :begin closegraph;
           halt;
     end;
#93 :begin outtextxy (150,100,'Fucking cheat mode');
           delay (300);
           setcolor (black);
           outtextxy (150,100,'Fucking cheat mode');
           life:=life+1;
       end;
end;
end;
end;
for d:=2 to n do begin
with obiekty[d] do begin
if (abs(x-obiekty[0].x)<2*r-1) and (abs(y-obiekty[0].y)<2*r-1) then begin
k:='q';
if (dzwiek<>'n') and (dzwiek<>'N') then sound (40);
delay (400);
nosound;
end;
end;
end;
end;

procedure lev;
begin
settextstyle(1,0,2);
setcolor(red);
str(level,score);
outtextxy (90,456,'SCORE : '+score);
setcolor (blue);
outtextxy (298,456,'STRACHY');
setcolor (magenta);
str(hiscore,hi);
outtextxy (475,456,'HIScr: '+hi);
end;


procedure ruch;
begin
 for p:=-2 to n do begin
  with obiekty[P] do begin
   if p<0 then begin with obiekty[p] do begin
          setcolor (kolor);
          duchp;
          if (life = 1) and (p=-2) then begin kolor:=black;
                                              setcolor (kolor);
                                              duchp;
                                        end;

          if (life = 0) and (p=-1) then begin kolor:=black;
                                              setcolor (kolor);
                                              duchp;
                                        end;
                                        end;
               end
   else begin
   if p=0 then gracz;

   if p=1 then cel else begin
    setcolor(black);
    if duch=1 then duchl;
    if duch=0 then duchp;
    if x>=615 then  kierX:=-1;
    if x<=15 then kierX:=+1;
    if y>=435 then kiery:=-1;
    if y<=25 then kiery:=+1;
    SETCOLOR(kolor);
    x:=x+kierx;
    y:=y+kiery;
    if (kierx>=0) then begin duchp;
                             duch:=0;
                       end;
    if (kierx<0) then begin duchl;
                            duch:=1;
                      end;
    delay (wolno);
    if p<>0 then begin
     dec(czas);
     if czas=0 then begin
     CASE RANDOM(3) OF
      0 :KIERX:=-t+1;
      1 :KIERX:= t-1;
      2 :KIERX:= 0;
     END;
     CASE RANDOM(3) OF
      0 :KIERY:=-t+1;
      1 :KIERY:= t-1;
      2 :KIERY:= 0;
     END;
     czas:=40;
     end;
    end;
   end;
  end;
 end;
end;
end;

procedure gra;
begin
setcolor (red);
randomize;
for p:=2 to n do begin
 with obiekty[p] do begin
  x:=random(535)+80;
  y:=random(390)+40;
  kolor:=yellow;
  czas:=random(10)+1;
 end;
end;

with obiekty[1] do begin
if trudnosc=1 then begin
                        kierx:=0;
                        kiery:=0;
                    end;
if trudnosc=2 then begin
                        repeat
                        kierx:=random(2);
                        kiery:=random(2);
                        until kierx+kiery>0;
                    end;

x:=random(550)+68;
y:=random(385)+30;
end;

k:='x';
closegraph;
initgraph (A,B,' ');
lev ;
setcolor (white);
rectangle (1,1,630,439);
rectangle (1,445,35,479);
rectangle (40,445,75,479);
rectangle (80,445,265,479);
rectangle (270,445,460,479);
rectangle (465,445,630,479);
ruch;
delay (1000);
repeat
ruch;
until k='q';
end;


procedure start;
begin
n:=25;

with obiekty[-1] do begin
x:=20;;
y:=472;
kolor:=green;
end;

with obiekty[-2] do begin
x:=60;
y:=472;
kolor:=green;
end;

obiekty[0].x:=20;
obiekty[0].y:=30;
obiekty[0].kierx:=0;
obiekty[0].kiery:=0;
level:=0;
life:=2;
repeat
gra;
if s<>'w' then begin
                    life:=life-1;
                    obiekty[0].x:=20;
                    obiekty[0].y:=30;
                    obiekty[0].kierx:=0;
                    obiekty[0].kiery:=0;
               end
          else  level:=level+1;
                obiekty[0].x:=20;
                obiekty[0].y:=30;
                obiekty[0].kierx:=0;
                obiekty[0].kiery:=0;
                 if level>99 then begin
                      lev;
                      delay (2000);
                      closegraph;
                 end;
s:='x';
until life<0;

setcolor (red);
settextstyle (1,0,10);
outtextxy (150,80,'GAME');
outtextxy (160,200,'OVER');
lev;
nosound;
delay(200);
end;

begin
a:=9;
b:=2;

clrscr;
textcolor (white);
write ('STRACHY    ');
textcolor (lightgray);
writeln ('1997, 2009   FreeWare.');
writeln ('Autor  :  Wojciech Martusewicz , Przemysl.');
writeln ('E-mail :  wmart@poczta.onet.pl');
Writeln ('Sound : (Y/N)   (Y-default)' );
dzwiek:=readkey;
write ('Podaj predkosc dzialania programu (1-5) (3-default) :');
speed:=readkey;

if (speed='1') or (speed='2') or (speed='3') or (speed='4') or (speed='5')
 then begin
case speed of
'1': wolno:=3;
'2': wolno:=1;
'3': t:=2;
'4': t:=3;
'5': t:=4;
else exit;
end;
if (speed ='1') or (speed ='2') then t:=2;
end else t:=2;


initgraph (A,B,' ');
setTextStyle (1,0,10);
setcolor (black);

pos:=-127;
repeat
setcolor (black);
outtextxy (60,pos-1,'STRACHY');
setcolor (Lightred);
outtextxy (60,pos,'STRACHY');
delay (15);
pos:=pos+1;
until pos=15;

pos:=10;

repeat
settextstyle (1,0,pos);
outtextxy (60,14,'STRACHY');
delay (80);
setcolor (black);
outtextxy (60,14,'STRACHY');
setcolor (Lightred);
pos:=pos-1;
if (dzwiek<>'n') and (dzwiek<>'N') then sound (300-pos*10);
until pos=1;


repeat
settextstyle (1,0,pos);
outtextxy (60,14,'STRACHY');
delay (80);
setcolor (black);
outtextxy (60,14,'STRACHY');
setcolor (Lightred);
if (dzwiek<>'n') and (dzwiek<>'N') then sound (150+pos*10);
pos:=pos+1;
until pos=10;

if (dzwiek<>'n') and (dzwiek<>'N') then sound (1200);
delay (150);
nosound;
outtextxy (60,14,'STRACHY');


delay (1000);
settextstyle (1,0,2);
setcolor (Green);
outtextxy (280,165,'1997');
outtextxy (160,200,'Wojciech Martusewicz');

p:=0;
with obiekty[p] do begin
x:=215;
y:=150;
setcolor (green);
duchp;
x:=405;
y:=150;
setcolor (yellow);
duchl;
end;


repeat
settextstyle (1,0,3);
setcolor (blue);
outtextxy (225,260,'F1-Easy');
outtextxy (225,290,'F2-Hard');

wybor:= readkey;
if wybor =#59 then trudnosc:=1;
if wybor =#60 then trudnosc:=2;
until trudnosc>0;
setcolor (black);


repeat
if hiscore<level then hiscore:=level;
settextstyle (1,0,3);
setcolor (white);
outtextxy(130,400,'Continue ? (y/n)');
textcolor (black);
wybor:='x';
wybor:=readkey;
if (wybor <> 'n') or (wybor <>'N') then if (wybor='y') or (wybor='Y')
                                                          then start;
if (wybor='n') or (wybor='N') then wybor:='n';
until wybor = 'n';
closegraph;
end.


