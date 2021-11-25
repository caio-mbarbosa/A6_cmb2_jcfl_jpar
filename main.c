#include <stdio.h>

extern void bubble_sort(int* vet, int tam);

int main()
{
    int tam;


    printf("Digite o tamanho do seu vetor: ");
    scanf("%d", &tam);

    int vetor[tam];

    for(int i=0;i<tam;i++){
        printf("Digite o valor %d do seu vetor\n", i+1);
        scanf("%d", &vetor[i]);
    }


    bubble_sort(vetor, tam);


//Aqui vamos imprimir o vetor ordenado
    printf("Aqui esta seu vetor ordenado:\n");
    for(int i=0;i<tam;i++){
       
        printf("%d ", vetor[i]);
    }
    return 0;
}