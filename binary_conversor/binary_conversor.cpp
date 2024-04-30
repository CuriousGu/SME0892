#include <cmath>


int convert_int_to_binary(int n){
    int r; 
    int binary; 
    r = binary = n % 2; 
    int q = n / 2; 
    int i = 1; 

    while (q != 0){
        r = q % 2; 
        q = q / 2; 

        binary = binary + r * pow(10, i); 
        i ++; 

    }

    return binary; 
}
