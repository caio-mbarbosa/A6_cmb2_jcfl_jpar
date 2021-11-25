section .text

global bubble_sort

bubble_sort:
push ebp
mov ebp, esp

; não precisamos alocar espaço na pilha, pois as variáveis já estão aqui
mov edx, dword[ebp+12] ;tamanho do vetor
mov esi, dword[ebp+8] ;ponteiro do loop interno (esi = j)
mov edi, esi       ;ponteiro do loop externo (edi = i)

lea edx, [esi+edx*4] ;como sabemos que o si aponta para o começo do vetor, si+edx*4 (4 bytes * edx valores) aponta para o final do vetor

loop_externo:

cmp edi, edx ; i == tamanho_vetor (edx é o i de vet[i])
je end
mov eax, dword[edi]       ; eax = vet[i]     vet[0]       ; QUANDO ESI = [EBP+12]: ERRO
mov esi, edi          ; j = i + 1 (parte 1)
add esi, 4           ; j = i + 1 (parte 2)
loop_interno:
    cmp esi, edx ; j == tamanho_vetor
    je .fim_loop_interno

    mov ebx, dword[esi]   ; ebx = vet[j]            ;O CORRETO EH USAR si
    cmp eax, ebx    ; se vet[i] > vet[j] precisamos swappar
    jg .swap        ; jump se vet[i] > vet[j]
    

    .next:
    add esi, 4       ; j = j + 1
    jmp loop_interno
     

.fim_loop_interno:
    add edi, 4
    jmp loop_externo

;vet[0]

.swap:
    ; aux = vet[i]; vet[i] = vet[j]; vet[j] = aux
    ; e precisamos botar ebx onde DI aponta (di é como se fosse o i do vet[i])
    ; precisamos botar eax onde SI aponta   (si é como se fosse o j do vet[j])
    ; (assim trocando os valores entre os 2 ponteiros)
    
    mov [esi], eax
    mov [edi], ebx
    xchg eax, ebx


    jmp .next
    


end:
mov esp, ebp
pop ebp

ret



; criando novo stack frame

; NOSSA PILHA DEPOIS DE CHAMAR ESSA FUNÇÃO NO CÓDIGO EM C
; (ELA CRESCE PRA BAIXO)

; DADOS DE OUTRA STACK FRAME        
; tamanho_vetor                       
; ponteiro_vetor                      
; EIP do código em C (2 bytes)        
; EBP antigo      
                      

; -------------------------------------------------------------

; BUBBLE SORT DE INSPIRAÇÃO

; for(int i=0; i<tam; i++){
;     for(int j=i+1; i<tam; j++){
;         if(vet[i] > vet[j]){
;             tmp = vet[i]
;             vet[i] = vet[j]
;             vet[j] = tmp
;         }
;     }
; }