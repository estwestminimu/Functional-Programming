const express = require('express')
const { Worker } = require('worker_threads');
const path = require("path");
const app = express()
const port = 3000


function isPrime(number) {
    return new Promise((resolve, reject) => {
        // sprawdzamy czy NIE jest wieksza od 1 i nie jest int
        if (!Number.isInteger(number) || number <= 1) {
            reject({ status: 'error', message: '0' })

        }

        //chcemy miec tylko liczby do pierwiastka 
        const sqrt = Math.floor(Math.sqrt(number))

        // wypisujemy dzielniki liczby
        //tworzymy tablice wypelniona null
        const divisors = [...Array(sqrt)]
            // wypelniamy od 0 do n-1 bo nie uwzledniamy same siebie
            .map((x, i) => i)
            .filter(x => number % x === 0) //zostawiamy tylko te livczby ktore dziela num bez reszty
            .slice(1) //usuwamy 0

        // console.log(divisors)

        if (divisors.length === 0) {
            resolve({ status: 'success', message: '1' })
        }
        else {
            reject({ status: 'error', message: '0' })
        }

    })


}



function Sort(list) {
    return new Promise((resolve, reject) => {

        if ((!Array.isArray(list)) || (list.length === 0)) {
            reject({ status: 'error', message: 'Bledne dane' })

        }

        const result = list.toSorted((a, b) => a - b)

        // console.log(result)
        resolve({ status: 'success', message: result })



    })


}


function runDictionary(list) {
    return new Promise((resolve, reject) => {
        const worker = new Worker(
            path.join(__dirname, 'worker.js'), 
            { workerData: list}
        );

    worker.on('message', resolve);
    worker.on('error', reject);
  });
}


app.use(express.json())

app.post('/prime', (req, res) => {

    const { number } = req.body


    isPrime(number)
        .then(resolved)
        .catch(rejected);




    function resolved(response) {
        res.status(200).json(response)
    }


    function rejected(response) {
        res.status(400).json(response)
    }


})

app.post('/sort', (req, res) => {
    const { list } = req.body

    Sort(list)
        .then(resolved)
        .catch(rejected)



    function resolved(response) {
        res.status(200).json(response)
    }


    function rejected(response) {
        res.status(400).json(response)
    }

});






app.post('/dictionary', async (req, res) => {
    try {
    const { list } = req.body;

    const result = await runDictionary(list);

    res.status(200).json({ status: 'success', message: result });

  } 
  catch (err) {
    res.status(400).json({ status: 'error', message: "Dane sa niepoprawne" });
  }

});





app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
