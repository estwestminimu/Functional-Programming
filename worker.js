const { parentPort, workerData } = require('worker_threads');


function dictionary(list) {
return list.reduce((result, item) => {
    return {
        //kopiuje całość bo inaczej nie bedzie funkcyjnie czyli nowy obiuekt
      ...result, 
      //tworzy nam klucz i wartosc a jesli nie istnieje to ustawiamy zero i dodajemy liczbe godzin
      [item.student]: (result[item.student] || 0) + item.godziny
    };
  }, {});


}

const result = dictionary(workerData);
parentPort.postMessage(result);