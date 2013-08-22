###############################################################################
#
# "FastLZ" compression library
#
###############################################################################

CFILES = coffeecatch.c

all:
	make gcc

clean:
	rm -f *.o *.obj *.so* *.dll *.exe *.pdb *.exp *.lib

tar:
	rm -f coffeecatch.tgz
	tar cvfz coffeecatch.tgz coffeecatch.txt coffeecatch.c coffeecatch.h Makefile LICENSE README.md

gcc:
	gcc -c -fPIC -O3 -g3 -pthread \
		-W -Wall -Wextra -Werror -Wno-unused-function \
		-D_REENTRANT -D_GNU_SOURCE \
		$(CFILES)
	gcc -shared -fPIC -O3 -Wl,-O1 -Wl,--no-undefined \
		-rdynamic -shared -Wl,-soname=libcoffeecatch.so \
		coffeecatch.o -o libcoffeecatch.so \
		-ldl -lpthread

