OBJ=test.o
PCSRC=test.pc
SRC=test.c
CC=gcc
PROC_FLAGS=SQLCHECK=SEMANTICS
PROC_CONN=userid=insub
PROC=proc

LDLIB=/$(ORACLE_HOME)/lib
FLAGS=-ldl -lm -lclntsh -g       
INC=-I/app/oracle/product/12.1.0/precomp/public/

TARGET=test

$(TARGET) : $(OBJ)
	$(CC) -o $(TARGET)  $(OBJ) -L$(LDLIB) $(FLAGS) $(INC)

$(OBJ) : $(SRC)
	$(CC) -c $(SRC) $(INC) $(FLAGS)

$(SRC) : $(PCSRC)
	$(PROC) $(PROC_CONN)/123 $(PROC_FLAGS) $(PCSRC)

r : all
	./$(TARGET) 

clean : 
	rm -rf $(OBJ) $(SRC) $(TARGET)*.lis 

fclean : clean
	rm -rf $(TARGET) 

all : $(TARGET)
