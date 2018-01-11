#include<stdio.h>
#include<stdlib.h>

#define BytesPerSector	512	//Bytes per sector
#define LocationOfLoader 5*BytesPerSector	//Location of loader.bin

int main() {
	char *bootBin = "boot/boot.bin";
	char *bootImg = "fishos.img";
	char tmp[BytesPerSector];
	char read;
	FILE *bootFile;
	FILE *imgFile;
	int i;
	bootFile = fopen(bootBin, "rb");	//Binary style to read boot.bin
	imgFile = fopen(bootImg, "rb+");//Binary style to read and write boot.img
	if (!bootFile) {
		printf("Can't open boot.bin\n");
		fclose(bootFile);
		fclose(imgFile);
		exit(0);
	}
	else 
		printf("Open boot.bin successly\n");
	if (!imgFile) {
		printf("Can't open boot.img\n");
		fclose(bootFile);
		fclose(imgFile);
		exit(0);
	}
	else	
		printf("Open boot.img successly\n");

	fseek(imgFile, 0, 0);			//Locate imgFile pointer at the begin of boot.img
	fseek(bootFile, 0, 0);			//Locate bootFile pointer at the begin of boot.bin
	if(fread(tmp, 1, BytesPerSector, bootFile)) {
		if (feof(bootFile))
			printf("Read boot.bin successfully\n");
		else
			printf("Read boot.bin failed\n");
	}
	i = 0;
	if (!fwrite(tmp,1, BytesPerSector, imgFile ))
		printf("Write boot.bin to fishos.img failed\n");
	else
		printf("Write boot.bin to fishos.img successly\n");
	fclose(bootFile);
	fclose(imgFile);
	return 0;
}
