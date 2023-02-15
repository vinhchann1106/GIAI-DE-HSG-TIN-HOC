type hop = record
      n:shortint;
      bi:array[1..20] of shortint;
    end;
const fi='D:\input.txt';
var f:text;
    n:longint;
    m:shortint;
    a:array[1..1000000] of hop;
    bin:array[1..1000000] of shortint;
procedure docfile;
var i:longint;
    j:shortint;
begin
        assign(f,fi);
        reset(f);
         readln(f,n,m);
         for i:=1 to n do
            begin
               read(f,a[i].n);
               for j:=1 to a[i].n do read(f,a[i].bi[j]);
            end;
        close(f);
end;
function ChonDuMau():boolean;
var i,j:longint;
    bl:array[1..20] of boolean;
    h:hop;
begin
    for i:=1 to m do bl[i]:=false;
      for i:=1 to n do
        if bin[i]=1 then
          begin
            h:=a[i];
            for j:=1 to h.n do
              bl[h.bi[j]]:=true;
          end;
      for i:=1 to m do
        if bl[i]=false then exit(false);
      exit(true);
end;
procedure snp(k,n:longint);
var i:longint;
begin
   if k-1=n then
      begin
         if ChonDuMau() then
           begin
                write('{ ');
                for i:=1 to n do
                    if bin[i]=1 then
                       write(i,' ');
                writeln('}');
           end;
         exit;
      end;
   for i:=0 to 1 do
     begin
         bin[k]:=i;
         snp(k+1,n);
     end;
end;
begin
        docfile;
        snp(1,n);
        readln;
end.
