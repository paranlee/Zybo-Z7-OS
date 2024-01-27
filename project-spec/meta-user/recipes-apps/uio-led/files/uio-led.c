#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <errno.h>

#define REG(address) *(volatile unsigned int*)(address)

int main(int argc, char **argv)
{
	printf("Hello World!\n");

	int address;	/* GPIO Virtual address to register (user space) */
	int fd;

	/* Open device file for memory access */
	if ((fd = open("/dev/uio0", O_RDWR | O_SYNC)) < 0) {
		perror("open");
		return -1;
	}

	/* ARM(CPU) Mapping physical address → virtual address from */
	address = (int)mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (address == MAP_FAILED) {
		perror("mmap");
		close(fd);
		return -1;
	}

	while(1) {
		/* Set LEDs(PL GPIO) as High */
		REG(address) = 0x0F;
		usleep(1*1000*1000);
		/* Set LEDs(PL GPIO) as Low */
		REG(address) = 0x00;
		usleep(1*1000*1000);
	}

	/* Freeing up resources that have been used up */
	munmap((void*)address, 0x1000);
	close(fd);

	return 0;
}
