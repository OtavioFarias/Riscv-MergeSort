# Riscv-MergeSort
Implementação de um Processador RISC-V 32I em Verilog para Execução do Algoritmo MergeSort


# Organização

O monociclo geral é uma versão do RISC-V 64I com todas as instruões implementadas, sem cache. Apresenta alguns erros relacionados aos branchs e a unidade de decodificação.

As demais pastas representam uma evolução natural da implementação direcionada a utilização do ordenador MergeSort.

O riscvToMergeSortPipelineControleHazardAnaliseCache é uma variação do projeto final com a adição de registradores para contabilizar o número de ciclos, acessos as caches e número de miss.

