PUBLIC void	out_byte(t_port port, t_8 value);
PUBLIC t_8	in_byte(t_port port);
PUBLIC void	disp_str(char *pszInfo);
PUBLIC void disp_color_str(char *info, int color);

PUBLIC void init_prot();
PUBLIC t_32	seg2phys(t_16 seg);

PUBLIC void delay(int time);

void restart();

void TestA();
