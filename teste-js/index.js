// 1) Percorra o objeto clientes e mostre o nome da cada cliente da seguinte maneira: “ultimoSobrenome, primeiroNome”;
var clientes = [
    {'id': 1, 'nome': 'Luis Santos Silveira', 'idade': 18},
    {'id': 2, 'nome': 'Ricardo Lopes Alves', 'idade': 30},
    {'id': 3, 'nome': 'Gustavo Silva Junior', 'idade': 25}
    ];

    function retornaNomeSobrenome(cliente){

        let nomeArray = cliente.nome.split(' ');
        let nomeFormat = nomeArray[nomeArray.length -1] + ', ' + nomeArray[0];

        const nomeSobrenome = {
            nome: nomeFormat
        }

        return nomeSobrenome
    }

    const exibeNomeSobrenome = clientes.map(retornaNomeSobrenome);
    console.log(exibeNomeSobrenome);

// 2) Formate a variável “numero” para o seguinte formato: “(XX)_X_XXXX-XXXX”
var numero = "5(1)9-876-543-21";

const formata = (numero) => {
    numero = numero.replace(/\D+/g, '');
    return `(${numero.substring(0, 2)}) ${numero.substring(2, 3)} ${numero.substring(3, 7)}-${numero.substring(numero.length - 4)}`;
}

formata(numero);

// Bônus:
// 3) Qual a ordem dos prints no console?
    //R: função C, função D
// 4) Existe algum erro nesse código? Se sim, comente sobre?
    //R: