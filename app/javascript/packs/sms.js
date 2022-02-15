function enviarSMS(numero_celular, numero_cliente) {
    alert('Enviou SMS para #{numero_celular} e cliente numero #{numero_cliente}!');
    let data = {
                "smss": [
                    {
                        "numero": "#{numero_celular}",
                        "idCustom": "numero_cliente",
                        "mensagem": "Envio teste novembro"
                    },
                    
                    // {
                    // "numero": "11995672927",
                    //     "idCustom": "2",
                    // "mensagem": "Envio teste via RoR"
                    // },
                ],
                "envioImediato": true,
                "centroCusto": "6141f787b62e99838c27e9dd",
            };

           
            fetch('https://v2.bestuse.com.br/api/v1/envioApi?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjE1LCJieUNDIjp0cnVlLCJpYXQiOjE2MzE3MjAzMjR9.3v4zB9VN4U18yf2syyH5djYnf_drkTViTfOV4EdSYcQ', {
                    method: "POST",
                    //mode: 'no-cors',
                    body: JSON.stringify(data),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                        },
                })

            //  Converting to JSON
            // .then(response => response.json())
            //  Displaying results to console
            //.then(json => console.log(json));

}