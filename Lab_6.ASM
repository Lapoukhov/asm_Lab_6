        org 100h

EntryPoint:
        mov     ah, $0F
        int     10h
        mov     [Video.OldMode], al
        mov     [Video.OldPage], bh

        mov     ax, $0013
        int     10h
;-����---------------------------
        mov     ax, $A000
        mov     es, ax

        mov     al, 11           ;11-�����
        mov     cx, 320 * 100    ;������
        xor     di, di
        rep stosb
;-�����--------------------------
        push $A000
        pop es
        mov al,2                 ;2-�������
        mov di,320*100           ;������� ����� ����
        mov cx,100               ;������
@@:     push cx
        mov cx,320               ;������
        rep stosb                ;����� 320 �����
        pop cx
        loop @b                  ;����� �����
;-���----------------------------
        push $A000
        pop es
        mov al,109               ;109-����������
        mov di,320*85+110        ;������� ����� ����
        mov cx,80                ;������
@@:     push cx
        mov cx,100               ;������
        rep stosb                ;����� �����
        add di,320-100           ;����� �� 220 �����
        pop cx
        loop @b                  ;����� �����
;-�����--------------------------
        push 0A000h
        pop es
        mov al, 8                ;����
        mov di, 320*35+160       ;�������������
        mov si,1
        mov cx,50                ;������
a1:
        push cx
        mov cx,si
        rep stosb
        add di,319
        sub di,si
        add si,2
        pop cx
        loop a1
;-�����--------------------------
        push $A000
        pop es
        mov al,6                 ;6-����������
        mov di,320*105+170       ;������� ����� ����
        mov cx,57                ;������
@@:     push cx
        mov cx,30                ;������
        rep stosb                ;����� �����
        add di,320-30            ;����� �� .. �����
        pop cx
        loop @b                  ;����� �����
;-����--------------------------
        push $A000
        pop es
        mov al,9                 ;9-�����
        mov di,320*105+123       ;������� ����� ����
        mov cx,30                ;������
@@:     push cx
        mov cx,30                ;������
        rep stosb                ;����� �����
        add di,320-30            ;����� �� .. �����
        pop cx
        loop @b                  ;����� �����
;-���----------------------------
        push $A000
        pop es
        mov al,25                ;25-�����
        mov di,320*165+110       ;������� ����� ����
        mov cx,8                 ;������
@@:     push cx
        mov cx,100               ;������
        rep stosb                ;����� �����
        add di,320-100           ;����� �� .. �����
        pop cx
        loop @b                  ;����� �����
;-�����--------------------------
        push $A000
        pop es
        mov al,25                ;25-�����
        mov di,320*30+185        ;������� ����� ����
        mov cx,45                ;������
@@:     push cx
        mov cx,10                ;������
        rep stosb                ;����� �����
        add di,320-10            ;����� �� .. �����
        pop cx
        loop @b                  ;����� �����
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