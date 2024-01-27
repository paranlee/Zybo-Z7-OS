#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <errno.h>

#define REG(address) *(volatile unsigned int*)(address)
#define GPIOPS_BASE   (0xE000A000)
#define GPIOPS_DATA_0 (0x0040)
#define GPIOPS_DIRM_0 (0x0204)
#define GPIOPS_OEN_0  (0x0208)

int main(int argc, char **argv)
{
	printf("Hello World!\n");

	int address;	/* GPIO Virtual address to register (user space) */
	int fd;

	/* Open device file for memory access */
	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
		perror("open");
		return -1;
	}

	/* ARM(CPU) Mapping physical address → virtual address from */
	address = (int)mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIOPS_BASE);
	if (address == MAP_FAILED) {
		perror("mmap");
		close(fd);
		return -1;
	}

	/* Set MIO7 as output */
	REG(address + GPIOPS_DIRM_0) |= 1 << 7;
	REG(address + GPIOPS_OEN_0)  |= 1 << 7;
	while(1) {
		/* Set MIO7 as High */
		REG(address + GPIOPS_DATA_0) |= 1 << 7;
		usleep(1*1000*1000);
		/* Set MIO7 as Low */
		REG(address + GPIOPS_DATA_0) &= ~(1 << 7);
		usleep(1*1000*1000);
	}

	/* Freeing up resources that have been used up */
	munmap((void*)address, 0x1000);
	close(fd);

	return 0;
}
