%macro   covar 0.nolist
[section .data]
times 100 dd 0
mvpad   : db './',__FILE__  ; Dit is ./oef.asm, de naam van het bestand eindigend op asm.
mvnapad : db 0
%endmacro

%macro   openin   0.nolist         
extern openisr
        pushfd
        push mvpad
        push mvnapad
        call openisr
        popfd
%endmacro

%macro   openuit  0.nolist
extern openusr
        pushfd
        push mvpad
        push mvnapad
        call openusr
        popfd
%endmacro

%macro   schrijf  0.nolist         
extern schrsr
        pushfd
        push outarea
        push 71
        call schrsr
        popfd
%endmacro

%macro   uit 1.nolist
extern uitsr
        pushfd
        push esi
        lea esi,%1
        push  esi
        call uitsr
        pop esi
        popfd
%endmacro

%macro  inv 1.nolist       
;deze macro leest een getal in van het scherm; 
;het getal staat daarna in binaire vorm in %1
extern invsr
        pushfd
        push esi
        lea esi,%1
        push esi
        call invsr
        pop esi
        popfd
%endmacro         

%macro  lees 0.nolist
extern leessr
        pushfd
        push ebx
        push edx
        push inarea
        call leessr
        pop edx
        pop ebx
        popfd
%endmacro         

%macro  inleiding 0.nolist
[section .text]
global _start
_start:
%endmacro

%macro   slot 0.nolist
extern sluitsr
        call sluitsr
%endmacro

%macro   tekstbin 0.nolist
;De externe inhoud vanaf adres in ESI wordt omgerekend naar binair. 
;Het aantal bytes moet in ECX staan.
;Het resultaat komt in EAX.

extern tkstbsr
        pushfd
        call tkstbsr
        popfd
%endmacro         

