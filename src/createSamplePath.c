#include "R.h"
#include "Rinternals.h"


// Function createSamplePath
// This function return an array of paired node number 
// of size (size). The array returned is the one 
// specified by the offset
// 
// Arguments:
// total_n        = number of nodes in g1
// offset (1:...) = starting position in pathways
//                   note: the total number of offset is ((total_n*(total_n-1)/2)/size)+1
// size           = size of sampling (returned array)
//
// Return
// And 
void createSamplePath(int *total_n, int *offset, int *size, int* path){
int i, j, k, t,stotal,ssize, soffset;
ssize=*size;
soffset=*offset;
stotal=*total_n;
k=0;
t=0;
//Rprintf("%i %i %i", stotal, soffset, ssize);
//PROTECT(z = allocVector(INTSXP, ssize));
 for(j = 0; j < stotal; j++) {
	for(i = j; i < stotal; i++){
		
		if (i>j) {			
			if (((t/ssize)+1)==soffset) {			
				path[k] =i+1;
				path[k+1] =j+1;
				k=k+2;
			}
			t++;
		}
		if (((t/ssize)+1)>soffset) break;
	}
}
//UNPROTECT(1); /*z*/
//return z;
}
