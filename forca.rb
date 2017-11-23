require_relative 'ui' 

# dada a palavra mágica, `programador` para uma criança,
# palavra_secreta = "programador"
# chute = "o"
# total_encontrado = 0

# Ai ela olha a primeira letra da palavra (aponta para ela com o dedo!).
# for i = 0..(palavra_secreta.size - 1)
#     letra = palavra_secreta[i]
#     Essa letra é a letra `o` que estou procurando? Não.
#     É? Não.
#     É? Sim!
#     Então soma um no cantinho do papel (na memória).
#     if letra == chute
#         total_encontrado += 1
#     end
# end

# No fim,
# se o número é zero,
# significa que a letra não está lá dentro, aumenta um erro
# se o número é diferente de zero,
# ele representa quantas vezes encontrou.
# if total_encontrado == 0
#     puts "Letra não encontrada!"
#     erros += 1
# else
#     puts "Letra encontrada #{total_encontrado} vezes!"
# end


#nosso código
# def joga(nome)
#     palavra_secreta = sorteia_palavra_secreta

#     erros = 0
#     chutes = []
#     pontos_ate_agora = 0

#     while erros < 5
#         chute = pede_um_chute chutes, erros
#         chutes << chute

#         chutou_uma_unica_letra = chute.size == 1
#         if chutou_uma_unica_letra
#             total_encontrado = 0

#             for i = 0..(palavra_secreta.size - 1)
#                 letra = palavra_secreta[i]
#                 if letra == chute
#                     total_encontrado += 1
#                 end
#             end

#             if total_encontrado == 0
#                 puts "Letra não encontrada!"
#                 erros += 1
#             else
#                 puts "Letra encontrada #{total_encontrado} vezes!"
#             end
#         else
#             acertou = chute == palavra_secreta
#             if acertou
#                 puts "Parabéns! Acertou!"
#                 pontos_ate_agora += 100
#                 break
#             else
#                 puts "Que pena... errou!"
#                 pontos_ate_agora -= 30
#             end
#         end

#     end

#     puts "Você ganhou #{pontos_ate_agora} pontos."
# end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    ponto_ate_agora = 0

    while erros < 5
        chute = pede_um_chute chutes, erros
        if chutes.include? chute
            avisa_chute_repetido chute
            next
        end
        #Verificar aqui que já chutei
        chutes << chute

        chutou_uma_unica_letra = chute.size == 1
        if chutou_uma_unica_letra
            #count - Ele conta o número de aparições de um caracter em uma String (entre outras utilizações possíveis).
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count letra_procurada
            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros +=1
            end
        end
    end

    avisa_pontos pontos_ate_agora
end    

# def conta(texto, caracter)
#     total_encontrado = 0

#     # for i = 0..texto.size
#     #     letra = texto[i]
#     #     if letra == caracter
#     #         total_encontrado += 1
#     #     end
#     # end

#     #chars que devolve um array de caracteres
#     for letra in texto.chars
#         if letra == caracter
#             total_encontrado += 1
#         end
#     end

#     total_encontrado
# end

nome = da_boas_vindas
palavra = escolhe_palavra_secreta

loop do 
    joga nome
    if nao_quer_jogar?
        break
    end
end

