#include<stdio.h>  
#include<stdlib.h> 

exec sql include sqlca;  

exec sql begin declare section;  
    char user_name[20],password[20];  
exec sql end declare section;  

void main()  
{  
    printf("Enter the user name");  
    scanf("%s",user_name);  
    
    printf("Enter the password");  
    scanf("%s",password);  
    
    exec sql connect :user_name identified by :password;  
    
    

    if (sqlca.sqlcode == 0)  
        printf("Success");  
    else  
        printf("Error code:%d\n Error message:%s",sqlca.sqlcode,sqlca.sqlerrm.sqlerrmc);  
}  