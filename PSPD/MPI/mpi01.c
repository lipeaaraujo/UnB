#include <mpi.h>
#include <unistd.h>
#include <stdio.h>

#define MASTER 0
#define TAG 0

int main() {
    int pid;
    int rank, nprocs;

    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    if (rank == MASTER) {
        for (int dest=1; dest<nprocs; dest++) {
            int x = dest*10;
            MPI_Send(&x, 1, MPI_INT, dest, TAG, MPI_COMM_WORLD);
        }
    } else {
        int recebido;
        MPI_Recv(&recebido, 1, MPI_INT, MASTER, TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("Sou o slave %d/%d! Recebi: %d\n", rank, nprocs, recebido);
    }

    printf("%d (%d|%d) --> Olá, mundo\n", getpid(), rank, nprocs);
    MPI_Finalize();
    return 0;
}