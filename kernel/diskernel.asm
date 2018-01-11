00030000  7F45              jg 0x47
00030002  4C                dec sp
00030003  46                inc si
00030004  0101              add [bx+di],ax
00030006  0100              add [bx+si],ax
00030008  0000              add [bx+si],al
0003000A  0000              add [bx+si],al
0003000C  0000              add [bx+si],al
0003000E  0000              add [bx+si],al
00030010  0200              add al,[bx+si]
00030012  0300              add ax,[bx+si]
00030014  0100              add [bx+si],ax
00030016  0000              add [bx+si],al
00030018  0004              add [si],al
0003001A  0300              add ax,[bx+si]
0003001C  3400              xor al,0x0
0003001E  0000              add [bx+si],al
00030020  40                inc ax
00030021  1900              sbb [bx+si],ax
00030023  0000              add [bx+si],al
00030025  0000              add [bx+si],al
00030027  0034              add [si],dh
00030029  0020              add [bx+si],ah
0003002B  0003              add [bp+di],al
0003002D  0028              add [bx+si],ch
0003002F  0007              add [bx],al
00030031  00060001          add [0x100],al
00030035  0000              add [bx+si],al
00030037  0000              add [bx+si],al
00030039  0000              add [bx+si],al
0003003B  0000              add [bx+si],al
0003003D  0003              add [bp+di],al
0003003F  0000              add [bx+si],al
00030041  0003              add [bp+di],al
00030043  00E4              add ah,ah
00030045  1800              sbb [bx+si],al
00030047  00E4              add ah,ah
00030049  1800              sbb [bx+si],al
0003004B  0005              add [di],al
0003004D  0000              add [bx+si],al
0003004F  0000              add [bx+si],al
00030051  1000              adc [bx+si],al
00030053  0001              add [bx+di],al
00030055  0000              add [bx+si],al
00030057  00E4              add ah,ah
00030059  1800              sbb [bx+si],al
0003005B  00E4              add ah,ah
0003005D  2803              sub [bp+di],al
0003005F  00E4              add ah,ah
00030061  2803              sub [bp+di],al
00030063  0004              add [si],al
00030065  0000              add [bx+si],al
00030067  004C95            add [si-0x6b],cl
0003006A  0000              add [bx+si],al
0003006C  06                push es
0003006D  0000              add [bx+si],al
0003006F  0000              add [bx+si],al
00030071  1000              adc [bx+si],al
00030073  0051E5            add [bx+di-0x1b],dl
00030076  7464              jz 0xdc
00030078  0000              add [bx+si],al
0003007A  0000              add [bx+si],al
0003007C  0000              add [bx+si],al
0003007E  0000              add [bx+si],al
00030080  0000              add [bx+si],al
00030082  0000              add [bx+si],al
00030084  0000              add [bx+si],al
00030086  0000              add [bx+si],al
00030088  0000              add [bx+si],al
0003008A  0000              add [bx+si],al
0003008C  07                pop es
0003008D  0000              add [bx+si],al
0003008F  0010              add [bx+si],dl
00030091  0000              add [bx+si],al
00030093  0000              add [bx+si],al
00030095  0000              add [bx+si],al
00030097  0000              add [bx+si],al
00030099  0000              add [bx+si],al
0003009B  0000              add [bx+si],al
0003009D  0000              add [bx+si],al
0003009F  0000              add [bx+si],al
000300A1  0000              add [bx+si],al
000300A3  0000              add [bx+si],al
000300A5  0000              add [bx+si],al
000300A7  0000              add [bx+si],al
000300A9  0000              add [bx+si],al
000300AB  0000              add [bx+si],al
000300AD  0000              add [bx+si],al
000300AF  0000              add [bx+si],al
000300B1  0000              add [bx+si],al
000300B3  0000              add [bx+si],al
000300B5  0000              add [bx+si],al
000300B7  0000              add [bx+si],al
000300B9  0000              add [bx+si],al
000300BB  0000              add [bx+si],al
000300BD  0000              add [bx+si],al
000300BF  0000              add [bx+si],al
000300C1  0000              add [bx+si],al
000300C3  0000              add [bx+si],al
000300C5  0000              add [bx+si],al
000300C7  0000              add [bx+si],al
000300C9  0000              add [bx+si],al
000300CB  0000              add [bx+si],al
000300CD  0000              add [bx+si],al
000300CF  0000              add [bx+si],al
000300D1  0000              add [bx+si],al
000300D3  0000              add [bx+si],al
000300D5  0000              add [bx+si],al
000300D7  0000              add [bx+si],al
000300D9  0000              add [bx+si],al
000300DB  0000              add [bx+si],al
000300DD  0000              add [bx+si],al
000300DF  0000              add [bx+si],al
000300E1  0000              add [bx+si],al
000300E3  0000              add [bx+si],al
000300E5  0000              add [bx+si],al
000300E7  0000              add [bx+si],al
000300E9  0000              add [bx+si],al
000300EB  0000              add [bx+si],al
000300ED  0000              add [bx+si],al
000300EF  0000              add [bx+si],al
000300F1  0000              add [bx+si],al
000300F3  0000              add [bx+si],al
000300F5  0000              add [bx+si],al
000300F7  0000              add [bx+si],al
000300F9  0000              add [bx+si],al
000300FB  0000              add [bx+si],al
000300FD  0000              add [bx+si],al
000300FF  0000              add [bx+si],al
00030101  0000              add [bx+si],al
00030103  0000              add [bx+si],al
00030105  0000              add [bx+si],al
00030107  0000              add [bx+si],al
00030109  0000              add [bx+si],al
0003010B  0000              add [bx+si],al
0003010D  0000              add [bx+si],al
0003010F  0000              add [bx+si],al
00030111  0000              add [bx+si],al
00030113  0000              add [bx+si],al
00030115  0000              add [bx+si],al
00030117  0000              add [bx+si],al
00030119  0000              add [bx+si],al
0003011B  0000              add [bx+si],al
0003011D  0000              add [bx+si],al
0003011F  0000              add [bx+si],al
00030121  0000              add [bx+si],al
00030123  0000              add [bx+si],al
00030125  0000              add [bx+si],al
00030127  0000              add [bx+si],al
00030129  0000              add [bx+si],al
0003012B  0000              add [bx+si],al
0003012D  0000              add [bx+si],al
0003012F  0000              add [bx+si],al
00030131  0000              add [bx+si],al
00030133  0000              add [bx+si],al
00030135  0000              add [bx+si],al
00030137  0000              add [bx+si],al
00030139  0000              add [bx+si],al
0003013B  0000              add [bx+si],al
0003013D  0000              add [bx+si],al
0003013F  0000              add [bx+si],al
00030141  0000              add [bx+si],al
00030143  0000              add [bx+si],al
00030145  0000              add [bx+si],al
00030147  0000              add [bx+si],al
00030149  0000              add [bx+si],al
0003014B  0000              add [bx+si],al
0003014D  0000              add [bx+si],al
0003014F  0000              add [bx+si],al
00030151  0000              add [bx+si],al
00030153  0000              add [bx+si],al
00030155  0000              add [bx+si],al
00030157  0000              add [bx+si],al
00030159  0000              add [bx+si],al
0003015B  0000              add [bx+si],al
0003015D  0000              add [bx+si],al
0003015F  0000              add [bx+si],al
00030161  0000              add [bx+si],al
00030163  0000              add [bx+si],al
00030165  0000              add [bx+si],al
00030167  0000              add [bx+si],al
00030169  0000              add [bx+si],al
0003016B  0000              add [bx+si],al
0003016D  0000              add [bx+si],al
0003016F  0000              add [bx+si],al
00030171  0000              add [bx+si],al
00030173  0000              add [bx+si],al
00030175  0000              add [bx+si],al
00030177  0000              add [bx+si],al
00030179  0000              add [bx+si],al
0003017B  0000              add [bx+si],al
0003017D  0000              add [bx+si],al
0003017F  0000              add [bx+si],al
00030181  0000              add [bx+si],al
00030183  0000              add [bx+si],al
00030185  0000              add [bx+si],al
00030187  0000              add [bx+si],al
00030189  0000              add [bx+si],al
0003018B  0000              add [bx+si],al
0003018D  0000              add [bx+si],al
0003018F  0000              add [bx+si],al
00030191  0000              add [bx+si],al
00030193  0000              add [bx+si],al
00030195  0000              add [bx+si],al
00030197  0000              add [bx+si],al
00030199  0000              add [bx+si],al
0003019B  0000              add [bx+si],al
0003019D  0000              add [bx+si],al
0003019F  0000              add [bx+si],al
000301A1  0000              add [bx+si],al
000301A3  0000              add [bx+si],al
000301A5  0000              add [bx+si],al
000301A7  0000              add [bx+si],al
000301A9  0000              add [bx+si],al
000301AB  0000              add [bx+si],al
000301AD  0000              add [bx+si],al
000301AF  0000              add [bx+si],al
000301B1  0000              add [bx+si],al
000301B3  0000              add [bx+si],al
000301B5  0000              add [bx+si],al
000301B7  0000              add [bx+si],al
000301B9  0000              add [bx+si],al
000301BB  0000              add [bx+si],al
000301BD  0000              add [bx+si],al
000301BF  0000              add [bx+si],al
000301C1  0000              add [bx+si],al
000301C3  0000              add [bx+si],al
000301C5  0000              add [bx+si],al
000301C7  0000              add [bx+si],al
000301C9  0000              add [bx+si],al
000301CB  0000              add [bx+si],al
000301CD  0000              add [bx+si],al
000301CF  0000              add [bx+si],al
000301D1  0000              add [bx+si],al
000301D3  0000              add [bx+si],al
000301D5  0000              add [bx+si],al
000301D7  0000              add [bx+si],al
000301D9  0000              add [bx+si],al
000301DB  0000              add [bx+si],al
000301DD  0000              add [bx+si],al
000301DF  0000              add [bx+si],al
000301E1  0000              add [bx+si],al
000301E3  0000              add [bx+si],al
000301E5  0000              add [bx+si],al
000301E7  0000              add [bx+si],al
000301E9  0000              add [bx+si],al
000301EB  0000              add [bx+si],al
000301ED  0000              add [bx+si],al
000301EF  0000              add [bx+si],al
000301F1  0000              add [bx+si],al
000301F3  0000              add [bx+si],al
000301F5  0000              add [bx+si],al
000301F7  0000              add [bx+si],al
000301F9  0000              add [bx+si],al
000301FB  0000              add [bx+si],al
000301FD  0000              add [bx+si],al
000301FF  0000              add [bx+si],al
00030201  0000              add [bx+si],al
00030203  0000              add [bx+si],al
00030205  0000              add [bx+si],al
00030207  0000              add [bx+si],al
00030209  0000              add [bx+si],al
0003020B  0000              add [bx+si],al
0003020D  0000              add [bx+si],al
0003020F  0000              add [bx+si],al
00030211  0000              add [bx+si],al
00030213  0000              add [bx+si],al
00030215  0000              add [bx+si],al
00030217  0000              add [bx+si],al
00030219  0000              add [bx+si],al
0003021B  0000              add [bx+si],al
0003021D  0000              add [bx+si],al
0003021F  0000              add [bx+si],al
00030221  0000              add [bx+si],al
00030223  0000              add [bx+si],al
00030225  0000              add [bx+si],al
00030227  0000              add [bx+si],al
00030229  0000              add [bx+si],al
0003022B  0000              add [bx+si],al
0003022D  0000              add [bx+si],al
0003022F  0000              add [bx+si],al
00030231  0000              add [bx+si],al
00030233  0000              add [bx+si],al
00030235  0000              add [bx+si],al
00030237  0000              add [bx+si],al
00030239  0000              add [bx+si],al
0003023B  0000              add [bx+si],al
0003023D  0000              add [bx+si],al
0003023F  0000              add [bx+si],al
00030241  0000              add [bx+si],al
00030243  0000              add [bx+si],al
00030245  0000              add [bx+si],al
00030247  0000              add [bx+si],al
00030249  0000              add [bx+si],al
0003024B  0000              add [bx+si],al
0003024D  0000              add [bx+si],al
0003024F  0000              add [bx+si],al
00030251  0000              add [bx+si],al
00030253  0000              add [bx+si],al
00030255  0000              add [bx+si],al
00030257  0000              add [bx+si],al
00030259  0000              add [bx+si],al
0003025B  0000              add [bx+si],al
0003025D  0000              add [bx+si],al
0003025F  0000              add [bx+si],al
00030261  0000              add [bx+si],al
00030263  0000              add [bx+si],al
00030265  0000              add [bx+si],al
00030267  0000              add [bx+si],al
00030269  0000              add [bx+si],al
0003026B  0000              add [bx+si],al
0003026D  0000              add [bx+si],al
0003026F  0000              add [bx+si],al
00030271  0000              add [bx+si],al
00030273  0000              add [bx+si],al
00030275  0000              add [bx+si],al
00030277  0000              add [bx+si],al
00030279  0000              add [bx+si],al
0003027B  0000              add [bx+si],al
0003027D  0000              add [bx+si],al
0003027F  0000              add [bx+si],al
00030281  0000              add [bx+si],al
00030283  0000              add [bx+si],al
00030285  0000              add [bx+si],al
00030287  0000              add [bx+si],al
00030289  0000              add [bx+si],al
0003028B  0000              add [bx+si],al
0003028D  0000              add [bx+si],al
0003028F  0000              add [bx+si],al
00030291  0000              add [bx+si],al
00030293  0000              add [bx+si],al
00030295  0000              add [bx+si],al
00030297  0000              add [bx+si],al
00030299  0000              add [bx+si],al
0003029B  0000              add [bx+si],al
0003029D  0000              add [bx+si],al
0003029F  0000              add [bx+si],al
000302A1  0000              add [bx+si],al
000302A3  0000              add [bx+si],al
000302A5  0000              add [bx+si],al
000302A7  0000              add [bx+si],al
000302A9  0000              add [bx+si],al
000302AB  0000              add [bx+si],al
000302AD  0000              add [bx+si],al
000302AF  0000              add [bx+si],al
000302B1  0000              add [bx+si],al
000302B3  0000              add [bx+si],al
000302B5  0000              add [bx+si],al
000302B7  0000              add [bx+si],al
000302B9  0000              add [bx+si],al
000302BB  0000              add [bx+si],al
000302BD  0000              add [bx+si],al
000302BF  0000              add [bx+si],al
000302C1  0000              add [bx+si],al
000302C3  0000              add [bx+si],al
000302C5  0000              add [bx+si],al
000302C7  0000              add [bx+si],al
000302C9  0000              add [bx+si],al
000302CB  0000              add [bx+si],al
000302CD  0000              add [bx+si],al
000302CF  0000              add [bx+si],al
000302D1  0000              add [bx+si],al
000302D3  0000              add [bx+si],al
000302D5  0000              add [bx+si],al
000302D7  0000              add [bx+si],al
000302D9  0000              add [bx+si],al
000302DB  0000              add [bx+si],al
000302DD  0000              add [bx+si],al
000302DF  0000              add [bx+si],al
000302E1  0000              add [bx+si],al
000302E3  0000              add [bx+si],al
000302E5  0000              add [bx+si],al
000302E7  0000              add [bx+si],al
000302E9  0000              add [bx+si],al
000302EB  0000              add [bx+si],al
000302ED  0000              add [bx+si],al
000302EF  0000              add [bx+si],al
000302F1  0000              add [bx+si],al
000302F3  0000              add [bx+si],al
000302F5  0000              add [bx+si],al
000302F7  0000              add [bx+si],al
000302F9  0000              add [bx+si],al
000302FB  0000              add [bx+si],al
000302FD  0000              add [bx+si],al
000302FF  0000              add [bx+si],al
00030301  0000              add [bx+si],al
00030303  0000              add [bx+si],al
00030305  0000              add [bx+si],al
00030307  0000              add [bx+si],al
00030309  0000              add [bx+si],al
0003030B  0000              add [bx+si],al
0003030D  0000              add [bx+si],al
0003030F  0000              add [bx+si],al
00030311  0000              add [bx+si],al
00030313  0000              add [bx+si],al
00030315  0000              add [bx+si],al
00030317  0000              add [bx+si],al
00030319  0000              add [bx+si],al
0003031B  0000              add [bx+si],al
0003031D  0000              add [bx+si],al
0003031F  0000              add [bx+si],al
00030321  0000              add [bx+si],al
00030323  0000              add [bx+si],al
00030325  0000              add [bx+si],al
00030327  0000              add [bx+si],al
00030329  0000              add [bx+si],al
0003032B  0000              add [bx+si],al
0003032D  0000              add [bx+si],al
0003032F  0000              add [bx+si],al
00030331  0000              add [bx+si],al
00030333  0000              add [bx+si],al
00030335  0000              add [bx+si],al
00030337  0000              add [bx+si],al
00030339  0000              add [bx+si],al
0003033B  0000              add [bx+si],al
0003033D  0000              add [bx+si],al
0003033F  0000              add [bx+si],al
00030341  0000              add [bx+si],al
00030343  0000              add [bx+si],al
00030345  0000              add [bx+si],al
00030347  0000              add [bx+si],al
00030349  0000              add [bx+si],al
0003034B  0000              add [bx+si],al
0003034D  0000              add [bx+si],al
0003034F  0000              add [bx+si],al
00030351  0000              add [bx+si],al
00030353  0000              add [bx+si],al
00030355  0000              add [bx+si],al
00030357  0000              add [bx+si],al
00030359  0000              add [bx+si],al
0003035B  0000              add [bx+si],al
0003035D  0000              add [bx+si],al
0003035F  0000              add [bx+si],al
00030361  0000              add [bx+si],al
00030363  0000              add [bx+si],al
00030365  0000              add [bx+si],al
00030367  0000              add [bx+si],al
00030369  0000              add [bx+si],al
0003036B  0000              add [bx+si],al
0003036D  0000              add [bx+si],al
0003036F  0000              add [bx+si],al
00030371  0000              add [bx+si],al
00030373  0000              add [bx+si],al
00030375  0000              add [bx+si],al
00030377  0000              add [bx+si],al
00030379  0000              add [bx+si],al
0003037B  0000              add [bx+si],al
0003037D  0000              add [bx+si],al
0003037F  0000              add [bx+si],al
00030381  0000              add [bx+si],al
00030383  0000              add [bx+si],al
00030385  0000              add [bx+si],al
00030387  0000              add [bx+si],al
00030389  0000              add [bx+si],al
0003038B  0000              add [bx+si],al
0003038D  0000              add [bx+si],al
0003038F  0000              add [bx+si],al
00030391  0000              add [bx+si],al
00030393  0000              add [bx+si],al
00030395  0000              add [bx+si],al
00030397  0000              add [bx+si],al
00030399  0000              add [bx+si],al
0003039B  0000              add [bx+si],al
0003039D  0000              add [bx+si],al
0003039F  0000              add [bx+si],al
000303A1  0000              add [bx+si],al
000303A3  0000              add [bx+si],al
000303A5  0000              add [bx+si],al
000303A7  0000              add [bx+si],al
000303A9  0000              add [bx+si],al
000303AB  0000              add [bx+si],al
000303AD  0000              add [bx+si],al
000303AF  0000              add [bx+si],al
000303B1  0000              add [bx+si],al
000303B3  0000              add [bx+si],al
000303B5  0000              add [bx+si],al
000303B7  0000              add [bx+si],al
000303B9  0000              add [bx+si],al
000303BB  0000              add [bx+si],al
000303BD  0000              add [bx+si],al
000303BF  0000              add [bx+si],al
000303C1  0000              add [bx+si],al
000303C3  0000              add [bx+si],al
000303C5  0000              add [bx+si],al
000303C7  0000              add [bx+si],al
000303C9  0000              add [bx+si],al
000303CB  0000              add [bx+si],al
000303CD  0000              add [bx+si],al
000303CF  0000              add [bx+si],al
000303D1  0000              add [bx+si],al
000303D3  0000              add [bx+si],al
000303D5  0000              add [bx+si],al
000303D7  0000              add [bx+si],al
000303D9  0000              add [bx+si],al
000303DB  0000              add [bx+si],al
000303DD  0000              add [bx+si],al
000303DF  0000              add [bx+si],al
000303E1  0000              add [bx+si],al
000303E3  0000              add [bx+si],al
000303E5  0000              add [bx+si],al
000303E7  0000              add [bx+si],al
000303E9  0000              add [bx+si],al
000303EB  0000              add [bx+si],al
000303ED  0000              add [bx+si],al
000303EF  0000              add [bx+si],al
000303F1  0000              add [bx+si],al
000303F3  0000              add [bx+si],al
000303F5  0000              add [bx+si],al
000303F7  0000              add [bx+si],al
000303F9  0000              add [bx+si],al
000303FB  0000              add [bx+si],al
000303FD  0000              add [bx+si],al
000303FF  00BC0031          add [si+0x3100],bh
00030403  0300              add ax,[bx+si]
00030405  0F0105            sgdt [di]
00030408  8CB50300          mov [di+0x3],segr6
0003040C  E8C601            call word 0x5d5
0003040F  0000              add [bx+si],al
00030411  0F0115            lgdt [di]
00030414  8CB50300          mov [di+0x3],segr6
00030418  0F011D            lidt [di]
0003041B  0031              add [bx+di],dh
0003041D  0300              add ax,[bx+si]
0003041F  BF0000            mov di,0x0
00030422  0000              add [bx+si],al
00030424  EA2B040300        jmp word 0x3:0x42b
00030429  0800              or [bx+si],al
0003042B  31C0              xor ax,ax
0003042D  66B820000F00      mov eax,0xf0020
00030433  D8E9              fsubr st1
00030435  5C                pop sp
00030436  0200              add al,[bx+si]
00030438  00909090          add [bx+si-0x6f70],dl
0003043C  90                nop
0003043D  90                nop
0003043E  90                nop
0003043F  90                nop
00030440  6A00              push byte +0x0
00030442  E81004            call word 0x855
00030445  0000              add [bx+si],al
00030447  83C404            add sp,byte +0x4
0003044A  F4                hlt
0003044B  90                nop
0003044C  90                nop
0003044D  90                nop
0003044E  90                nop
0003044F  90                nop
00030450  6A01              push byte +0x1
00030452  E80004            call word 0x855
00030455  0000              add [bx+si],al
00030457  B474              mov ah,0x74
00030459  B068              mov al,0x68
0003045B  65668907          mov [gs:bx],eax
0003045F  83C702            add di,byte +0x2
00030462  6650              push eax
00030464  B401              mov ah,0x1
00030466  B40F              mov ah,0xf
00030468  65668907          mov [gs:bx],eax
0003046C  83C702            add di,byte +0x2
0003046F  83C404            add sp,byte +0x4
00030472  6658              pop eax
00030474  F4                hlt
00030475  90                nop
00030476  90                nop
00030477  90                nop
00030478  90                nop
00030479  90                nop
0003047A  90                nop
0003047B  90                nop
0003047C  90                nop
0003047D  90                nop
0003047E  90                nop
0003047F  90                nop
00030480  6A02              push byte +0x2
00030482  E8D003            call word 0x855
00030485  0000              add [bx+si],al
00030487  83C404            add sp,byte +0x4
0003048A  F4                hlt
0003048B  90                nop
0003048C  90                nop
0003048D  90                nop
0003048E  90                nop
0003048F  90                nop
00030490  6A03              push byte +0x3
00030492  E8C003            call word 0x855
00030495  0000              add [bx+si],al
00030497  83C404            add sp,byte +0x4
0003049A  F4                hlt
0003049B  90                nop
0003049C  90                nop
0003049D  90                nop
0003049E  90                nop
0003049F  90                nop
000304A0  6A04              push byte +0x4
000304A2  E8B003            call word 0x855
000304A5  0000              add [bx+si],al
000304A7  83C404            add sp,byte +0x4
000304AA  F4                hlt
000304AB  90                nop
000304AC  90                nop
000304AD  90                nop
000304AE  90                nop
000304AF  90                nop
000304B0  6A05              push byte +0x5
000304B2  E8A003            call word 0x855
000304B5  0000              add [bx+si],al
000304B7  83C404            add sp,byte +0x4
000304BA  F4                hlt
000304BB  90                nop
000304BC  90                nop
000304BD  90                nop
000304BE  90                nop
000304BF  90                nop
000304C0  6A06              push byte +0x6
000304C2  E89003            call word 0x855
000304C5  0000              add [bx+si],al
000304C7  83C404            add sp,byte +0x4
000304CA  F4                hlt
000304CB  90                nop
000304CC  90                nop
000304CD  90                nop
000304CE  90                nop
000304CF  90                nop
000304D0  6A07              push byte +0x7
000304D2  E88003            call word 0x855
000304D5  0000              add [bx+si],al
000304D7  83C404            add sp,byte +0x4
000304DA  F4                hlt
000304DB  90                nop
000304DC  90                nop
000304DD  90                nop
000304DE  90                nop
000304DF  90                nop
000304E0  6A08              push byte +0x8
000304E2  E87003            call word 0x855
000304E5  0000              add [bx+si],al
000304E7  83C404            add sp,byte +0x4
000304EA  F4                hlt
000304EB  90                nop
000304EC  90                nop
000304ED  90                nop
000304EE  90                nop
000304EF  90                nop
000304F0  6A09              push byte +0x9
000304F2  E86003            call word 0x855
000304F5  0000              add [bx+si],al
000304F7  83C404            add sp,byte +0x4
000304FA  F4                hlt
000304FB  90                nop
000304FC  90                nop
000304FD  90                nop
000304FE  90                nop
000304FF  90                nop
00030500  6A0A              push byte +0xa
00030502  E85003            call word 0x855
00030505  0000              add [bx+si],al
00030507  83C404            add sp,byte +0x4
0003050A  F4                hlt
0003050B  90                nop
0003050C  90                nop
0003050D  90                nop
0003050E  90                nop
0003050F  90                nop
00030510  6A0B              push byte +0xb
00030512  E84003            call word 0x855
00030515  0000              add [bx+si],al
00030517  83C404            add sp,byte +0x4
0003051A  F4                hlt
0003051B  90                nop
0003051C  90                nop
0003051D  90                nop
0003051E  90                nop
0003051F  90                nop
00030520  6A0C              push byte +0xc
00030522  E83003            call word 0x855
00030525  0000              add [bx+si],al
00030527  83C404            add sp,byte +0x4
0003052A  F4                hlt
0003052B  90                nop
0003052C  90                nop
0003052D  90                nop
0003052E  90                nop
0003052F  90                nop
00030530  6A0D              push byte +0xd
00030532  E82003            call word 0x855
00030535  0000              add [bx+si],al
00030537  83C404            add sp,byte +0x4
0003053A  F4                hlt
0003053B  90                nop
0003053C  90                nop
0003053D  90                nop
0003053E  90                nop
0003053F  90                nop
00030540  6A0E              push byte +0xe
00030542  E81003            call word 0x855
00030545  0000              add [bx+si],al
00030547  83C404            add sp,byte +0x4
0003054A  F4                hlt
0003054B  90                nop
0003054C  90                nop
0003054D  90                nop
0003054E  90                nop
0003054F  90                nop
00030550  6A0F              push byte +0xf
00030552  E80003            call word 0x855
00030555  0000              add [bx+si],al
00030557  83C404            add sp,byte +0x4
0003055A  F4                hlt
0003055B  6AFF              push byte -0x1
0003055D  6A00              push byte +0x0
0003055F  EB4E              jmp short 0x5af
00030561  6AFF              push byte -0x1
00030563  6A01              push byte +0x1
00030565  EB48              jmp short 0x5af
00030567  6AFF              push byte -0x1
00030569  6A02              push byte +0x2
0003056B  EB42              jmp short 0x5af
0003056D  6AFF              push byte -0x1
0003056F  6A03              push byte +0x3
00030571  EB3C              jmp short 0x5af
00030573  6AFF              push byte -0x1
00030575  6A04              push byte +0x4
00030577  EB36              jmp short 0x5af
00030579  6AFF              push byte -0x1
0003057B  6A05              push byte +0x5
0003057D  EB30              jmp short 0x5af
0003057F  6AFF              push byte -0x1
00030581  6A06              push byte +0x6
00030583  EB2A              jmp short 0x5af
00030585  6AFF              push byte -0x1
00030587  6A07              push byte +0x7
00030589  EB24              jmp short 0x5af
0003058B  6A08              push byte +0x8
0003058D  EB20              jmp short 0x5af
0003058F  6AFF              push byte -0x1
00030591  6A09              push byte +0x9
00030593  EB1A              jmp short 0x5af
00030595  6A0A              push byte +0xa
00030597  EB16              jmp short 0x5af
00030599  6A0B              push byte +0xb
0003059B  EB12              jmp short 0x5af
0003059D  6A0C              push byte +0xc
0003059F  EB0E              jmp short 0x5af
000305A1  6A0D              push byte +0xd
000305A3  EB0A              jmp short 0x5af
000305A5  6A0E              push byte +0xe
000305A7  EB06              jmp short 0x5af
000305A9  6AFF              push byte -0x1
000305AB  6A10              push byte +0x10
000305AD  EB00              jmp short 0x5af
000305AF  E89F03            call word 0x951
000305B2  0000              add [bx+si],al
000305B4  83C408            add sp,byte +0x8
000305B7  F4                hlt
000305B8  8B25              mov sp,[di]
000305BA  A0BD03            mov al,[0x3bd]
000305BD  000F              add [bx],cl
000305BF  005424            add [si+0x24],dl
000305C2  48                dec ax
000305C3  8D4424            lea ax,[si+0x24]
000305C6  48                dec ax
000305C7  A324B5            mov [0xb524],ax
000305CA  0300              add ax,[bx+si]
000305CC  0FA9              pop gs
000305CE  0FA1              pop fs
000305D0  07                pop es
000305D1  1F                pop ds
000305D2  61                popaw
000305D3  83C404            add sp,byte +0x4
000305D6  CF                iretw
000305D7  55                push bp
000305D8  89E5              mov bp,sp
000305DA  83EC28            sub sp,byte +0x28
000305DD  C704240C          mov word [si],0xc24
000305E1  1803              sbb [bp+di],al
000305E3  00E8              add al,ch
000305E5  37                aaa
000305E6  1100              adc [bx+si],ax
000305E8  00B88CB5          add [bx+si-0x4a74],bh
000305EC  0300              add ax,[bx+si]
000305EE  0F                db 0x0f
000305EF  B700              mov bh,0x0
000305F1  0F                db 0x0f
000305F2  B7D0              mov bh,0xd0
000305F4  B88EB5            mov ax,0xb58e
000305F7  0300              add ax,[bx+si]
000305F9  8B00              mov ax,[bx+si]
000305FB  895424            mov [si+0x24],dx
000305FE  08894424          or [bx+di+0x2444],cl
00030602  04C7              add al,0xc7
00030604  0424              add al,0x24
00030606  20B10300          and [bx+di+0x3],dh
0003060A  E8B111            call word 0x17be
0003060D  0000              add [bx+si],al
0003060F  C745F48CB5        mov word [di-0xc],0xb58c
00030614  0300              add ax,[bx+si]
00030616  C745F08EB5        mov word [di-0x10],0xb58e
0003061B  0300              add ax,[bx+si]
0003061D  8B45F4            mov ax,[di-0xc]
00030620  66C7000004BA20    mov dword [bx+si],0x20ba0400
00030627  B103              mov cl,0x3
00030629  008B45F0          add [bp+di-0xfbb],cl
0003062D  8910              mov [bx+si],dx
0003062F  C745EC0031        mov word [di-0x14],0x3100
00030634  0300              add ax,[bx+si]
00030636  C745E80231        mov word [di-0x18],0x3102
0003063B  0300              add ax,[bx+si]
0003063D  8B45EC            mov ax,[di-0x14]
00030640  66C700FF07BAA0    mov dword [bx+si],0xa0ba07ff
00030647  B503              mov ch,0x3
00030649  008B45E8          add [bp+di-0x17bb],cl
0003064D  8910              mov [bx+si],dx
0003064F  E8580B            call word 0x11aa
00030652  0000              add [bx+si],al
00030654  C7042431          mov word [si],0x3124
00030658  1803              sbb [bp+di],al
0003065A  00E8              add al,ch
0003065C  C01000            rcl byte [bx+si],byte 0x0
0003065F  00C9              add cl,cl
00030661  C3                ret
00030662  55                push bp
00030663  89E5              mov bp,sp
00030665  83EC28            sub sp,byte +0x28
00030668  C745F40000        mov word [di-0xc],0x0
0003066D  0000              add [bx+si],al
0003066F  C704244E          mov word [si],0x4e24
00030673  1803              sbb [bp+di],al
00030675  00E8              add al,ch
00030677  A5                movsw
00030678  1000              adc [bx+si],al
0003067A  00C7              add bh,al
0003067C  0424              add al,0x24
0003067E  50                push ax
0003067F  1803              sbb [bp+di],al
00030681  00E8              add al,ch
00030683  99                cwd
00030684  1000              adc [bx+si],al
00030686  00C7              add bh,al
00030688  0424              add al,0x24
0003068A  0100              add [bx+si],ax
0003068C  0000              add [bx+si],al
0003068E  E83B10            call word 0x16cc
00030691  0000              add [bx+si],al
00030693  EBDA              jmp short 0x66f
00030695  55                push bp
00030696  89E5              mov bp,sp
00030698  83EC28            sub sp,byte +0x28
0003069B  C7042452          mov word [si],0x5224
0003069F  1803              sbb [bp+di],al
000306A1  00E8              add al,ch
000306A3  7910              jns 0x6b5
000306A5  0000              add [bx+si],al
000306A7  C745F4C0BD        mov word [di-0xc],0xbdc0
000306AC  0300              add ax,[bx+si]
000306AE  8B45F4            mov ax,[di-0xc]
000306B1  66C7404828008B45  mov dword [bx+si+0x48],0x458b0028
000306B9  F4                hlt
000306BA  83C04A            add ax,byte +0x4a
000306BD  C744240808        mov word [si+0x24],0x808
000306C2  0000              add [bx+si],al
000306C4  00C7              add bh,al
000306C6  44                inc sp
000306C7  2404              and al,0x4
000306C9  28B10300          sub [bx+di+0x3],dh
000306CD  8904              mov [si],ax
000306CF  24E8              and al,0xe8
000306D1  EB10              jmp short 0x6e3
000306D3  0000              add [bx+si],al
000306D5  8B45F4            mov ax,[di-0xc]
000306D8  C6404FB2          mov byte [bx+si+0x4f],0xb2
000306DC  8B45F4            mov ax,[di-0xc]
000306DF  83C04A            add ax,byte +0x4a
000306E2  83C008            add ax,byte +0x8
000306E5  C744240808        mov word [si+0x24],0x808
000306EA  0000              add [bx+si],al
000306EC  00C7              add bh,al
000306EE  44                inc sp
000306EF  2404              and al,0x4
000306F1  30B10300          xor [bx+di+0x3],dh
000306F5  8904              mov [si],ax
000306F7  24E8              and al,0xe8
000306F9  C3                ret
000306FA  1000              adc [bx+si],al
000306FC  008B45F4          add [bp+di-0xbbb],cl
00030700  C740380500        mov word [bx+si+0x38],0x5
00030705  0000              add [bx+si],al
00030707  8B45F4            mov ax,[di-0xc]
0003070A  C7400C0D00        mov word [bx+si+0xc],0xd
0003070F  0000              add [bx+si],al
00030711  8B45F4            mov ax,[di-0xc]
00030714  C740080D00        mov word [bx+si+0x8],0xd
00030719  0000              add [bx+si],al
0003071B  8B45F4            mov ax,[di-0xc]
0003071E  C740040D00        mov word [bx+si+0x4],0xd
00030723  0000              add [bx+si],al
00030725  8B45F4            mov ax,[di-0xc]
00030728  C740440D00        mov word [bx+si+0x44],0xd
0003072D  0000              add [bx+si],al
0003072F  8B45F4            mov ax,[di-0xc]
00030732  C7001900          mov word [bx+si],0x19
00030736  0000              add [bx+si],al
00030738  BA6206            mov dx,0x662
0003073B  0300              add ax,[bx+si]
0003073D  8B45F4            mov ax,[di-0xc]
00030740  895034            mov [bx+si+0x34],dx
00030743  B82031            mov ax,0x3120
00030746  0300              add ax,[bx+si]
00030748  8D900080          lea dx,[bx+si-0x8000]
0003074C  0000              add [bx+si],al
0003074E  8B45F4            mov ax,[di-0xc]
00030751  895040            mov [bx+si+0x40],dx
00030754  8B45F4            mov ax,[di-0xc]
00030757  C7403C0212        mov word [bx+si+0x3c],0x1202
0003075C  0000              add [bx+si],al
0003075E  C704246B          mov word [si],0x6b24
00030762  1803              sbb [bp+di],al
00030764  00E8              add al,ch
00030766  B60F              mov dh,0xf
00030768  0000              add [bx+si],al
0003076A  C705A0BD          mov word [di],0xbda0
0003076E  0300              add ax,[bx+si]
00030770  C0BD0300E8        sar byte [di+0x3],byte 0xe8
00030775  3F                aas
00030776  FE                db 0xfe
00030777  FF                db 0xff
00030778  FFC7              inc di
0003077A  0424              add al,0x24
0003077C  8518              test [bx+si],bx
0003077E  0300              add ax,[bx+si]
00030780  E89B0F            call word 0x171e
00030783  0000              add [bx+si],al
00030785  EBFE              jmp short 0x785
00030787  55                push bp
00030788  89E5              mov bp,sp
0003078A  83EC18            sub sp,byte +0x18
0003078D  C744240411        mov word [si+0x24],0x1104
00030792  0000              add [bx+si],al
00030794  00C7              add bh,al
00030796  0424              add al,0x24
00030798  2000              and [bx+si],al
0003079A  0000              add [bx+si],al
0003079C  E8FC0F            call word 0x179b
0003079F  0000              add [bx+si],al
000307A1  C744240411        mov word [si+0x24],0x1104
000307A6  0000              add [bx+si],al
000307A8  00C7              add bh,al
000307AA  0424              add al,0x24
000307AC  A00000            mov al,[0x0]
000307AF  00E8              add al,ch
000307B1  E80F00            call word 0x7c3
000307B4  00C7              add bh,al
000307B6  44                inc sp
000307B7  2404              and al,0x4
000307B9  2000              and [bx+si],al
000307BB  0000              add [bx+si],al
000307BD  C7042421          mov word [si],0x2124
000307C1  0000              add [bx+si],al
000307C3  00E8              add al,ch
000307C5  D40F              aam 0xf
000307C7  0000              add [bx+si],al
000307C9  C744240428        mov word [si+0x24],0x2804
000307CE  0000              add [bx+si],al
000307D0  00C7              add bh,al
000307D2  0424              add al,0x24
000307D4  A10000            mov ax,[0x0]
000307D7  00E8              add al,ch
000307D9  C00F00            ror byte [bx],byte 0x0
000307DC  00C7              add bh,al
000307DE  44                inc sp
000307DF  2404              and al,0x4
000307E1  0400              add al,0x0
000307E3  0000              add [bx+si],al
000307E5  C7042421          mov word [si],0x2124
000307E9  0000              add [bx+si],al
000307EB  00E8              add al,ch
000307ED  AC                lodsb
000307EE  0F0000            sldt [bx+si]
000307F1  C744240402        mov word [si+0x24],0x204
000307F6  0000              add [bx+si],al
000307F8  00C7              add bh,al
000307FA  0424              add al,0x24
000307FC  A10000            mov ax,[0x0]
000307FF  00E8              add al,ch
00030801  98                cbw
00030802  0F0000            sldt [bx+si]
00030805  C744240401        mov word [si+0x24],0x104
0003080A  0000              add [bx+si],al
0003080C  00C7              add bh,al
0003080E  0424              add al,0x24
00030810  2100              and [bx+si],ax
00030812  0000              add [bx+si],al
00030814  E8840F            call word 0x179b
00030817  0000              add [bx+si],al
00030819  C744240401        mov word [si+0x24],0x104
0003081E  0000              add [bx+si],al
00030820  00C7              add bh,al
00030822  0424              add al,0x24
00030824  A10000            mov ax,[0x0]
00030827  00E8              add al,ch
00030829  700F              jo 0x83a
0003082B  0000              add [bx+si],al
0003082D  C7442404FD        mov word [si+0x24],0xfd04
00030832  0000              add [bx+si],al
00030834  00C7              add bh,al
00030836  0424              add al,0x24
00030838  2100              and [bx+si],ax
0003083A  0000              add [bx+si],al
0003083C  E85C0F            call word 0x179b
0003083F  0000              add [bx+si],al
00030841  C7442404FF        mov word [si+0x24],0xff04
00030846  0000              add [bx+si],al
00030848  00C7              add bh,al
0003084A  0424              add al,0x24
0003084C  A10000            mov ax,[0x0]
0003084F  00E8              add al,ch
00030851  48                dec ax
00030852  0F0000            sldt [bx+si]
00030855  C9                leave
00030856  C3                ret
00030857  55                push bp
00030858  89E5              mov bp,sp
0003085A  83EC18            sub sp,byte +0x18
0003085D  C704249F          mov word [si],0x9f24
00030861  1803              sbb [bp+di],al
00030863  00E8              add al,ch
00030865  B70E              mov bh,0xe
00030867  0000              add [bx+si],al
00030869  C70424AE          mov word [si],0xae24
0003086D  1803              sbb [bp+di],al
0003086F  00E8              add al,ch
00030871  AB                stosw
00030872  0E                push cs
00030873  0000              add [bx+si],al
00030875  C9                leave
00030876  C3                ret
00030877  55                push bp
00030878  89E5              mov bp,sp
0003087A  83EC04            sub sp,byte +0x4
0003087D  8B4514            mov ax,[di+0x14]
00030880  668945FC          mov [di-0x4],eax
00030884  8B4510            mov ax,[di+0x10]
00030887  89C2              mov dx,ax
00030889  8B4508            mov ax,[di+0x8]
0003088C  668910            mov [bx+si],edx
0003088F  8B450C            mov ax,[di+0xc]
00030892  89C2              mov dx,ax
00030894  8B4508            mov ax,[di+0x8]
00030897  66895002          mov [bx+si+0x2],edx
0003089B  8B450C            mov ax,[di+0xc]
0003089E  C1E810            shr ax,byte 0x10
000308A1  89C2              mov dx,ax
000308A3  8B4508            mov ax,[di+0x8]
000308A6  885004            mov [bx+si+0x4],dl
000308A9  0F                db 0x0f
000308AA  B745              mov bh,0x45
000308AC  FC                cld
000308AD  89C2              mov dx,ax
000308AF  8B4508            mov ax,[di+0x8]
000308B2  885005            mov [bx+si+0x5],dl
000308B5  8B4510            mov ax,[di+0x10]
000308B8  C1E810            shr ax,byte 0x10
000308BB  89C2              mov dx,ax
000308BD  83E20F            and dx,byte +0xf
000308C0  0F                db 0x0f
000308C1  B745              mov bh,0x45
000308C3  FC                cld
000308C4  66C1E808          shr eax,byte 0x8
000308C8  83E0F0            and ax,byte -0x10
000308CB  09C2              or dx,ax
000308CD  8B4508            mov ax,[di+0x8]
000308D0  885006            mov [bx+si+0x6],dl
000308D3  8B450C            mov ax,[di+0xc]
000308D6  C1E818            shr ax,byte 0x18
000308D9  89C2              mov dx,ax
000308DB  8B4508            mov ax,[di+0x8]
000308DE  885007            mov [bx+si+0x7],dl
000308E1  C9                leave
000308E2  C3                ret
000308E3  55                push bp
000308E4  89E5              mov bp,sp
000308E6  83EC1C            sub sp,byte +0x1c
000308E9  8B4D08            mov cx,[di+0x8]
000308EC  8B550C            mov dx,[di+0xc]
000308EF  8B4514            mov ax,[di+0x14]
000308F2  884DEC            mov [di-0x14],cl
000308F5  8855E8            mov [di-0x18],dl
000308F8  8845E4            mov [di-0x1c],al
000308FB  0FB645EC          movzx ax,[di-0x14]
000308FF  C1E003            shl ax,byte 0x3
00030902  05A0B5            add ax,0xb5a0
00030905  0300              add ax,[bx+si]
00030907  8945FC            mov [di-0x4],ax
0003090A  8B4510            mov ax,[di+0x10]
0003090D  8945F8            mov [di-0x8],ax
00030910  8B45F8            mov ax,[di-0x8]
00030913  89C2              mov dx,ax
00030915  8B45FC            mov ax,[di-0x4]
00030918  668910            mov [bx+si],edx
0003091B  8B45FC            mov ax,[di-0x4]
0003091E  66C7400208008B45  mov dword [bx+si+0x2],0x458b0008
00030926  FC                cld
00030927  C6400400          mov byte [bx+si+0x4],0x0
0003092B  0FB645E4          movzx ax,[di-0x1c]
0003092F  C1E005            shl ax,byte 0x5
00030932  89C2              mov dx,ax
00030934  0FB645E8          movzx ax,[di-0x18]
00030938  09D0              or ax,dx
0003093A  89C2              mov dx,ax
0003093C  8B45FC            mov ax,[di-0x4]
0003093F  885005            mov [bx+si+0x5],dl
00030942  8B45F8            mov ax,[di-0x8]
00030945  C1E810            shr ax,byte 0x10
00030948  89C2              mov dx,ax
0003094A  8B45FC            mov ax,[di-0x4]
0003094D  66895006          mov [bx+si+0x6],edx
00030951  C9                leave
00030952  C3                ret
00030953  55                push bp
00030954  89E5              mov bp,sp
00030956  57                push di
00030957  53                push bx
00030958  81EC2005          sub sp,0x520
0003095C  0000              add [bx+si],al
0003095E  C745F07400        mov word [di-0x10],0x74
00030963  0000              add [bx+si],al
00030965  8D9DF0FA          lea bx,[di-0x510]
00030969  FF                db 0xff
0003096A  FF                db 0xff
0003096B  B80000            mov ax,0x0
0003096E  0000              add [bx+si],al
00030970  BA4001            mov dx,0x140
00030973  0000              add [bx+si],al
00030975  89DF              mov di,bx
00030977  89D1              mov cx,dx
00030979  F3AB              rep stosw
0003097B  C785F0FAFFFF      mov word [di-0x510],0xffff
00030981  234445            and ax,[si+0x45]
00030984  20C7              and bh,al
00030986  85F4              test sp,si
00030988  FA                cli
00030989  FF                db 0xff
0003098A  FF4469            inc word [si+0x69]
0003098D  7669              jna 0x9f8
0003098F  C785F8FAFFFF      mov word [di-0x508],0xffff
00030995  64652045C7        and [gs:di-0x39],al
0003099A  85FC              test sp,di
0003099C  FA                cli
0003099D  FF                db 0xff
0003099E  FF7272            push word [bp+si+0x72]
000309A1  6F                outsw
000309A2  72C7              jc 0x96b
000309A4  8500              test [bx+si],ax
000309A6  FB                sti
000309A7  FF                db 0xff
000309A8  FF00              inc word [bx+si]
000309AA  0000              add [bx+si],al
000309AC  008D9D04          add [di+0x49d],cl
000309B0  FB                sti
000309B1  FF                db 0xff
000309B2  FF                db 0xff
000309B3  B80000            mov ax,0x0
000309B6  0000              add [bx+si],al
000309B8  BA0B00            mov dx,0xb
000309BB  0000              add [bx+si],al
000309BD  89DF              mov di,bx
000309BF  89D1              mov cx,dx
000309C1  F3AB              rep stosw
000309C3  C78530FBFFFF      mov word [di-0x4d0],0xffff
000309C9  234442            and ax,[si+0x42]
000309CC  20C7              and bh,al
000309CE  8534              test [si],si
000309D0  FB                sti
000309D1  FF                db 0xff
000309D2  FF5245            call word [bp+si+0x45]
000309D5  53                push bx
000309D6  45                inc bp
000309D7  C78538FBFFFF      mov word [di-0x4c8],0xffff
000309DD  52                push dx
000309DE  56                push si
000309DF  45                inc bp
000309E0  44                inc sp
000309E1  C7853CFBFFFF      mov word [di-0x4c4],0xffff
000309E7  0000              add [bx+si],al
000309E9  0000              add [bx+si],al
000309EB  8D9D40FB          lea bx,[di-0x4c0]
000309EF  FF                db 0xff
000309F0  FF                db 0xff
000309F1  B80000            mov ax,0x0
000309F4  0000              add [bx+si],al
000309F6  BA0C00            mov dx,0xc
000309F9  0000              add [bx+si],al
000309FB  89DF              mov di,bx
000309FD  89D1              mov cx,dx
000309FF  F3AB              rep stosw
00030A01  C78570FBFFFF      mov word [di-0x490],0xffff
00030A07  2D204E            sub ax,0x4e20
00030A0A  4D                dec bp
00030A0B  C78574FBFFFF      mov word [di-0x48c],0xffff
00030A11  49                dec cx
00030A12  20496E            and [bx+di+0x6e],cl
00030A15  C78578FBFFFF      mov word [di-0x488],0xffff
00030A1B  7465              jz 0xa82
00030A1D  7272              jc 0xa91
00030A1F  C7857CFBFFFF      mov word [di-0x484],0xffff
00030A25  7570              jnz 0xa97
00030A27  7400              jz 0xa29
00030A29  8D9D80FB          lea bx,[di-0x480]
00030A2D  FF                db 0xff
00030A2E  FF                db 0xff
00030A2F  B80000            mov ax,0x0
00030A32  0000              add [bx+si],al
00030A34  BA0C00            mov dx,0xc
00030A37  0000              add [bx+si],al
00030A39  89DF              mov di,bx
00030A3B  89D1              mov cx,dx
00030A3D  F3AB              rep stosw
00030A3F  C785B0FBFFFF      mov word [di-0x450],0xffff
00030A45  234250            and ax,[bp+si+0x50]
00030A48  20C7              and bh,al
00030A4A  85B4FBFF          test [si-0x5],si
00030A4E  FF4272            inc word [bp+si+0x72]
00030A51  6561              gs popaw
00030A53  C785B8FBFFFF      mov word [di-0x448],0xffff
00030A59  6B706F69          imul si,[bx+si+0x6f],byte +0x69
00030A5D  C785BCFBFFFF      mov word [di-0x444],0xffff
00030A63  6E                outsb
00030A64  7400              jz 0xa66
00030A66  008D9DC0          add [di-0x3f63],cl
00030A6A  FB                sti
00030A6B  FF                db 0xff
00030A6C  FF                db 0xff
00030A6D  B80000            mov ax,0x0
00030A70  0000              add [bx+si],al
00030A72  BA0C00            mov dx,0xc
00030A75  0000              add [bx+si],al
00030A77  89DF              mov di,bx
00030A79  89D1              mov cx,dx
00030A7B  F3AB              rep stosw
00030A7D  C785F0FBFFFF      mov word [di-0x410],0xffff
00030A83  234F46            and cx,[bx+0x46]
00030A86  20C7              and bh,al
00030A88  85F4              test sp,si
00030A8A  FB                sti
00030A8B  FF                db 0xff
00030A8C  FF4F76            dec word [bx+0x76]
00030A8F  6572C7            gs jc 0xa59
00030A92  85F8              test ax,di
00030A94  FB                sti
00030A95  FF                db 0xff
00030A96  FF666C            jmp word [bp+0x6c]
00030A99  6F                outsw
00030A9A  77C7              ja 0xa63
00030A9C  85FC              test sp,di
00030A9E  FB                sti
00030A9F  FF                db 0xff
00030AA0  FF00              inc word [bx+si]
00030AA2  0000              add [bx+si],al
00030AA4  008D9D00          add [di+0x9d],cl
00030AA8  FC                cld
00030AA9  FF                db 0xff
00030AAA  FF                db 0xff
00030AAB  B80000            mov ax,0x0
00030AAE  0000              add [bx+si],al
00030AB0  BA0C00            mov dx,0xc
00030AB3  0000              add [bx+si],al
00030AB5  89DF              mov di,bx
00030AB7  89D1              mov cx,dx
00030AB9  F3AB              rep stosw
00030ABB  C78530FCFFFF      mov word [di-0x3d0],0xffff
00030AC1  234252            and ax,[bp+si+0x52]
00030AC4  20C7              and bh,al
00030AC6  8534              test [si],si
00030AC8  FC                cld
00030AC9  FF                db 0xff
00030ACA  FF424F            inc word [bp+si+0x4f]
00030ACD  55                push bp
00030ACE  4E                dec si
00030ACF  C78538FCFFFF      mov word [di-0x3c8],0xffff
00030AD5  44                inc sp
00030AD6  205261            and [bp+si+0x61],dl
00030AD9  C7853CFCFFFF      mov word [di-0x3c4],0xffff
00030ADF  6E                outsb
00030AE0  676520C7          gs a32 and bh,al
00030AE4  8540FC            test [bx+si-0x4],ax
00030AE7  FF                db 0xff
00030AE8  FF4578            inc word [di+0x78]
00030AEB  6365C7            arpl [di-0x39],sp
00030AEE  8544FC            test [si-0x4],ax
00030AF1  FF                db 0xff
00030AF2  FF6564            jmp word [di+0x64]
00030AF5  6564C78548FCFFFF  mov word [fs:di-0x3b8],0xffff
00030AFD  0000              add [bx+si],al
00030AFF  0000              add [bx+si],al
00030B01  8D9D4CFC          lea bx,[di-0x3b4]
00030B05  FF                db 0xff
00030B06  FF                db 0xff
00030B07  B80000            mov ax,0x0
00030B0A  0000              add [bx+si],al
00030B0C  BA0900            mov dx,0x9
00030B0F  0000              add [bx+si],al
00030B11  89DF              mov di,bx
00030B13  89D1              mov cx,dx
00030B15  F3AB              rep stosw
00030B17  C78570FCFFFF      mov word [di-0x390],0xffff
00030B1D  235544            and dx,[di+0x44]
00030B20  20C7              and bh,al
00030B22  8574FC            test [si-0x4],si
00030B25  FF                db 0xff
00030B26  FF496E            dec word [bx+di+0x6e]
00030B29  7661              jna 0xb8c
00030B2B  C78578FCFFFF      mov word [di-0x388],0xffff
00030B31  6C                insb
00030B32  696420C785        imul sp,[si+0x20],word 0x85c7
00030B37  7CFC              jl 0xb35
00030B39  FF                db 0xff
00030B3A  FF4F70            dec word [bx+0x70]
00030B3D  636FC7            arpl [bx-0x39],bp
00030B40  8580FCFF          test [bx+si-0x4],ax
00030B44  FF6465            jmp word [si+0x65]
00030B47  2028              and [bx+si],ch
00030B49  C78584FCFFFF      mov word [di-0x37c],0xffff
00030B4F  55                push bp
00030B50  6E                outsb
00030B51  6465C78588FCFFFF  mov word [gs:di-0x378],0xffff
00030B59  66696E65C7858CFC  imul ebp,[bp+0x65],dword 0xfc8c85c7
00030B61  FF                db 0xff
00030B62  FF6420            jmp word [si+0x20]
00030B65  4F                dec di
00030B66  70C7              jo 0xb2f
00030B68  8590FCFF          test [bx+si-0x4],dx
00030B6C  FF636F            jmp word [bp+di+0x6f]
00030B6F  6465C78594FCFFFF  mov word [gs:di-0x36c],0xffff
00030B77  2900              sub [bx+si],ax
00030B79  0000              add [bx+si],al
00030B7B  8D9598FC          lea dx,[di-0x368]
00030B7F  FF                db 0xff
00030B80  FF                db 0xff
00030B81  B90000            mov cx,0x0
00030B84  0000              add [bx+si],al
00030B86  B81800            mov ax,0x18
00030B89  0000              add [bx+si],al
00030B8B  89C3              mov bx,ax
00030B8D  83E3FC            and bx,byte -0x4
00030B90  B80000            mov ax,0x0
00030B93  0000              add [bx+si],al
00030B95  890C              mov [si],cx
00030B97  0283C004          add al,[bp+di+0x4c0]
00030B9B  39D8              cmp ax,bx
00030B9D  72F6              jc 0xb95
00030B9F  01C2              add dx,ax
00030BA1  C785B0FCFFFF      mov word [di-0x350],0xffff
00030BA7  234E4D            and cx,[bp+0x4d]
00030BAA  20C7              and bh,al
00030BAC  85B4FCFF          test [si-0x4],si
00030BB0  FF4465            inc word [si+0x65]
00030BB3  7669              jna 0xc1e
00030BB5  C785B8FCFFFF      mov word [di-0x348],0xffff
00030BBB  636520            arpl [di+0x20],sp
00030BBE  4E                dec si
00030BBF  C785BCFCFFFF      mov word [di-0x344],0xffff
00030BC5  6F                outsw
00030BC6  7420              jz 0xbe8
00030BC8  41                inc cx
00030BC9  C785C0FCFFFF      mov word [di-0x340],0xffff
00030BCF  7661              jna 0xc32
00030BD1  696CC785C4        imul bp,[si-0x39],word 0xc485
00030BD6  FC                cld
00030BD7  FF                db 0xff
00030BD8  FF6162            jmp word [bx+di+0x62]
00030BDB  6C                insb
00030BDC  65C785C8FCFFFF    mov word [gs:di-0x338],0xffff
00030BE3  2028              and [bx+si],ch
00030BE5  4E                dec si
00030BE6  6F                outsw
00030BE7  C785CCFCFFFF      mov word [di-0x334],0xffff
00030BED  204D61            and [di+0x61],cl
00030BF0  74C7              jz 0xbb9
00030BF2  85D0              test ax,dx
00030BF4  FC                cld
00030BF5  FF                db 0xff
00030BF6  FF6820            jmp word far [bx+si+0x20]
00030BF9  43                inc bx
00030BFA  6F                outsw
00030BFB  C785D4FCFFFF      mov word [di-0x32c],0xffff
00030C01  7072              jo 0xc75
00030C03  6F                outsw
00030C04  63C7              arpl di,ax
00030C06  85D8              test ax,bx
00030C08  FC                cld
00030C09  FF                db 0xff
00030C0A  FF6573            jmp word [di+0x73]
00030C0D  736F              jnc 0xc7e
00030C0F  C785DCFCFFFF      mov word [di-0x324],0xffff
00030C15  7229              jc 0xc40
00030C17  0000              add [bx+si],al
00030C19  C785E0FCFFFF      mov word [di-0x320],0xffff
00030C1F  0000              add [bx+si],al
00030C21  0000              add [bx+si],al
00030C23  C785E4FCFFFF      mov word [di-0x31c],0xffff
00030C29  0000              add [bx+si],al
00030C2B  0000              add [bx+si],al
00030C2D  C785E8FCFFFF      mov word [di-0x318],0xffff
00030C33  0000              add [bx+si],al
00030C35  0000              add [bx+si],al
00030C37  C785ECFCFFFF      mov word [di-0x314],0xffff
00030C3D  0000              add [bx+si],al
00030C3F  0000              add [bx+si],al
00030C41  C785F0FCFFFF      mov word [di-0x310],0xffff
00030C47  234446            and ax,[si+0x46]
00030C4A  20C7              and bh,al
00030C4C  85F4              test sp,si
00030C4E  FC                cld
00030C4F  FF                db 0xff
00030C50  FF446F            inc word [si+0x6f]
00030C53  7562              jnz 0xcb7
00030C55  C785F8FCFFFF      mov word [di-0x308],0xffff
00030C5B  6C                insb
00030C5C  652046C7          and [gs:bp-0x39],al
00030C60  85FC              test sp,di
00030C62  FC                cld
00030C63  FF                db 0xff
00030C64  FF6175            jmp word [bx+di+0x75]
00030C67  6C                insb
00030C68  74C7              jz 0xc31
00030C6A  8500              test [bx+si],ax
00030C6C  FD                std
00030C6D  FF                db 0xff
00030C6E  FF00              inc word [bx+si]
00030C70  0000              add [bx+si],al
00030C72  008D9D04          add [di+0x49d],cl
00030C76  FD                std
00030C77  FF                db 0xff
00030C78  FF                db 0xff
00030C79  B80000            mov ax,0x0
00030C7C  0000              add [bx+si],al
00030C7E  BA0B00            mov dx,0xb
00030C81  0000              add [bx+si],al
00030C83  89DF              mov di,bx
00030C85  89D1              mov cx,dx
00030C87  F3AB              rep stosw
00030C89  C78530FDFFFF      mov word [di-0x2d0],0xffff
00030C8F  43                inc bx
00030C90  6F                outsw
00030C91  7072              jo 0xd05
00030C93  C78534FDFFFF      mov word [di-0x2cc],0xffff
00030C99  6F                outsw
00030C9A  636573            arpl [di+0x73],sp
00030C9D  C78538FDFFFF      mov word [di-0x2c8],0xffff
00030CA3  736F              jnc 0xd14
00030CA5  7220              jc 0xcc7
00030CA7  C7853CFDFFFF      mov word [di-0x2c4],0xffff
00030CAD  53                push bx
00030CAE  65676D            gs a32 insw
00030CB1  C78540FDFFFF      mov word [di-0x2c0],0xffff
00030CB7  656E              gs outsb
00030CB9  7420              jz 0xcdb
00030CBB  C78544FDFFFF      mov word [di-0x2bc],0xffff
00030CC1  4F                dec di
00030CC2  7665              jna 0xd29
00030CC4  72C7              jc 0xc8d
00030CC6  8548FD            test [bx+si-0x3],cx
00030CC9  FF                db 0xff
00030CCA  FF7275            push word [bp+si+0x75]
00030CCD  6E                outsb
00030CCE  28C7              sub bh,al
00030CD0  854CFD            test [si-0x3],cx
00030CD3  FF                db 0xff
00030CD4  FF7265            push word [bp+si+0x65]
00030CD7  7365              jnc 0xd3e
00030CD9  C78550FDFFFF      mov word [di-0x2b0],0xffff
00030CDF  7276              jc 0xd57
00030CE1  6564C78554FDFFFF  mov word [fs:di-0x2ac],0xffff
00030CE9  2900              sub [bx+si],ax
00030CEB  0000              add [bx+si],al
00030CED  8D9558FD          lea dx,[di-0x2a8]
00030CF1  FF                db 0xff
00030CF2  FF                db 0xff
00030CF3  B90000            mov cx,0x0
00030CF6  0000              add [bx+si],al
00030CF8  B81800            mov ax,0x18
00030CFB  0000              add [bx+si],al
00030CFD  89C3              mov bx,ax
00030CFF  83E3FC            and bx,byte -0x4
00030D02  B80000            mov ax,0x0
00030D05  0000              add [bx+si],al
00030D07  890C              mov [si],cx
00030D09  0283C004          add al,[bp+di+0x4c0]
00030D0D  39D8              cmp ax,bx
00030D0F  72F6              jc 0xd07
00030D11  01C2              add dx,ax
00030D13  C78570FDFFFF      mov word [di-0x290],0xffff
00030D19  235453            and dx,[si+0x53]
00030D1C  20C7              and bh,al
00030D1E  8574FD            test [si-0x3],si
00030D21  FF                db 0xff
00030D22  FF496E            dec word [bx+di+0x6e]
00030D25  7661              jna 0xd88
00030D27  C78578FDFFFF      mov word [di-0x288],0xffff
00030D2D  6C                insb
00030D2E  696420C785        imul sp,[si+0x20],word 0x85c7
00030D33  7CFD              jl 0xd32
00030D35  FF                db 0xff
00030D36  FF5453            call word [si+0x53]
00030D39  53                push bx
00030D3A  008D9D80          add [di-0x7f63],cl
00030D3E  FD                std
00030D3F  FF                db 0xff
00030D40  FF                db 0xff
00030D41  B80000            mov ax,0x0
00030D44  0000              add [bx+si],al
00030D46  BA0C00            mov dx,0xc
00030D49  0000              add [bx+si],al
00030D4B  89DF              mov di,bx
00030D4D  89D1              mov cx,dx
00030D4F  F3AB              rep stosw
00030D51  C785B0FDFFFF      mov word [di-0x250],0xffff
00030D57  234E50            and cx,[bp+0x50]
00030D5A  20C7              and bh,al
00030D5C  85B4FDFF          test [si-0x3],si
00030D60  FF5365            call word [bp+di+0x65]
00030D63  676D              a32 insw
00030D65  C785B8FDFFFF      mov word [di-0x248],0xffff
00030D6B  656E              gs outsb
00030D6D  7420              jz 0xd8f
00030D6F  C785BCFDFFFF      mov word [di-0x244],0xffff
00030D75  4E                dec si
00030D76  6F                outsw
00030D77  7420              jz 0xd99
00030D79  C785C0FDFFFF      mov word [di-0x240],0xffff
00030D7F  50                push ax
00030D80  7265              jc 0xde7
00030D82  73C7              jnc 0xd4b
00030D84  85C4              test sp,ax
00030D86  FD                std
00030D87  FF                db 0xff
00030D88  FF656E            jmp word [di+0x6e]
00030D8B  7400              jz 0xd8d
00030D8D  8D9DC8FD          lea bx,[di-0x238]
00030D91  FF                db 0xff
00030D92  FF                db 0xff
00030D93  B80000            mov ax,0x0
00030D96  0000              add [bx+si],al
00030D98  BA0A00            mov dx,0xa
00030D9B  0000              add [bx+si],al
00030D9D  89DF              mov di,bx
00030D9F  89D1              mov cx,dx
00030DA1  F3AB              rep stosw
00030DA3  C785F0FDFFFF      mov word [di-0x210],0xffff
00030DA9  235353            and dx,[bp+di+0x53]
00030DAC  20C7              and bh,al
00030DAE  85F4              test sp,si
00030DB0  FD                std
00030DB1  FF                db 0xff
00030DB2  FF5374            call word [bp+di+0x74]
00030DB5  61                popaw
00030DB6  63C7              arpl di,ax
00030DB8  85F8              test ax,di
00030DBA  FD                std
00030DBB  FF                db 0xff
00030DBC  FF6B2D            jmp word far [bp+di+0x2d]
00030DBF  53                push bx
00030DC0  65C785FCFDFFFF    mov word [gs:di-0x204],0xffff
00030DC7  676D              a32 insw
00030DC9  656E              gs outsb
00030DCB  C78500FEFFFF      mov word [di-0x200],0xffff
00030DD1  7420              jz 0xdf3
00030DD3  46                inc si
00030DD4  61                popaw
00030DD5  C78504FEFFFF      mov word [di-0x1fc],0xffff
00030DDB  756C              jnz 0xe49
00030DDD  7400              jz 0xddf
00030DDF  8D9D08FE          lea bx,[di-0x1f8]
00030DE3  FF                db 0xff
00030DE4  FF                db 0xff
00030DE5  B80000            mov ax,0x0
00030DE8  0000              add [bx+si],al
00030DEA  BA0A00            mov dx,0xa
00030DED  0000              add [bx+si],al
00030DEF  89DF              mov di,bx
00030DF1  89D1              mov cx,dx
00030DF3  F3AB              rep stosw
00030DF5  C78530FEFFFF      mov word [di-0x1d0],0xffff
00030DFB  234750            and ax,[bx+0x50]
00030DFE  20C7              and bh,al
00030E00  8534              test [si],si
00030E02  FE                db 0xfe
00030E03  FF                db 0xff
00030E04  FF4765            inc word [bx+0x65]
00030E07  6E                outsb
00030E08  65C78538FEFFFF    mov word [gs:di-0x1c8],0xffff
00030E0F  7261              jc 0xe72
00030E11  6C                insb
00030E12  20C7              and bh,al
00030E14  853C              test [si],di
00030E16  FE                db 0xfe
00030E17  FF                db 0xff
00030E18  FF5072            call word [bx+si+0x72]
00030E1B  6F                outsw
00030E1C  74C7              jz 0xde5
00030E1E  8540FE            test [bx+si-0x2],ax
00030E21  FF                db 0xff
00030E22  FF6563            jmp word [di+0x63]
00030E25  7469              jz 0xe90
00030E27  C78544FEFFFF      mov word [di-0x1bc],0xffff
00030E2D  6F                outsw
00030E2E  6E                outsb
00030E2F  0000              add [bx+si],al
00030E31  8D9D48FE          lea bx,[di-0x1b8]
00030E35  FF                db 0xff
00030E36  FF                db 0xff
00030E37  B80000            mov ax,0x0
00030E3A  0000              add [bx+si],al
00030E3C  BA0A00            mov dx,0xa
00030E3F  0000              add [bx+si],al
00030E41  89DF              mov di,bx
00030E43  89D1              mov cx,dx
00030E45  F3AB              rep stosw
00030E47  C78570FEFFFF      mov word [di-0x190],0xffff
00030E4D  235046            and dx,[bx+si+0x46]
00030E50  20C7              and bh,al
00030E52  8574FE            test [si-0x2],si
00030E55  FF                db 0xff
00030E56  FF5061            call word [bx+si+0x61]
00030E59  6765C78578FEFFFF  mov word [gs:ebp-0x188],0x4620
         -2046
00030E63  61                popaw
00030E64  75C7              jnz 0xe2d
00030E66  857CFE            test [si-0x2],di
00030E69  FF                db 0xff
00030E6A  FF6C74            jmp word far [si+0x74]
00030E6D  0000              add [bx+si],al
00030E6F  8D9D80FE          lea bx,[di-0x180]
00030E73  FF                db 0xff
00030E74  FF                db 0xff
00030E75  B80000            mov ax,0x0
00030E78  0000              add [bx+si],al
00030E7A  BA0C00            mov dx,0xc
00030E7D  0000              add [bx+si],al
00030E7F  89DF              mov di,bx
00030E81  89D1              mov cx,dx
00030E83  F3AB              rep stosw
00030E85  C785B0FEFFFF      mov word [di-0x150],0xffff
00030E8B  2D2028            sub ax,0x2820
00030E8E  49                dec cx
00030E8F  C785B4FEFFFF      mov word [di-0x14c],0xffff
00030E95  6E                outsb
00030E96  7465              jz 0xefd
00030E98  72C7              jc 0xe61
00030E9A  85B8FEFF          test [bx+si-0x2],di
00030E9E  FF6C20            jmp word far [si+0x20]
00030EA1  7265              jc 0xf08
00030EA3  C785BCFEFFFF      mov word [di-0x144],0xffff
00030EA9  7365              jnc 0xf10
00030EAB  7276              jc 0xf23
00030EAD  C785C0FEFFFF      mov word [di-0x140],0xffff
00030EB3  65642E20C7        cs and bh,al
00030EB8  85C4              test sp,ax
00030EBA  FE                db 0xfe
00030EBB  FF                db 0xff
00030EBC  FF446F            inc word [si+0x6f]
00030EBF  206EC7            and [bp-0x39],ch
00030EC2  85C8              test ax,cx
00030EC4  FE                db 0xfe
00030EC5  FF                db 0xff
00030EC6  FF6F74            jmp word far [bx+0x74]
00030EC9  7573              jnz 0xf3e
00030ECB  C785CCFEFFFF      mov word [di-0x134],0xffff
00030ED1  652E2900          sub [cs:bx+si],ax
00030ED5  8D95D0FE          lea dx,[di-0x130]
00030ED9  FF                db 0xff
00030EDA  FF                db 0xff
00030EDB  B90000            mov cx,0x0
00030EDE  0000              add [bx+si],al
00030EE0  B82000            mov ax,0x20
00030EE3  0000              add [bx+si],al
00030EE5  89C3              mov bx,ax
00030EE7  83E3FC            and bx,byte -0x4
00030EEA  B80000            mov ax,0x0
00030EED  0000              add [bx+si],al
00030EEF  890C              mov [si],cx
00030EF1  0283C004          add al,[bp+di+0x4c0]
00030EF5  39D8              cmp ax,bx
00030EF7  72F6              jc 0xeef
00030EF9  01C2              add dx,ax
00030EFB  C785F0FEFFFF      mov word [di-0x110],0xffff
00030F01  234D46            and cx,[di+0x46]
00030F04  20C7              and bh,al
00030F06  85F4              test sp,si
00030F08  FE                db 0xfe
00030F09  FF                db 0xff
00030F0A  FF                db 0xff
00030F0B  7838              js 0xf45
00030F0D  37                aaa
00030F0E  20C7              and bh,al
00030F10  85F8              test ax,di
00030F12  FE                db 0xfe
00030F13  FF                db 0xff
00030F14  FF4650            inc word [bp+0x50]
00030F17  55                push bp
00030F18  20C7              and bh,al
00030F1A  85FC              test sp,di
00030F1C  FE                db 0xfe
00030F1D  FF                db 0xff
00030F1E  FF466C            inc word [bp+0x6c]
00030F21  6F                outsw
00030F22  61                popaw
00030F23  C78500FFFFFF      mov word [di-0x100],0xffff
00030F29  7469              jz 0xf94
00030F2B  6E                outsb
00030F2C  67C78504FFFFFF2D  mov word [ebp-0xfc],0x502d
         -50
00030F35  6F                outsw
00030F36  69C78508          imul ax,di,word 0x885
00030F3A  FF                db 0xff
00030F3B  FF                db 0xff
00030F3C  FF6E74            jmp word far [bp+0x74]
00030F3F  2045C7            and [di-0x39],al
00030F42  850C              test [si],cx
00030F44  FF                db 0xff
00030F45  FF                db 0xff
00030F46  FF7272            push word [bp+si+0x72]
00030F49  6F                outsw
00030F4A  72C7              jc 0xf13
00030F4C  8510              test [bx+si],dx
00030F4E  FF                db 0xff
00030F4F  FF                db 0xff
00030F50  FF20              jmp word [bx+si]
00030F52  284D61            sub [di+0x61],cl
00030F55  C78514FFFFFF      mov word [di-0xec],0xffff
00030F5B  7468              jz 0xfc5
00030F5D  2046C7            and [bp-0x39],al
00030F60  8518              test [bx+si],bx
00030F62  FF                db 0xff
00030F63  FF                db 0xff
00030F64  FF6175            jmp word [bx+di+0x75]
00030F67  6C                insb
00030F68  74C7              jz 0xf31
00030F6A  851C              test [si],bx
00030F6C  FF                db 0xff
00030F6D  FF                db 0xff
00030F6E  FF29              jmp word far [bx+di]
00030F70  0000              add [bx+si],al
00030F72  00C7              add bh,al
00030F74  8520              test [bx+si],sp
00030F76  FF                db 0xff
00030F77  FF                db 0xff
00030F78  FF00              inc word [bx+si]
00030F7A  0000              add [bx+si],al
00030F7C  00C7              add bh,al
00030F7E  8524              test [si],sp
00030F80  FF                db 0xff
00030F81  FF                db 0xff
00030F82  FF00              inc word [bx+si]
00030F84  0000              add [bx+si],al
00030F86  00C7              add bh,al
00030F88  8528              test [bx+si],bp
00030F8A  FF                db 0xff
00030F8B  FF                db 0xff
00030F8C  FF00              inc word [bx+si]
00030F8E  0000              add [bx+si],al
00030F90  00C7              add bh,al
00030F92  852C              test [si],bp
00030F94  FF                db 0xff
00030F95  FF                db 0xff
00030F96  FF00              inc word [bx+si]
00030F98  0000              add [bx+si],al
00030F9A  00C7              add bh,al
00030F9C  8530              test [bx+si],si
00030F9E  FF                db 0xff
00030F9F  FF                db 0xff
00030FA0  FF23              jmp word [bp+di]
00030FA2  41                inc cx
00030FA3  43                inc bx
00030FA4  20C7              and bh,al
00030FA6  8534              test [si],si
00030FA8  FF                db 0xff
00030FA9  FF                db 0xff
00030FAA  FF416C            inc word [bx+di+0x6c]
00030FAD  6967C78538        imul sp,[bx-0x39],word 0x3885
00030FB2  FF                db 0xff
00030FB3  FF                db 0xff
00030FB4  FF6E6D            jmp word far [bp+0x6d]
00030FB7  656E              gs outsb
00030FB9  C7853CFFFFFF      mov word [di-0xc4],0xffff
00030FBF  7420              jz 0xfe1
00030FC1  43                inc bx
00030FC2  68C785            push word 0x85c7
00030FC5  40                inc ax
00030FC6  FF                db 0xff
00030FC7  FF                db 0xff
00030FC8  FF6563            jmp word [di+0x63]
00030FCB  6B008D            imul ax,[bx+si],byte -0x73
00030FCE  9D                popfw
00030FCF  44                inc sp
00030FD0  FF                db 0xff
00030FD1  FF                db 0xff
00030FD2  FF                db 0xff
00030FD3  B80000            mov ax,0x0
00030FD6  0000              add [bx+si],al
00030FD8  BA0B00            mov dx,0xb
00030FDB  0000              add [bx+si],al
00030FDD  89DF              mov di,bx
00030FDF  89D1              mov cx,dx
00030FE1  F3AB              rep stosw
00030FE3  C78570FFFFFF      mov word [di-0x90],0xffff
00030FE9  234D43            and cx,[di+0x43]
00030FEC  20C7              and bh,al
00030FEE  8574FF            test [si-0x1],si
00030FF1  FF                db 0xff
00030FF2  FF4D61            dec word [di+0x61]
00030FF5  6368C7            arpl [bx+si-0x39],bp
00030FF8  8578FF            test [bx+si-0x1],di
00030FFB  FF                db 0xff
00030FFC  FF696E            jmp word far [bx+di+0x6e]
00030FFF  6520C7            gs and bh,al
00031002  857CFF            test [si-0x1],di
00031005  FF                db 0xff
00031006  FF4368            inc word [bp+di+0x68]
00031009  6563C7            gs arpl di,ax
0003100C  45                inc bp
0003100D  806B0000          sub byte [bp+di+0x0],0x0
00031011  008D5D84          add [di-0x7ba3],cl
00031015  B80000            mov ax,0x0
00031018  0000              add [bx+si],al
0003101A  BA0B00            mov dx,0xb
0003101D  0000              add [bx+si],al
0003101F  89DF              mov di,bx
00031021  89D1              mov cx,dx
00031023  F3AB              rep stosw
00031025  C745B02358        mov word [di-0x50],0x5823
0003102A  46                inc si
0003102B  20C7              and bh,al
0003102D  45                inc bp
0003102E  B453              mov ah,0x53
00031030  49                dec cx
00031031  4D                dec bp
00031032  44                inc sp
00031033  C745B82046        mov word [di-0x48],0x4620
00031038  6C                insb
00031039  6F                outsw
0003103A  C745BC6174        mov word [di-0x44],0x7461
0003103F  696EC745C0        imul bp,[bp-0x39],word 0xc045
00031044  672D506F          sub ax,0x6f50
00031048  C745C4696E        mov word [di-0x3c],0x6e69
0003104D  7420              jz 0x106f
0003104F  C745C84578        mov word [di-0x38],0x7845
00031054  6365C7            arpl [di-0x39],sp
00031057  45                inc bp
00031058  CC                int3
00031059  7074              jo 0x10cf
0003105B  696FC745D0        imul bp,[bx-0x39],word 0xd045
00031060  6E                outsb
00031061  0000              add [bx+si],al
00031063  008D55D4          add [di-0x2bab],cl
00031067  B90000            mov cx,0x0
0003106A  0000              add [bx+si],al
0003106C  B81C00            mov ax,0x1c
0003106F  0000              add [bx+si],al
00031071  89C3              mov bx,ax
00031073  83E3FC            and bx,byte -0x4
00031076  B80000            mov ax,0x0
00031079  0000              add [bx+si],al
0003107B  890C              mov [si],cx
0003107D  0283C004          add al,[bp+di+0x4c0]
00031081  39D8              cmp ax,bx
00031083  72F6              jc 0x107b
00031085  01C2              add dx,ax
00031087  C70588B5          mov word [di],0xb588
0003108B  0300              add ax,[bx+si]
0003108D  0000              add [bx+si],al
0003108F  0000              add [bx+si],al
00031091  C745F40000        mov word [di-0xc],0x0
00031096  0000              add [bx+si],al
00031098  EB10              jmp short 0x10aa
0003109A  C70424B0          mov word [si],0xb024
0003109E  1803              sbb [bp+di],al
000310A0  00E8              add al,ch
000310A2  7A06              jpe 0x10aa
000310A4  0000              add [bx+si],al
000310A6  8345F401          add word [di-0xc],byte +0x1
000310AA  817DF48F01        cmp word [di-0xc],0x18f
000310AF  0000              add [bx+si],al
000310B1  7EE7              jng 0x109a
000310B3  C70588B5          mov word [di],0xb588
000310B7  0300              add ax,[bx+si]
000310B9  0000              add [bx+si],al
000310BB  0000              add [bx+si],al
000310BD  8B45F0            mov ax,[di-0x10]
000310C0  894424            mov [si+0x24],ax
000310C3  04C7              add al,0xc7
000310C5  0424              add al,0x24
000310C7  B218              mov dl,0x18
000310C9  0300              add ax,[bx+si]
000310CB  E88E06            call word 0x175c
000310CE  0000              add [bx+si],al
000310D0  8D85F0FA          lea ax,[di-0x510]
000310D4  FF                db 0xff
000310D5  FF8B5508          dec word [bp+di+0x855]
000310D9  C1E206            shl dx,byte 0x6
000310DC  8D14              lea dx,[si]
000310DE  108B45F0          adc [bp+di-0xfbb],cl
000310E2  894424            mov [si+0x24],ax
000310E5  0489              add al,0x89
000310E7  1424              adc al,0x24
000310E9  E87006            call word 0x175c
000310EC  0000              add [bx+si],al
000310EE  8B45F0            mov ax,[di-0x10]
000310F1  894424            mov [si+0x24],ax
000310F4  04C7              add al,0xc7
000310F6  0424              add al,0x24
000310F8  C3                ret
000310F9  1803              sbb [bp+di],al
000310FB  00E8              add al,ch
000310FD  5D                pop bp
000310FE  06                push es
000310FF  0000              add [bx+si],al
00031101  8B45F0            mov ax,[di-0x10]
00031104  894424            mov [si+0x24],ax
00031107  04C7              add al,0xc7
00031109  0424              add al,0x24
0003110B  C6                db 0xc6
0003110C  1803              sbb [bp+di],al
0003110E  00E8              add al,ch
00031110  4A                dec dx
00031111  06                push es
00031112  0000              add [bx+si],al
00031114  8B45F0            mov ax,[di-0x10]
00031117  894424            mov [si+0x24],ax
0003111A  04C7              add al,0xc7
0003111C  0424              add al,0x24
0003111E  CE                into
0003111F  1803              sbb [bp+di],al
00031121  00E8              add al,ch
00031123  37                aaa
00031124  06                push es
00031125  0000              add [bx+si],al
00031127  8B45F0            mov ax,[di-0x10]
0003112A  894424            mov [si+0x24],ax
0003112D  04C7              add al,0xc7
0003112F  0424              add al,0x24
00031131  D218              rcr byte [bx+si],cl
00031133  0300              add ax,[bx+si]
00031135  E82406            call word 0x175c
00031138  0000              add [bx+si],al
0003113A  837D0CFF          cmp word [di+0xc],byte -0x1
0003113E  7413              jz 0x1153
00031140  8B45F0            mov ax,[di-0x10]
00031143  894424            mov [si+0x24],ax
00031146  04C7              add al,0xc7
00031148  0424              add al,0x24
0003114A  D7                xlatb
0003114B  1803              sbb [bp+di],al
0003114D  00E8              add al,ch
0003114F  0B060000          or ax,[0x0]
00031153  81C42005          add sp,0x520
00031157  0000              add [bx+si],al
00031159  5B                pop bx
0003115A  5F                pop di
0003115B  5D                pop bp
0003115C  C3                ret
0003115D  55                push bp
0003115E  89E5              mov bp,sp
00031160  83EC14            sub sp,byte +0x14
00031163  8B4508            mov ax,[di+0x8]
00031166  668945EC          mov [di-0x14],eax
0003116A  0F                db 0x0f
0003116B  B745              mov bh,0x45
0003116D  EC                in al,dx
0003116E  66C1E803          shr eax,byte 0x3
00031172  0F                db 0x0f
00031173  B7C0              mov bh,0xc0
00031175  C1E003            shl ax,byte 0x3
00031178  0520B1            add ax,0xb120
0003117B  0300              add ax,[bx+si]
0003117D  8945FC            mov [di-0x4],ax
00031180  8B45FC            mov ax,[di-0x4]
00031183  0FB64007          movzx ax,[bx+si+0x7]
00031187  0FB6C0            movzx ax,al
0003118A  89C2              mov dx,ax
0003118C  C1E218            shl dx,byte 0x18
0003118F  8B45FC            mov ax,[di-0x4]
00031192  0FB64004          movzx ax,[bx+si+0x4]
00031196  0FB6C0            movzx ax,al
00031199  C1E010            shl ax,byte 0x10
0003119C  09C2              or dx,ax
0003119E  8B45FC            mov ax,[di-0x4]
000311A1  0F                db 0x0f
000311A2  B740              mov bh,0x40
000311A4  020F              add cl,[bx]
000311A6  B7C0              mov bh,0xc0
000311A8  09D0              or ax,dx
000311AA  C9                leave
000311AB  C3                ret
000311AC  55                push bp
000311AD  89E5              mov bp,sp
000311AF  83EC18            sub sp,byte +0x18
000311B2  E8D0F5            call word 0x785
000311B5  FF                db 0xff
000311B6  FFC7              inc di
000311B8  44                inc sp
000311B9  240C              and al,0xc
000311BB  0000              add [bx+si],al
000311BD  0000              add [bx+si],al
000311BF  C74424085B        mov word [si+0x24],0x5b08
000311C4  050300            add ax,0x3
000311C7  C74424048E        mov word [si+0x24],0x8e04
000311CC  0000              add [bx+si],al
000311CE  00C7              add bh,al
000311D0  0424              add al,0x24
000311D2  0000              add [bx+si],al
000311D4  0000              add [bx+si],al
000311D6  E808F7            call word 0x8e1
000311D9  FF                db 0xff
000311DA  FFC7              inc di
000311DC  44                inc sp
000311DD  240C              and al,0xc
000311DF  0000              add [bx+si],al
000311E1  0000              add [bx+si],al
000311E3  C744240861        mov word [si+0x24],0x6108
000311E8  050300            add ax,0x3
000311EB  C74424048E        mov word [si+0x24],0x8e04
000311F0  0000              add [bx+si],al
000311F2  00C7              add bh,al
000311F4  0424              add al,0x24
000311F6  0100              add [bx+si],ax
000311F8  0000              add [bx+si],al
000311FA  E8E4F6            call word 0x8e1
000311FD  FF                db 0xff
000311FE  FFC7              inc di
00031200  44                inc sp
00031201  240C              and al,0xc
00031203  0000              add [bx+si],al
00031205  0000              add [bx+si],al
00031207  C744240867        mov word [si+0x24],0x6708
0003120C  050300            add ax,0x3
0003120F  C74424048E        mov word [si+0x24],0x8e04
00031214  0000              add [bx+si],al
00031216  00C7              add bh,al
00031218  0424              add al,0x24
0003121A  0200              add al,[bx+si]
0003121C  0000              add [bx+si],al
0003121E  E8C0F6            call word 0x8e1
00031221  FF                db 0xff
00031222  FFC7              inc di
00031224  44                inc sp
00031225  240C              and al,0xc
00031227  0300              add ax,[bx+si]
00031229  0000              add [bx+si],al
0003122B  C74424086D        mov word [si+0x24],0x6d08
00031230  050300            add ax,0x3
00031233  C74424048E        mov word [si+0x24],0x8e04
00031238  0000              add [bx+si],al
0003123A  00C7              add bh,al
0003123C  0424              add al,0x24
0003123E  0300              add ax,[bx+si]
00031240  0000              add [bx+si],al
00031242  E89CF6            call word 0x8e1
00031245  FF                db 0xff
00031246  FFC7              inc di
00031248  44                inc sp
00031249  240C              and al,0xc
0003124B  0300              add ax,[bx+si]
0003124D  0000              add [bx+si],al
0003124F  C744240873        mov word [si+0x24],0x7308
00031254  050300            add ax,0x3
00031257  C74424048E        mov word [si+0x24],0x8e04
0003125C  0000              add [bx+si],al
0003125E  00C7              add bh,al
00031260  0424              add al,0x24
00031262  0400              add al,0x0
00031264  0000              add [bx+si],al
00031266  E878F6            call word 0x8e1
00031269  FF                db 0xff
0003126A  FFC7              inc di
0003126C  44                inc sp
0003126D  240C              and al,0xc
0003126F  0000              add [bx+si],al
00031271  0000              add [bx+si],al
00031273  C744240879        mov word [si+0x24],0x7908
00031278  050300            add ax,0x3
0003127B  C74424048E        mov word [si+0x24],0x8e04
00031280  0000              add [bx+si],al
00031282  00C7              add bh,al
00031284  0424              add al,0x24
00031286  050000            add ax,0x0
00031289  00E8              add al,ch
0003128B  54                push sp
0003128C  F6FF              idiv bh
0003128E  FFC7              inc di
00031290  44                inc sp
00031291  240C              and al,0xc
00031293  0000              add [bx+si],al
00031295  0000              add [bx+si],al
00031297  C74424087F        mov word [si+0x24],0x7f08
0003129C  050300            add ax,0x3
0003129F  C74424048E        mov word [si+0x24],0x8e04
000312A4  0000              add [bx+si],al
000312A6  00C7              add bh,al
000312A8  0424              add al,0x24
000312AA  06                push es
000312AB  0000              add [bx+si],al
000312AD  00E8              add al,ch
000312AF  30F6              xor dh,dh
000312B1  FF                db 0xff
000312B2  FFC7              inc di
000312B4  44                inc sp
000312B5  240C              and al,0xc
000312B7  0000              add [bx+si],al
000312B9  0000              add [bx+si],al
000312BB  C744240885        mov word [si+0x24],0x8508
000312C0  050300            add ax,0x3
000312C3  C74424048E        mov word [si+0x24],0x8e04
000312C8  0000              add [bx+si],al
000312CA  00C7              add bh,al
000312CC  0424              add al,0x24
000312CE  07                pop es
000312CF  0000              add [bx+si],al
000312D1  00E8              add al,ch
000312D3  0CF6              or al,0xf6
000312D5  FF                db 0xff
000312D6  FFC7              inc di
000312D8  44                inc sp
000312D9  240C              and al,0xc
000312DB  0000              add [bx+si],al
000312DD  0000              add [bx+si],al
000312DF  C74424088B        mov word [si+0x24],0x8b08
000312E4  050300            add ax,0x3
000312E7  C74424048E        mov word [si+0x24],0x8e04
000312EC  0000              add [bx+si],al
000312EE  00C7              add bh,al
000312F0  0424              add al,0x24
000312F2  0800              or [bx+si],al
000312F4  0000              add [bx+si],al
000312F6  E8E8F5            call word 0x8e1
000312F9  FF                db 0xff
000312FA  FFC7              inc di
000312FC  44                inc sp
000312FD  240C              and al,0xc
000312FF  0000              add [bx+si],al
00031301  0000              add [bx+si],al
00031303  C74424088F        mov word [si+0x24],0x8f08
00031308  050300            add ax,0x3
0003130B  C74424048E        mov word [si+0x24],0x8e04
00031310  0000              add [bx+si],al
00031312  00C7              add bh,al
00031314  0424              add al,0x24
00031316  0900              or [bx+si],ax
00031318  0000              add [bx+si],al
0003131A  E8C4F5            call word 0x8e1
0003131D  FF                db 0xff
0003131E  FFC7              inc di
00031320  44                inc sp
00031321  240C              and al,0xc
00031323  0000              add [bx+si],al
00031325  0000              add [bx+si],al
00031327  C744240895        mov word [si+0x24],0x9508
0003132C  050300            add ax,0x3
0003132F  C74424048E        mov word [si+0x24],0x8e04
00031334  0000              add [bx+si],al
00031336  00C7              add bh,al
00031338  0424              add al,0x24
0003133A  0A00              or al,[bx+si]
0003133C  0000              add [bx+si],al
0003133E  E8A0F5            call word 0x8e1
00031341  FF                db 0xff
00031342  FFC7              inc di
00031344  44                inc sp
00031345  240C              and al,0xc
00031347  0000              add [bx+si],al
00031349  0000              add [bx+si],al
0003134B  C744240899        mov word [si+0x24],0x9908
00031350  050300            add ax,0x3
00031353  C74424048E        mov word [si+0x24],0x8e04
00031358  0000              add [bx+si],al
0003135A  00C7              add bh,al
0003135C  0424              add al,0x24
0003135E  0B00              or ax,[bx+si]
00031360  0000              add [bx+si],al
00031362  E87CF5            call word 0x8e1
00031365  FF                db 0xff
00031366  FFC7              inc di
00031368  44                inc sp
00031369  240C              and al,0xc
0003136B  0000              add [bx+si],al
0003136D  0000              add [bx+si],al
0003136F  C74424089D        mov word [si+0x24],0x9d08
00031374  050300            add ax,0x3
00031377  C74424048E        mov word [si+0x24],0x8e04
0003137C  0000              add [bx+si],al
0003137E  00C7              add bh,al
00031380  0424              add al,0x24
00031382  0C00              or al,0x0
00031384  0000              add [bx+si],al
00031386  E858F5            call word 0x8e1
00031389  FF                db 0xff
0003138A  FFC7              inc di
0003138C  44                inc sp
0003138D  240C              and al,0xc
0003138F  0000              add [bx+si],al
00031391  0000              add [bx+si],al
00031393  C7442408A1        mov word [si+0x24],0xa108
00031398  050300            add ax,0x3
0003139B  C74424048E        mov word [si+0x24],0x8e04
000313A0  0000              add [bx+si],al
000313A2  00C7              add bh,al
000313A4  0424              add al,0x24
000313A6  0D0000            or ax,0x0
000313A9  00E8              add al,ch
000313AB  34F5              xor al,0xf5
000313AD  FF                db 0xff
000313AE  FFC7              inc di
000313B0  44                inc sp
000313B1  240C              and al,0xc
000313B3  0000              add [bx+si],al
000313B5  0000              add [bx+si],al
000313B7  C7442408A5        mov word [si+0x24],0xa508
000313BC  050300            add ax,0x3
000313BF  C74424048E        mov word [si+0x24],0x8e04
000313C4  0000              add [bx+si],al
000313C6  00C7              add bh,al
000313C8  0424              add al,0x24
000313CA  0E                push cs
000313CB  0000              add [bx+si],al
000313CD  00E8              add al,ch
000313CF  10F5              adc ch,dh
000313D1  FF                db 0xff
000313D2  FFC7              inc di
000313D4  44                inc sp
000313D5  240C              and al,0xc
000313D7  0000              add [bx+si],al
000313D9  0000              add [bx+si],al
000313DB  C7442408A9        mov word [si+0x24],0xa908
000313E0  050300            add ax,0x3
000313E3  C74424048E        mov word [si+0x24],0x8e04
000313E8  0000              add [bx+si],al
000313EA  00C7              add bh,al
000313EC  0424              add al,0x24
000313EE  1000              adc [bx+si],al
000313F0  0000              add [bx+si],al
000313F2  E8ECF4            call word 0x8e1
000313F5  FF                db 0xff
000313F6  FFC7              inc di
000313F8  44                inc sp
000313F9  240C              and al,0xc
000313FB  0000              add [bx+si],al
000313FD  0000              add [bx+si],al
000313FF  C744240840        mov word [si+0x24],0x4008
00031404  0403              add al,0x3
00031406  00C7              add bh,al
00031408  44                inc sp
00031409  2404              and al,0x4
0003140B  8E00              mov es,[bx+si]
0003140D  0000              add [bx+si],al
0003140F  C7042420          mov word [si],0x2024
00031413  0000              add [bx+si],al
00031415  00E8              add al,ch
00031417  C8F4FFFF          enter 0xfff4,0xff
0003141B  C744240C00        mov word [si+0x24],0xc
00031420  0000              add [bx+si],al
00031422  00C7              add bh,al
00031424  44                inc sp
00031425  2408              and al,0x8
00031427  50                push ax
00031428  0403              add al,0x3
0003142A  00C7              add bh,al
0003142C  44                inc sp
0003142D  2404              and al,0x4
0003142F  8E00              mov es,[bx+si]
00031431  0000              add [bx+si],al
00031433  C7042421          mov word [si],0x2124
00031437  0000              add [bx+si],al
00031439  00E8              add al,ch
0003143B  A4                movsb
0003143C  F4                hlt
0003143D  FF                db 0xff
0003143E  FFC7              inc di
00031440  44                inc sp
00031441  240C              and al,0xc
00031443  0000              add [bx+si],al
00031445  0000              add [bx+si],al
00031447  C744240880        mov word [si+0x24],0x8008
0003144C  0403              add al,0x3
0003144E  00C7              add bh,al
00031450  44                inc sp
00031451  2404              and al,0x4
00031453  8E00              mov es,[bx+si]
00031455  0000              add [bx+si],al
00031457  C7042422          mov word [si],0x2224
0003145B  0000              add [bx+si],al
0003145D  00E8              add al,ch
0003145F  80F4FF            xor ah,0xff
00031462  FFC7              inc di
00031464  44                inc sp
00031465  240C              and al,0xc
00031467  0300              add ax,[bx+si]
00031469  0000              add [bx+si],al
0003146B  C744240890        mov word [si+0x24],0x9008
00031470  0403              add al,0x3
00031472  00C7              add bh,al
00031474  44                inc sp
00031475  2404              and al,0x4
00031477  8E00              mov es,[bx+si]
00031479  0000              add [bx+si],al
0003147B  C7042423          mov word [si],0x2324
0003147F  0000              add [bx+si],al
00031481  00E8              add al,ch
00031483  5C                pop sp
00031484  F4                hlt
00031485  FF                db 0xff
00031486  FFC7              inc di
00031488  44                inc sp
00031489  240C              and al,0xc
0003148B  0300              add ax,[bx+si]
0003148D  0000              add [bx+si],al
0003148F  C7442408A0        mov word [si+0x24],0xa008
00031494  0403              add al,0x3
00031496  00C7              add bh,al
00031498  44                inc sp
00031499  2404              and al,0x4
0003149B  8E00              mov es,[bx+si]
0003149D  0000              add [bx+si],al
0003149F  C7042424          mov word [si],0x2424
000314A3  0000              add [bx+si],al
000314A5  00E8              add al,ch
000314A7  38F4              cmp ah,dh
000314A9  FF                db 0xff
000314AA  FFC7              inc di
000314AC  44                inc sp
000314AD  240C              and al,0xc
000314AF  0000              add [bx+si],al
000314B1  0000              add [bx+si],al
000314B3  C7442408B0        mov word [si+0x24],0xb008
000314B8  0403              add al,0x3
000314BA  00C7              add bh,al
000314BC  44                inc sp
000314BD  2404              and al,0x4
000314BF  8E00              mov es,[bx+si]
000314C1  0000              add [bx+si],al
000314C3  C7042425          mov word [si],0x2524
000314C7  0000              add [bx+si],al
000314C9  00E8              add al,ch
000314CB  14F4              adc al,0xf4
000314CD  FF                db 0xff
000314CE  FFC7              inc di
000314D0  44                inc sp
000314D1  240C              and al,0xc
000314D3  0000              add [bx+si],al
000314D5  0000              add [bx+si],al
000314D7  C7442408C0        mov word [si+0x24],0xc008
000314DC  0403              add al,0x3
000314DE  00C7              add bh,al
000314E0  44                inc sp
000314E1  2404              and al,0x4
000314E3  8E00              mov es,[bx+si]
000314E5  0000              add [bx+si],al
000314E7  C7042426          mov word [si],0x2624
000314EB  0000              add [bx+si],al
000314ED  00E8              add al,ch
000314EF  F0                lock
000314F0  F3                rep
000314F1  FF                db 0xff
000314F2  FFC7              inc di
000314F4  44                inc sp
000314F5  240C              and al,0xc
000314F7  0000              add [bx+si],al
000314F9  0000              add [bx+si],al
000314FB  C7442408D0        mov word [si+0x24],0xd008
00031500  0403              add al,0x3
00031502  00C7              add bh,al
00031504  44                inc sp
00031505  2404              and al,0x4
00031507  8E00              mov es,[bx+si]
00031509  0000              add [bx+si],al
0003150B  C7042427          mov word [si],0x2724
0003150F  0000              add [bx+si],al
00031511  00E8              add al,ch
00031513  CC                int3
00031514  F3                rep
00031515  FF                db 0xff
00031516  FFC7              inc di
00031518  44                inc sp
00031519  240C              and al,0xc
0003151B  0000              add [bx+si],al
0003151D  0000              add [bx+si],al
0003151F  C7442408E0        mov word [si+0x24],0xe008
00031524  0403              add al,0x3
00031526  00C7              add bh,al
00031528  44                inc sp
00031529  2404              and al,0x4
0003152B  8E00              mov es,[bx+si]
0003152D  0000              add [bx+si],al
0003152F  C7042428          mov word [si],0x2824
00031533  0000              add [bx+si],al
00031535  00E8              add al,ch
00031537  A8F3              test al,0xf3
00031539  FF                db 0xff
0003153A  FFC7              inc di
0003153C  44                inc sp
0003153D  240C              and al,0xc
0003153F  0000              add [bx+si],al
00031541  0000              add [bx+si],al
00031543  C7442408F0        mov word [si+0x24],0xf008
00031548  0403              add al,0x3
0003154A  00C7              add bh,al
0003154C  44                inc sp
0003154D  2404              and al,0x4
0003154F  8E00              mov es,[bx+si]
00031551  0000              add [bx+si],al
00031553  C7042429          mov word [si],0x2924
00031557  0000              add [bx+si],al
00031559  00E8              add al,ch
0003155B  84F3              test bl,dh
0003155D  FF                db 0xff
0003155E  FFC7              inc di
00031560  44                inc sp
00031561  240C              and al,0xc
00031563  0000              add [bx+si],al
00031565  0000              add [bx+si],al
00031567  C744240800        mov word [si+0x24],0x8
0003156C  050300            add ax,0x3
0003156F  C74424048E        mov word [si+0x24],0x8e04
00031574  0000              add [bx+si],al
00031576  00C7              add bh,al
00031578  0424              add al,0x24
0003157A  2A00              sub al,[bx+si]
0003157C  0000              add [bx+si],al
0003157E  E860F3            call word 0x8e1
00031581  FF                db 0xff
00031582  FFC7              inc di
00031584  44                inc sp
00031585  240C              and al,0xc
00031587  0000              add [bx+si],al
00031589  0000              add [bx+si],al
0003158B  C744240810        mov word [si+0x24],0x1008
00031590  050300            add ax,0x3
00031593  C74424048E        mov word [si+0x24],0x8e04
00031598  0000              add [bx+si],al
0003159A  00C7              add bh,al
0003159C  0424              add al,0x24
0003159E  2B00              sub ax,[bx+si]
000315A0  0000              add [bx+si],al
000315A2  E83CF3            call word 0x8e1
000315A5  FF                db 0xff
000315A6  FFC7              inc di
000315A8  44                inc sp
000315A9  240C              and al,0xc
000315AB  0000              add [bx+si],al
000315AD  0000              add [bx+si],al
000315AF  C744240820        mov word [si+0x24],0x2008
000315B4  050300            add ax,0x3
000315B7  C74424048E        mov word [si+0x24],0x8e04
000315BC  0000              add [bx+si],al
000315BE  00C7              add bh,al
000315C0  0424              add al,0x24
000315C2  2C00              sub al,0x0
000315C4  0000              add [bx+si],al
000315C6  E818F3            call word 0x8e1
000315C9  FF                db 0xff
000315CA  FFC7              inc di
000315CC  44                inc sp
000315CD  240C              and al,0xc
000315CF  0000              add [bx+si],al
000315D1  0000              add [bx+si],al
000315D3  C744240830        mov word [si+0x24],0x3008
000315D8  050300            add ax,0x3
000315DB  C74424048E        mov word [si+0x24],0x8e04
000315E0  0000              add [bx+si],al
000315E2  00C7              add bh,al
000315E4  0424              add al,0x24
000315E6  2D0000            sub ax,0x0
000315E9  00E8              add al,ch
000315EB  F4                hlt
000315EC  F2                repne
000315ED  FF                db 0xff
000315EE  FFC7              inc di
000315F0  44                inc sp
000315F1  240C              and al,0xc
000315F3  0000              add [bx+si],al
000315F5  0000              add [bx+si],al
000315F7  C744240840        mov word [si+0x24],0x4008
000315FC  050300            add ax,0x3
000315FF  C74424048E        mov word [si+0x24],0x8e04
00031604  0000              add [bx+si],al
00031606  00C7              add bh,al
00031608  0424              add al,0x24
0003160A  2E0000            add [cs:bx+si],al
0003160D  00E8              add al,ch
0003160F  D0                db 0xd0
00031610  F2                repne
00031611  FF                db 0xff
00031612  FFC7              inc di
00031614  44                inc sp
00031615  240C              and al,0xc
00031617  0000              add [bx+si],al
00031619  0000              add [bx+si],al
0003161B  C744240850        mov word [si+0x24],0x5008
00031620  050300            add ax,0x3
00031623  C74424048E        mov word [si+0x24],0x8e04
00031628  0000              add [bx+si],al
0003162A  00C7              add bh,al
0003162C  0424              add al,0x24
0003162E  2F                das
0003162F  0000              add [bx+si],al
00031631  00E8              add al,ch
00031633  AC                lodsb
00031634  F2                repne
00031635  FF                db 0xff
00031636  FFC7              inc di
00031638  0424              add al,0x24
0003163A  1000              adc [bx+si],al
0003163C  0000              add [bx+si],al
0003163E  E81AFB            call word 0x115b
00031641  FF                db 0xff
00031642  FF                db 0xff
00031643  BA0ABE            mov dx,0xbe0a
00031646  0300              add ax,[bx+si]
00031648  01D0              add ax,dx
0003164A  C744240C82        mov word [si+0x24],0x820c
0003164F  0000              add [bx+si],al
00031651  00C7              add bh,al
00031653  44                inc sp
00031654  2408              and al,0x8
00031656  1000              adc [bx+si],al
00031658  0000              add [bx+si],al
0003165A  894424            mov [si+0x24],ax
0003165D  04C7              add al,0xc7
0003165F  0424              add al,0x24
00031661  48                dec ax
00031662  B103              mov cl,0x3
00031664  00E8              add al,ch
00031666  0DF2FF            or ax,0xfff2
00031669  FFC7              inc di
0003166B  44                inc sp
0003166C  2408              and al,0x8
0003166E  680000            push word 0x0
00031671  00C7              add bh,al
00031673  44                inc sp
00031674  2404              and al,0x4
00031676  0000              add [bx+si],al
00031678  0000              add [bx+si],al
0003167A  C7042420          mov word [si],0x2024
0003167E  B503              mov ch,0x3
00031680  00E8              add al,ch
00031682  6301              arpl [bx+di],ax
00031684  0000              add [bx+si],al
00031686  C70528B5          mov word [di],0xb528
0003168A  0300              add ax,[bx+si]
0003168C  1000              adc [bx+si],al
0003168E  0000              add [bx+si],al
00031690  C7042410          mov word [si],0x1024
00031694  0000              add [bx+si],al
00031696  00E8              add al,ch
00031698  C1FAFF            sar dx,byte 0xff
0003169B  FF                db 0xff
0003169C  BA20B5            mov dx,0xb520
0003169F  0300              add ax,[bx+si]
000316A1  01D0              add ax,dx
000316A3  C744240C89        mov word [si+0x24],0x890c
000316A8  0000              add [bx+si],al
000316AA  00C7              add bh,al
000316AC  44                inc sp
000316AD  2408              and al,0x8
000316AF  670000            add [eax],al
000316B2  00894424          add [bx+di+0x2444],cl
000316B6  04C7              add al,0xc7
000316B8  0424              add al,0x24
000316BA  40                inc ax
000316BB  B103              mov cl,0x3
000316BD  00E8              add al,ch
000316BF  B4F1              mov ah,0xf1
000316C1  FF                db 0xff
000316C2  FF66C7            jmp word [bp-0x39]
000316C5  0586B5            add ax,0xb586
000316C8  0300              add ax,[bx+si]
000316CA  6800C9            push word 0xc900
000316CD  C3                ret
000316CE  55                push bp
000316CF  89E5              mov bp,sp
000316D1  83EC10            sub sp,byte +0x10
000316D4  C745F40000        mov word [di-0xc],0x0
000316D9  0000              add [bx+si],al
000316DB  EB30              jmp short 0x170d
000316DD  C745FC0000        mov word [di-0x4],0x0
000316E2  0000              add [bx+si],al
000316E4  EB1A              jmp short 0x1700
000316E6  C745F80000        mov word [di-0x8],0x0
000316EB  0000              add [bx+si],al
000316ED  EB04              jmp short 0x16f3
000316EF  8345F801          add word [di-0x8],byte +0x1
000316F3  817DF80F27        cmp word [di-0x8],0x270f
000316F8  0000              add [bx+si],al
000316FA  7EF3              jng 0x16ef
000316FC  8345FC01          add word [di-0x4],byte +0x1
00031700  817DFC0F27        cmp word [di-0x4],0x270f
00031705  0000              add [bx+si],al
00031707  7EDD              jng 0x16e6
00031709  8345F401          add word [di-0xc],byte +0x1
0003170D  8B45F4            mov ax,[di-0xc]
00031710  3B4508            cmp ax,[di+0x8]
00031713  7CC8              jl 0x16dd
00031715  C9                leave
00031716  C3                ret
00031717  6690              xchg eax,eax
00031719  6690              xchg eax,eax
0003171B  6690              xchg eax,eax
0003171D  6690              xchg eax,eax
0003171F  90                nop
00031720  55                push bp
00031721  89E5              mov bp,sp
00031723  8B7508            mov si,[di+0x8]
00031726  8B3D              mov di,[di]
00031728  E428              in al,0x28
0003172A  0300              add ax,[bx+si]
0003172C  B40F              mov ah,0xf
0003172E  AC                lodsb
0003172F  84C0              test al,al
00031731  7423              jz 0x1756
00031733  3C0A              cmp al,0xa
00031735  7516              jnz 0x174d
00031737  50                push ax
00031738  89F8              mov ax,di
0003173A  B3A0              mov bl,0xa0
0003173C  F6F3              div bl
0003173E  25FF00            and ax,0xff
00031741  0000              add [bx+si],al
00031743  40                inc ax
00031744  B3A0              mov bl,0xa0
00031746  F6E3              mul bl
00031748  89C7              mov di,ax
0003174A  58                pop ax
0003174B  EBE1              jmp short 0x172e
0003174D  65668907          mov [gs:bx],eax
00031751  83C702            add di,byte +0x2
00031754  EBD8              jmp short 0x172e
00031756  893D              mov [di],di
00031758  E428              in al,0x28
0003175A  0300              add ax,[bx+si]
0003175C  5D                pop bp
0003175D  C3                ret
0003175E  55                push bp
0003175F  89E5              mov bp,sp
00031761  8B7508            mov si,[di+0x8]
00031764  8B3D              mov di,[di]
00031766  E428              in al,0x28
00031768  0300              add ax,[bx+si]
0003176A  8A650C            mov ah,[di+0xc]
0003176D  AC                lodsb
0003176E  84C0              test al,al
00031770  7423              jz 0x1795
00031772  3C0A              cmp al,0xa
00031774  7516              jnz 0x178c
00031776  50                push ax
00031777  89F8              mov ax,di
00031779  B3A0              mov bl,0xa0
0003177B  F6F3              div bl
0003177D  25FF00            and ax,0xff
00031780  0000              add [bx+si],al
00031782  40                inc ax
00031783  B3A0              mov bl,0xa0
00031785  F6E3              mul bl
00031787  89C7              mov di,ax
00031789  58                pop ax
0003178A  EBE1              jmp short 0x176d
0003178C  65668907          mov [gs:bx],eax
00031790  83C702            add di,byte +0x2
00031793  EBD8              jmp short 0x176d
00031795  893D              mov [di],di
00031797  E428              in al,0x28
00031799  0300              add ax,[bx+si]
0003179B  5D                pop bp
0003179C  C3                ret
0003179D  8B5424            mov dx,[si+0x24]
000317A0  048A              add al,0x8a
000317A2  44                inc sp
000317A3  2408              and al,0x8
000317A5  EE                out dx,al
000317A6  90                nop
000317A7  90                nop
000317A8  C3                ret
000317A9  8B5424            mov dx,[si+0x24]
000317AC  0431              add al,0x31
000317AE  C0EC90            shr ah,byte 0x90
000317B1  90                nop
000317B2  C3                ret
000317B3  6690              xchg eax,eax
000317B5  6690              xchg eax,eax
000317B7  6690              xchg eax,eax
000317B9  6690              xchg eax,eax
000317BB  6690              xchg eax,eax
000317BD  6690              xchg eax,eax
000317BF  90                nop
000317C0  55                push bp
000317C1  89E5              mov bp,sp
000317C3  56                push si
000317C4  57                push di
000317C5  51                push cx
000317C6  8B7D08            mov di,[di+0x8]
000317C9  8B750C            mov si,[di+0xc]
000317CC  8B4D10            mov cx,[di+0x10]
000317CF  83F900            cmp cx,byte +0x0
000317D2  740B              jz 0x17df
000317D4  3E8A064626        mov al,[ds:0x2646]
000317D9  8807              mov [bx],al
000317DB  47                inc di
000317DC  49                dec cx
000317DD  EBF0              jmp short 0x17cf
000317DF  8B4508            mov ax,[di+0x8]
000317E2  59                pop cx
000317E3  5F                pop di
000317E4  5E                pop si
000317E5  89EC              mov sp,bp
000317E7  5D                pop bp
000317E8  C3                ret
000317E9  55                push bp
000317EA  89E5              mov bp,sp
000317EC  56                push si
000317ED  57                push di
000317EE  51                push cx
000317EF  8B7D08            mov di,[di+0x8]
000317F2  8B550C            mov dx,[di+0xc]
000317F5  8B4D10            mov cx,[di+0x10]
000317F8  83F900            cmp cx,byte +0x0
000317FB  7406              jz 0x1803
000317FD  8817              mov [bx],dl
000317FF  47                inc di
00031800  49                dec cx
00031801  EBF5              jmp short 0x17f8
00031803  59                pop cx
00031804  5F                pop di
00031805  5E                pop si
00031806  89EC              mov sp,bp
00031808  5D                pop bp
00031809  C3                ret
0003180A  0000              add [bx+si],al
0003180C  0A0A              or cl,[bp+si]
0003180E  0A0A              or cl,[bp+si]
00031810  0A0A              or cl,[bp+si]
00031812  2D2D2D            sub ax,0x2d2d
00031815  2D2D22            sub ax,0x222d
00031818  637374            arpl [bp+di+0x74],si
0003181B  61                popaw
0003181C  7274              jc 0x1892
0003181E  2220              and ah,[bx+si]
00031820  2020              and [bx+si],ah
00031822  626567            bound sp,[di+0x67]
00031825  696E6E6564        imul bp,[bp+0x6e],word 0x6465
0003182A  2D2D2D            sub ax,0x2d2d
0003182D  2D2D0A            sub ax,0xa2d
00031830  002D              add [di],ch
00031832  2D2D2D            sub ax,0x2d2d
00031835  2D2263            sub ax,0x6322
00031838  7374              jnc 0x18ae
0003183A  61                popaw
0003183B  7274              jc 0x18b1
0003183D  2209              and cl,[bx+di]
0003183F  66696E6973686564  imul ebp,[bp+0x69],dword 0x64656873
00031847  2D2D2D            sub ax,0x2d2d
0003184A  2D2D0A            sub ax,0xa2d
0003184D  004100            add [bx+di+0x0],al
00031850  2E002D            add [cs:di],ch
00031853  2D2D2D            sub ax,0x2d2d
00031856  2D2266            sub ax,0x6622
00031859  6973686F73        imul si,[bp+di+0x68],word 0x736f
0003185E  5F                pop di
0003185F  6D                insw
00031860  61                popaw
00031861  696E222D2D        imul bp,[bp+0x22],word 0x2d2d
00031866  2D2D2D            sub ax,0x2d2d
00031869  0A00              or al,[bx+si]
0003186B  2D2D2D            sub ax,0x2d2d
0003186E  2D2D22            sub ax,0x222d
00031871  666973686F735F6D  imul esi,[bp+di+0x68],dword 0x6d5f736f
00031879  61                popaw
0003187A  696E31222D        imul bp,[bp+0x31],word 0x2d22
0003187F  2D2D2D            sub ax,0x2d2d
00031882  2D0A00            sub ax,0xa
00031885  2D2D2D            sub ax,0x2d2d
00031888  2D2D22            sub ax,0x222d
0003188B  666973686F735F6D  imul esi,[bp+di+0x68],dword 0x6d5f736f
00031893  61                popaw
00031894  696E32222D        imul bp,[bp+0x32],word 0x2d22
00031899  2D2D2D            sub ax,0x2d2d
0003189C  2D0A00            sub ax,0xa
0003189F  7370              jnc 0x1911
000318A1  7572              jnz 0x1915
000318A3  696F75735F        imul bp,[bx+0x75],word 0x5f73
000318A8  6972713A20        imul si,[bp+si+0x71],word 0x203a
000318AD  000A              add [bp+si],cl
000318AF  0020              add [bx+si],ah
000318B1  004578            add [di+0x78],al
000318B4  636570            arpl [di+0x70],sp
000318B7  7469              jz 0x1922
000318B9  6F                outsw
000318BA  6E                outsb
000318BB  2120              and [bx+si],sp
000318BD  2D2D2D            sub ax,0x2d2d
000318C0  3E2000            and [ds:bx+si],al
000318C3  0A0A              or cl,[bp+si]
000318C5  004546            add [di+0x46],al
000318C8  4C                dec sp
000318C9  41                inc cx
000318CA  47                inc di
000318CB  53                push bx
000318CC  3A00              cmp al,[bx+si]
000318CE  43                inc bx
000318CF  53                push bx
000318D0  3A00              cmp al,[bx+si]
000318D2  45                inc bp
000318D3  49                dec cx
000318D4  50                push ax
000318D5  3A00              cmp al,[bx+si]
000318D7  45                inc bp
000318D8  7272              jc 0x194c
000318DA  6F                outsw
000318DB  7220              jc 0x18fd
000318DD  43                inc bx
000318DE  6F                outsw
000318DF  64653A20          cmp ah,[gs:bx+si]
000318E3  0000              add [bx+si],al
000318E5  0000              add [bx+si],al
000318E7  004743            add [bx+0x43],al
000318EA  43                inc bx
000318EB  3A20              cmp ah,[bx+si]
000318ED  285562            sub [di+0x62],dl
000318F0  756E              jnz 0x1960
000318F2  7475              jz 0x1969
000318F4  2F                das
000318F5  4C                dec sp
000318F6  696E61726F        imul bp,[bp+0x61],word 0x6f72
000318FB  2034              and [si],dh
000318FD  2E342E            cs xor al,0x2e
00031900  37                aaa
00031901  2D3875            sub ax,0x7538
00031904  62756E            bound si,[di+0x6e]
00031907  7475              jz 0x197e
00031909  3129              xor [bx+di],bp
0003190B  2034              and [si],dh
0003190D  2E342E            cs xor al,0x2e
00031910  37                aaa
00031911  0000              add [bx+si],al
00031913  2E7368            cs jnc 0x197e
00031916  7374              jnc 0x198c
00031918  7274              jc 0x198e
0003191A  61                popaw
0003191B  6200              bound ax,[bx+si]
0003191D  2E7465            cs jz 0x1985
00031920  7874              js 0x1996
00031922  002E726F          add [0x6f72],ch
00031926  6461              fs popaw
00031928  7461              jz 0x198b
0003192A  002E6461          add [0x6164],ch
0003192E  7461              jz 0x1991
00031930  002E6273          add [0x7362],ch
00031934  7300              jnc 0x1936
00031936  2E636F6D          arpl [cs:bx+0x6d],bp
0003193A  6D                insw
0003193B  656E              gs outsb
0003193D  7400              jz 0x193f
0003193F  0000              add [bx+si],al
00031941  0000              add [bx+si],al
00031943  0000              add [bx+si],al
00031945  0000              add [bx+si],al
00031947  0000              add [bx+si],al
00031949  0000              add [bx+si],al
0003194B  0000              add [bx+si],al
0003194D  0000              add [bx+si],al
0003194F  0000              add [bx+si],al
00031951  0000              add [bx+si],al
00031953  0000              add [bx+si],al
00031955  0000              add [bx+si],al
00031957  0000              add [bx+si],al
00031959  0000              add [bx+si],al
0003195B  0000              add [bx+si],al
0003195D  0000              add [bx+si],al
0003195F  0000              add [bx+si],al
00031961  0000              add [bx+si],al
00031963  0000              add [bx+si],al
00031965  0000              add [bx+si],al
00031967  000B              add [bp+di],cl
00031969  0000              add [bx+si],al
0003196B  0001              add [bx+di],al
0003196D  0000              add [bx+si],al
0003196F  00060000          add [0x0],al
00031973  0000              add [bx+si],al
00031975  0403              add al,0x3
00031977  0000              add [bx+si],al
00031979  0400              add al,0x0
0003197B  000A              add [bp+si],cl
0003197D  1400              adc al,0x0
0003197F  0000              add [bx+si],al
00031981  0000              add [bx+si],al
00031983  0000              add [bx+si],al
00031985  0000              add [bx+si],al
00031987  0010              add [bx+si],dl
00031989  0000              add [bx+si],al
0003198B  0000              add [bx+si],al
0003198D  0000              add [bx+si],al
0003198F  0011              add [bx+di],dl
00031991  0000              add [bx+si],al
00031993  0001              add [bx+di],al
00031995  0000              add [bx+si],al
00031997  0002              add [bp+si],al
00031999  0000              add [bx+si],al
0003199B  000C              add [si],cl
0003199D  1803              sbb [bp+di],al
0003199F  000C              add [si],cl
000319A1  1800              sbb [bx+si],al
000319A3  00D8              add al,bl
000319A5  0000              add [bx+si],al
000319A7  0000              add [bx+si],al
000319A9  0000              add [bx+si],al
000319AB  0000              add [bx+si],al
000319AD  0000              add [bx+si],al
000319AF  0004              add [si],al
000319B1  0000              add [bx+si],al
000319B3  0000              add [bx+si],al
000319B5  0000              add [bx+si],al
000319B7  0019              add [bx+di],bl
000319B9  0000              add [bx+si],al
000319BB  0001              add [bx+di],al
000319BD  0000              add [bx+si],al
000319BF  0003              add [bp+di],al
000319C1  0000              add [bx+si],al
000319C3  00E4              add ah,ah
000319C5  2803              sub [bp+di],al
000319C7  00E4              add ah,ah
000319C9  1800              sbb [bx+si],al
000319CB  0004              add [si],al
000319CD  0000              add [bx+si],al
000319CF  0000              add [bx+si],al
000319D1  0000              add [bx+si],al
000319D3  0000              add [bx+si],al
000319D5  0000              add [bx+si],al
000319D7  0004              add [si],al
000319D9  0000              add [bx+si],al
000319DB  0000              add [bx+si],al
000319DD  0000              add [bx+si],al
000319DF  001F              add [bx],bl
000319E1  0000              add [bx+si],al
000319E3  0008              add [bx+si],cl
000319E5  0000              add [bx+si],al
000319E7  0003              add [bp+di],al
000319E9  0000              add [bx+si],al
000319EB  0000              add [bx+si],al
000319ED  2903              sub [bp+di],ax
000319EF  00E8              add al,ch
000319F1  1800              sbb [bx+si],al
000319F3  0030              add [bx+si],dh
000319F5  95                xchg ax,bp
000319F6  0000              add [bx+si],al
000319F8  0000              add [bx+si],al
000319FA  0000              add [bx+si],al
000319FC  0000              add [bx+si],al
000319FE  0000              add [bx+si],al
00031A00  2000              and [bx+si],al
00031A02  0000              add [bx+si],al
00031A04  0000              add [bx+si],al
00031A06  0000              add [bx+si],al
00031A08  2400              and al,0x0
00031A0A  0000              add [bx+si],al
00031A0C  0100              add [bx+si],ax
00031A0E  0000              add [bx+si],al
00031A10  3000              xor [bx+si],al
00031A12  0000              add [bx+si],al
00031A14  0000              add [bx+si],al
00031A16  0000              add [bx+si],al
00031A18  E81800            call word 0x1a33
00031A1B  002A              add [bp+si],ch
00031A1D  0000              add [bx+si],al
00031A1F  0000              add [bx+si],al
00031A21  0000              add [bx+si],al
00031A23  0000              add [bx+si],al
00031A25  0000              add [bx+si],al
00031A27  0001              add [bx+di],al
00031A29  0000              add [bx+si],al
00031A2B  0001              add [bx+di],al
00031A2D  0000              add [bx+si],al
00031A2F  0001              add [bx+di],al
00031A31  0000              add [bx+si],al
00031A33  0003              add [bp+di],al
00031A35  0000              add [bx+si],al
00031A37  0000              add [bx+si],al
00031A39  0000              add [bx+si],al
00031A3B  0000              add [bx+si],al
00031A3D  0000              add [bx+si],al
00031A3F  0012              add [bp+si],dl
00031A41  1900              sbb [bx+si],ax
00031A43  002D              add [di],ch
00031A45  0000              add [bx+si],al
00031A47  0000              add [bx+si],al
00031A49  0000              add [bx+si],al
00031A4B  0000              add [bx+si],al
00031A4D  0000              add [bx+si],al
00031A4F  0001              add [bx+di],al
00031A51  0000              add [bx+si],al
00031A53  0000              add [bx+si],al
00031A55  0000              add [bx+si],al
00031A57  00                db 0x00
