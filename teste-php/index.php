<?php
//exercicio 1
//1) Utilizando a variável $arrayDeClientes de um echo no nome do segundo cliente.
$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
$cliente1 = new stdClass();
$cliente1->nome = $nomes[0];
$cliente2 = new stdClass();
$cliente2->nome = $nomes[1];
$cliente3 = new stdClass();
$cliente3->nome = $nomes[2];
$arrayDeClientes = [$cliente1, $cliente2, $cliente3];
//resposta
echo ($cliente2->nome);

//exercicio 2
//2) Utilize a estrutura de dados $arrayDeNascimento para adicionar na estrutura$arrayDeClientes a data de nascimento de cada cliente.
$arrayDeNascimento = [
    'Francisco Souza' => '10-12-1996',
    'Arthur Golveia' => '14-01-2000',
    'Guilherme Rosa' => '26-05-1985',
    'Marcelo Planalto' => '26-05-1985'
    ];

    foreach($arrayDeNascimento as $nome => $data_nasc){

        for($i=0; $i <= count($arrayDeClientes); $i++){

            if($arrayDeClientes[$i]->nome == $nome){

                $arrayDeClientes[$i]->data_nasc = $data_nasc;

            }
        }
    }

//exercicio 3
//3) Faça a ordenação e impressão da estrutura $arrayDeClientes resultante do exercício 2 pela data de nascimento (pode ser ascendente ou descendente).
// Exemplo de impressão
// Fulano nascido em 00-00-0000
// Ciclano nascido em 00-00-0000

function comparaDatas($a, $b){

    $strDataA = strtotime($a->data_nasc);
    $strDataB = strtotime($b->data_nasc);

    return strcmp($strDataA, $strDataB);
}

usort($arrayDeClientes, "comparaDatas");

foreach($arrayDeClientes as $cliente){
    echo $cliente->nome . " nascido em: " . $cliente->data_nasc . '<br>';
}

?>