#include <stdio.h>

int main()
{
    int casos_teste;
    double total, media, acima_media;
    int num_alunos;
    int notas[1000];
    
    scanf("%i", &casos_teste);
    
    double porcentagem[casos_teste];
    
    for (int i = 0; i < casos_teste; i++) {
        scanf("%i", &num_alunos);
        for (int j = 0; j < num_alunos; j++) {
            scanf("%i", &notas[j]);
        }
        
        // C�lculo da m�dia
        total = 0;
        for (int j = 0; j < num_alunos; j++) {
            total = total + notas[j];
        }
            
        media = total / num_alunos;
        
        // C�lculo da quantidade de alunos acima da m�dia
        acima_media = 0;
        for (int j = 0; j < num_alunos; j++) {
            if (notas[j] > media) {
                acima_media = acima_media + 1;
            }    
        }
        
        // C�lculo da porcentagem
        porcentagem[i] = ((acima_media/num_alunos)*100);
    }
    
    for (int i = 0; i < casos_teste; i++) {
        printf("%.3lf%%\n", porcentagem[i]);
    }
    
    return 0;
}
