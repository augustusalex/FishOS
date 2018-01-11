00000100  E93900            jmp 0x13c
00000103  A00000            mov al,[0x0]
00000106  00496E            add [bx+di+0x6e],cl
00000109  205265            and [bp+si+0x65],dl
0000010C  61                popa
0000010D  64204D6F          and [fs:di+0x6f],cl
00000111  6465206E6F        and [gs:bp+0x6f],ch
00000116  772E              ja 0x146
00000118  205E2D            and [bp+0x2d],bl
0000011B  5E                pop si
0000011C  0A0A              or cl,[bp+si]
0000011E  00496E            add [bx+di+0x6e],cl
00000121  205072            and [bx+si+0x72],dl
00000124  6F                outsw
00000125  7465              jz 0x18c
00000127  637420            arpl [si+0x20],si
0000012A  4D                dec bp
0000012B  6F                outsw
0000012C  6465206E6F        and [gs:bp+0x6f],ch
00000131  772E              ja 0x161
00000133  205E2D            and [bp+0x2d],bl
00000136  5E                pop si
00000137  0A0A              or cl,[bp+si]
00000139  0000              add [bx+si],al
0000013B  008CC88E          add [si-0x7138],cl
0000013F  D88EC08E          fmul dword [bp-0x7140]
00000143  D08EE0BC          ror byte [bp-0x4320],1
00000147  0001              add [bx+di],al
00000149  B800B8            mov ax,0xb800
0000014C  8EE8              mov gs,ax
0000014E  FA                cli
0000014F  6ACD              push byte -0x33
00000151  E8BD00            call 0x211
00000154  E85000            call 0x1a7
00000157  E492              in al,0x92
00000159  0C02              or al,0x2
0000015B  E692              out 0x92,al
0000015D  0F20C0            mov eax,cr0
00000160  6683C801          or eax,byte +0x1
00000164  0F22C0            mov cr0,eax
00000167  EB00              jmp short 0x169
00000169  6AE5              push byte -0x1b
0000016B  E8A300            call 0x211
0000016E  E83600            call 0x1a7
00000171  EBFE              jmp short 0x171
00000173  6651              push ecx
00000175  6652              push edx
00000177  B40C              mov ah,0xc
00000179  88C2              mov dl,al
0000017B  C0E804            shr al,byte 0x4
0000017E  66B902000000      mov ecx,0x2
00000184  240F              and al,0xf
00000186  3C09              cmp al,0x9
00000188  7704              ja 0x18e
0000018A  0430              add al,0x30
0000018C  EB04              jmp short 0x192
0000018E  2C0A              sub al,0xa
00000190  0441              add al,0x41
00000192  65678907          mov [gs:edi],ax
00000196  6683C702          add edi,byte +0x2
0000019A  88D0              mov al,dl
0000019C  E2E6              loop 0x184
0000019E  6683C702          add edi,byte +0x2
000001A2  665A              pop edx
000001A4  6659              pop ecx
000001A6  C3                ret
000001A7  6650              push eax
000001A9  6653              push ebx
000001AB  6689F8            mov eax,edi
000001AE  B3A0              mov bl,0xa0
000001B0  F6F3              div bl
000001B2  6625FF000000      and eax,0xff
000001B8  6640              inc eax
000001BA  B3A0              mov bl,0xa0
000001BC  F6E3              mul bl
000001BE  6689C7            mov edi,eax
000001C1  665B              pop ebx
000001C3  6658              pop eax
000001C5  C3                ret
000001C6  66678B442404      mov eax,[dword esp+0x4]
000001CC  66C1E818          shr eax,byte 0x18
000001D0  E8A0FF            call 0x173
000001D3  66678B442404      mov eax,[dword esp+0x4]
000001D9  66C1E810          shr eax,byte 0x10
000001DD  E893FF            call 0x173
000001E0  66678B442404      mov eax,[dword esp+0x4]
000001E6  66C1E808          shr eax,byte 0x8
000001EA  E886FF            call 0x173
000001ED  66678B442404      mov eax,[dword esp+0x4]
000001F3  E87DFF            call 0x173
000001F6  B407              mov ah,0x7
000001F8  B068              mov al,0x68
000001FA  6657              push edi
000001FC  668B3EC9FF        mov edi,[0xffc9]
00000201  65678907          mov [gs:edi],ax
00000205  6683C704          add edi,byte +0x4
00000209  66893EC9FF        mov [0xffc9],edi
0000020E  665F              pop edi
00000210  C3                ret
00000211  6655              push ebp
00000213  6689E5            mov ebp,esp
00000216  6653              push ebx
00000218  6656              push esi
0000021A  6657              push edi
0000021C  6650              push eax
0000021E  66678B7508        mov esi,[ebp+0x8]
00000223  668B3EC9FF        mov edi,[0xffc9]
00000228  B40F              mov ah,0xf
0000022A  AC                lodsb
0000022B  84C0              test al,al
0000022D  742A              jz 0x259
0000022F  3C0A              cmp al,0xa
00000231  751C              jnz 0x24f
00000233  6650              push eax
00000235  6689F8            mov eax,edi
00000238  B3A0              mov bl,0xa0
0000023A  F6F3              div bl
0000023C  6625FF000000      and eax,0xff
00000242  6640              inc eax
00000244  B3A0              mov bl,0xa0
00000246  F6E3              mul bl
00000248  6689C7            mov edi,eax
0000024B  6658              pop eax
0000024D  EBDB              jmp short 0x22a
0000024F  65678907          mov [gs:edi],ax
00000253  6683C702          add edi,byte +0x2
00000257  EBD1              jmp short 0x22a
00000259  66893EC9FF        mov [0xffc9],edi
0000025E  6658              pop eax
00000260  665F              pop edi
00000262  665E              pop esi
00000264  665B              pop ebx
00000266  665D              pop ebp
00000268  C3                ret
