## asmsembler lab №6
### Task:
Graphical mode.
### Code:
```
        org 100h

EntryPoint:
        mov     ah, $0F
        int     10h
        mov     [Video.OldMode], al
        mov     [Video.OldPage], bh

        mov     ax, $0013
        int     10h
;-НЕБО---------------------------
        mov     ax, $A000
        mov     es, ax

        mov     al, 11           ;11-синий
        mov     cx, 320 * 100    ;высота
        xor     di, di
        rep stosb
;-ТРАВА--------------------------
        push $A000
        pop es
        mov al,2                 ;2-зеленый
        mov di,320*100           ;верхний левый угол
        mov cx,100               ;высота
@@:     push cx
        mov cx,320               ;ширина
        rep stosb                ;вывод 320 точек
        pop cx
        loop @b                  ;вывод линий
;-ДОМ----------------------------
        push $A000
        pop es
        mov al,109               ;109-фиолетовый
        mov di,320*85+110        ;верхний левый угол
        mov cx,80                ;высота
@@:     push cx
        mov cx,100               ;ширина
        rep stosb                ;вывод точек
        add di,320-100           ;сдвиг на 220 точек
        pop cx
        loop @b                  ;вывод линий
;-КРЫША--------------------------
        push 0A000h
        pop es
        mov al, 8                ;цвет
        mov di, 320*35+160       ;центрирование
        mov si,1
        mov cx,50                ;высота
a1:
        push cx
        mov cx,si
        rep stosb
        add di,319
        sub di,si
        add si,2
        pop cx
        loop a1
;-ДВЕРЬ--------------------------
        push $A000
        pop es
        mov al,6                 ;6-коричневый
        mov di,320*105+170       ;верхний левый угол
        mov cx,57                ;высота
@@:     push cx
        mov cx,30                ;ширина
        rep stosb                ;вывод точек
        add di,320-30            ;сдвиг на .. точек
        pop cx
        loop @b                  ;вывод линий
;-ОКНО--------------------------
        push $A000
        pop es
        mov al,9                 ;9-синий
        mov di,320*105+123       ;верхний левый угол
        mov cx,30                ;высота
@@:     push cx
        mov cx,30                ;ширина
        rep stosb                ;вывод точек
        add di,320-30            ;сдвиг на .. точек
        pop cx
        loop @b                  ;вывод линий
;-НИЗ----------------------------
        push $A000
        pop es
        mov al,25                ;25-серый
        mov di,320*165+110       ;верхний левый угол
        mov cx,8                 ;высота
@@:     push cx
        mov cx,100               ;ширина
        rep stosb                ;вывод точек
        add di,320-100           ;сдвиг на .. точек
        pop cx
        loop @b                  ;вывод линий
;-ТРУБА--------------------------
        push $A000
        pop es
        mov al,25                ;25-серый
        mov di,320*30+185        ;верхний левый угол
        mov cx,45                ;высота
@@:     push cx
        mov cx,10                ;ширина
        rep stosb                ;вывод точек
        add di,320-10            ;сдвиг на .. точек
        pop cx
        loop @b                  ;вывод линий
;--------------------------------
ReadKey:
        mov     ax, $0C08
        int     21h
        test    al, al
        jnz     @F
        mov     ah, $08
        int     21h
@@:
        ret

Video.OldMode   db      ?
Video.OldPage   db      ?
```
