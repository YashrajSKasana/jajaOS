org 0x7C00
bits 16
%define ENDL 0x0D, 0x0A

start:

    jmp main
; a simple function that prints a string
; prameters (ds:si)
; they point to end and start of string
puts:
    push si ; push save register to stack
    push ax

.loop:
    lodsb ; lodes a byte for ds:si in al and then increment si by num of byte loded
    or al, al ; or dose not modify anythig if only 1 register is given but it modify flags register and set zero flag if next item is null
    jz .done ; jupmps to doen if zero flage is set or next num is null

    mov ah, 0x0e
    mov bh, 0 ;  this is bit of stuff can,t wright it to be a good comment chick vid to understand time:(20:00-22:00)
    int 0x10 ; calls bios intrreupt

    jmp .loop

.done:
    pop ax ; we have to pop in opp. oder of push
    pop si
    ret


main:
    ; starts data segment
    mov ax, 0   ; you can not set a section register to a constant directly
    mov es, ax
    mov ds, ax

    ; starts data segment
    mov ss, ax
    mov sp, 0x7C00 ; stack grows down word so we start a begining of owr os

    ; print str
    mov si, My_str ; sets the parameter of puts
    call puts

    hlt ; stops program from exiting untill input

.halt: ; is a (may be)optinul fale safe if we forgut to call main or some thing hapenss that wasent supposed to happen
    jmp .halt

My_str: db 'hello, from nasm', ENDL, 0

times 510 - ( $ - $$) db 0
dw 0xAA55