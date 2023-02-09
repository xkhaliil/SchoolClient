import express from 'express'
import bodyparser from 'body-parser'
import admin from 'firebase-admin'
import serviceAccount from './certificate/firebase.json' assert {type: "json"};

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const app = express()
app.use(bodyparser.json())

app.get('/', (res) => {
    res.status(200).send("Hello")
})

app.post('/firebase/notification', (req, res) => {
    //const message = req.body.message

    const message = {
        data: {
            title: "hello",
            body: "e5dem 5edma jdida"
        },
        topic: "annonce"
    };

    admin.messaging().send(message)
        .then(response => {
            res.status(200).send("Notification sent successfully")
        })
        .catch(error => {
            console.log(error);
        });

})

app.listen(80, () => {
    console.log("listening to port 80")
})
