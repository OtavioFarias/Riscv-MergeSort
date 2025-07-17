# Criando o clock real a partir da porta 'realClock' no topo

create_clock -name {realClock} -period 2.000 -waveform { 0.000 1.000 } realClock

# Configurando delay de entrada em relação ao clock

set_input_delay -clock realClock 0.1 [all_inputs]

set_output_delay -clock realClock 0.1 [all_outputs]

